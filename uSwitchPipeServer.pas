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
unit uSwitchPipeServer;

interface

uses
  SysUtils, Classes, SyncObjs, uPipeServer, uPipeConnection, uPipeMessage, uSwitchClient;

type
  TSwitchPipeServer = class(TNamedPipeServer)
  private
    FClient: TSwitchClient;
  protected
    procedure OnMessageReceived(AConnection: TPipeConnection; AMessage:
        TPipeMessage); override;
  public
    constructor Create(const AServerID: string); override;
    destructor Destroy; override;
  end;

implementation

var
  Section: TCriticalSection;

{
****************************** TSwitchPipeServer *******************************
}
constructor TSwitchPipeServer.Create(const AServerID: string);
begin
  inherited Create(AServerID);
  FClient := TSwitchClient.Create(Self);
end;

destructor TSwitchPipeServer.Destroy;
begin
  FreeAndNil(FClient);
  inherited;
end;

procedure TSwitchPipeServer.OnMessageReceived(AConnection: TPipeConnection;
    AMessage: TPipeMessage);
begin
  try
    Section.Enter;
    try
      FClient.OnMessageReceived(AConnection, AMessage);
    finally
      Section.Leave;
    end;
  except
    on E: Exception do
    begin
      AConnection.Send(TPipeMessage.MakeMessage(E));
    end;
  end;

end;

initialization
  Section := TCriticalSection.Create;

finalization
  FreeAndNil(Section);

end.
