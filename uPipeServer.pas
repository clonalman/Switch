{******************************************************************************}
{*                                                                            *}
{*    _                ___        _..-._                                      *}
{*    \`.|\..----...-'`   `-._.-'' _.-..'                                     *}
{*    /  ' `         ,       __.-''                                           *}
{*    )/` _/     \   `-_,   /                                                 *}
{*    `-'" `"\_  ,_.-;_.-\_ ',                                                *}
{*        _.-'_./   {_.'   ; /  Switch Service                                *}
{*       {_.-``-'         {_/   Copyright  2010-2015, gaudi.gao               *}
{*                                                                            *}
{******************************************************************************}
unit uPipeServer;

interface

uses
  SysUtils, Classes, Contnrs, Windows, ActiveX, Messages,
  uPipeConnection, uPipeMessage;

const
  BUFFER_SIZE = 4096;

type
  TNamedPipeServer = class;

  TPipeThread = class(TThread)
  private
    FFatalError: TObject;
  protected
    procedure DoExecute; virtual; abstract;
    procedure Execute; override;
    procedure RaiseException;
    property FatalError: TObject read FFatalError write FFatalError;
  end;

  TPipeThreadListener = class(TPipeThread)
  private
    FPipeName: string;
    FServer: TNamedPipeServer;
    procedure EmulateConnect;
  protected
    procedure DoExecute; override;
  public
    property PipeName: string read FPipeName write FPipeName;
    property Server: TNamedPipeServer read FServer write FServer;
  end;

  TPipeThreadWorker = class(TPipeThread)
  private
    FConnection: TPipeConnection;
    FServer: TNamedPipeServer;
  protected
    procedure DoExecute; override;
  public
    property Connection: TPipeConnection read FConnection write FConnection;
    property Server: TNamedPipeServer read FServer write FServer;
  end;

  TNamedPipeServer = class(TComponent)
  private
    FBufferSize: Integer;
    FConnections: TThreadList;
    FListener: TPipeThreadListener;
    FServerID: string;
    function GetBufferSize: Integer;
    function GetServerID: string;
    procedure SetBufferSize(const Value: Integer);
  protected
    procedure OnMessageReceived(AConnection: TPipeConnection; AMessage:
        TPipeMessage); virtual; abstract;
    property Listener: TPipeThreadListener read FListener;
  public
    constructor Create(const AServerID: string); virtual;
    destructor Destroy; override;
    procedure Start;
    property BufferSize: Integer read GetBufferSize write SetBufferSize default
        BUFFER_SIZE;
    property Connections: TThreadList read FConnections;
    property ServerID: string read GetServerID;
  end;


implementation

{
********************************* TPipeThread **********************************
}
procedure TPipeThread.Execute;
begin
  CoInitialize(nil);
  try
    try
      DoExecute;
    except
      on E: TObject do
      begin
        FatalError := E;
        Synchronize(RaiseException);
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

procedure TPipeThread.RaiseException;
begin
  raise FatalError;
end;


{
***************************** TPipeThreadListener ******************************
}
procedure TPipeThreadListener.DoExecute;
var
  Connection: TPipeConnection;
  List: TList;
  Worker: TPipeThreadWorker;
begin
  while not Terminated do
  begin
    Connection := TPipeConnection.Create(FPipeName, FServer.BufferSize);
    Connection.Connect;
    if Connection.Connected and not Terminated then
    begin
      List := Server.Connections.LockList;
      try
        List.Add(Connection);
      finally
        Server.Connections.UnlockList;
      end;

      Worker := TPipeThreadWorker.Create(True);
      Worker.FreeOnTerminate := True;
      Worker.Server := Server;
      Worker.Connection := Connection;
      Worker.Start;
    end else
    begin
      Connection.Disconnect;
      Connection.Free;
    end;
  end;
end;

procedure TPipeThreadListener.EmulateConnect;
var
  I: Cardinal;
begin
  CallNamedPipe(PChar(FPipeName), nil, 0, nil, 0, i, 10);
end;



{
****************************** TPipeThreadWorker *******************************
}
procedure TPipeThreadWorker.DoExecute;
var
  lData: Utf8String;
  lLock: TList;
  lReadStream: TMemoryStream;
  lMessage: TPipeMessage;
begin
  try
    while not Terminated do
    begin
      lReadStream := TMemoryStream.Create;
      try
        try
          Connection.Reader.Read(lReadStream);
          if lReadStream.Size > 0 then
          begin
            SetLength(lData, lReadStream.Size);
            lReadStream.Position := 0;
            lReadStream.Read(lData[1], Length(lData));
          end else Break;
        except
          Break;
        end;
      finally
        lReadStream.Free;
      end;

      lMessage := TPipeMessage.Create(lData);
      try
        FServer.OnMessageReceived(Connection, lMessage);
      finally
        lMessage.Free;
      end;
    end;
  finally
    lLock := Server.Connections.LockList;
    try
      lLock.Remove(Connection);
    finally
      Server.Connections.UnlockList;
    end;
    Connection.Disconnect;
    Connection.Free;
  end;
end;


{
******************************* TNamedPipeServer *******************************
}
constructor TNamedPipeServer.Create(const AServerID: string);
begin
  CoInitialize(nil);
  FServerID := AServerID;
  FConnections := TThreadList.Create;
end;

destructor TNamedPipeServer.Destroy;
begin
  if Assigned(FListener) then
  begin
    FListener.Terminate;
    FListener.EmulateConnect;
  end;
  FreeAndNil(FConnections);
  CoUninitialize;
  inherited;
end;

function TNamedPipeServer.GetBufferSize: Integer;
begin
  if FBufferSize = 0 then
    FBufferSize := BUFFER_SIZE;
  Result := FBufferSize;
end;

function TNamedPipeServer.GetServerID: string;
begin
  Result := FServerID;
  if Result = '' then
    Result := IntToStr(GetCurrentProcessId);
end;

procedure TNamedPipeServer.SetBufferSize(const Value: Integer);
begin
  if Value < 1024 then
    FBufferSize := 1024
  else
    FBufferSize := Value;
end;

procedure TNamedPipeServer.Start;
begin
  FListener := TPipeThreadListener.Create(True);
  FListener.FreeOnTerminate := True;
  FListener.Server := Self;
  FListener.PipeName := '\\.\pipe\'+ ServerID;
  FListener.Start;
end;

end.
