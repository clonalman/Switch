{******************************************************************************}
{*                                                                            *}
{*    _                ___        _..-._                                      *}
{*    \`.|\..----...-'`   `-._.-'' _.-..'                                     *}
{*    /  ' `         ,       __.-''                                           *}
{*    )/` _/     \   `-_,   /                                                 *}
{*    `-'" `"\_  ,_.-;_.-\_ ',                                                *}
{*        _.-'_./   {_.'   ; /  Switch                                        *}
{*       {_.-``-'         {_/   Copyright  2010-2015, gaudi.gao               *}
{*                                                                            *}
{******************************************************************************}
unit uPipeConnection;

interface

uses
  SysUtils, Classes, Windows;

const
  PIPE_TIMEOUT = 1000;

type
  TPipeReader = class;
  TPipeWriter = class;

  TPipeConnection = class(TObject)
  private
    FBufferSize: Integer;
    FError: Cardinal;
    FOverlapped: TOverlapped;
    FPendingIO: Boolean;
    FPipeHandle: THandle;
    FPipeName: string;
    FReader: TPipeReader;
    FWriter: TPipeWriter;
    function CreateNamedPipeInServer(PipeName: string; BufferSize: Integer):
        THandle;
    function GetConnected: Boolean;
    procedure SetError(const Value: Cardinal);
  protected
    property BufferSize: Integer read FBufferSize;
    property Error: Cardinal read FError write SetError;
    property PipeHandle: THandle read FPipeHandle;
  public
    constructor Create(PipeName: string; BufferSize: Integer);
    destructor Destroy; override;
    procedure Connect;
    procedure ConnectTest;
    function CreateOverlapped: TOverlapped;
    procedure Disconnect;
    procedure Send(Content: string);
    property Connected: Boolean read GetConnected;
    property PendingIO: Boolean read FPendingIO;
    property Reader: TPipeReader read FReader;
    property Writer: TPipeWriter read FWriter;
  end;

  TPipeReader = class(TObject)
  private
    FConnection: TPipeConnection;
    FOverlapped: TOverlapped;
  public
    constructor Create(AConnection: TPipeConnection);
    destructor Destroy; override;
    procedure Read(AStream: TStream);
    function ReadString: string;
    property Connection: TPipeConnection read FConnection;
  end;

  TPipeWriter = class(TObject)
  private
    FConnection: TPipeConnection;
    FOverlapped: TOverlapped;
  public
    constructor Create(AConnection: TPipeConnection);
    destructor Destroy; override;
    procedure Write(AStream: TStream);
    procedure WriteString(AContent: string);
    property Connection: TPipeConnection read FConnection;
  end;

implementation

{
******************************* TPipeConnection ********************************
}
constructor TPipeConnection.Create(PipeName: string; BufferSize: Integer);
begin
  FPipeName := PipeName;
  FBufferSize := BufferSize;
  FPipeHandle := CreateNamedPipeInServer(PipeName, BufferSize);
  FOverlapped.hEvent := CreateEvent(nil, True, False, nil);
  FReader := TPipeReader.Create(Self);
  FWriter := TPipeWriter.Create(Self);
end;

destructor TPipeConnection.Destroy;
begin
  FreeAndNil(FWriter);
  FreeAndNil(FReader);
  if FPipeHandle <> INVALID_HANDLE_VALUE then
  begin
    CloseHandle(FPipeHandle);
    FPipeHandle := INVALID_HANDLE_VALUE;
  end;
  if FOverlapped.hEvent <> INVALID_HANDLE_VALUE then
  begin
    CloseHandle(FOverlapped.hEvent);
    FOverlapped.hEvent := INVALID_HANDLE_VALUE;
  end;
  inherited;
end;

procedure TPipeConnection.Connect;
var
  TempError: Cardinal;
begin
  if not FPendingIO then
  begin
    ResetEvent(FOverlapped.hEvent);
    if not ConnectNamedPipe(FPipeHandle, @FOverlapped) then
       Error := GetLastError;
  end else
  begin
    if not GetOverlappedResult(FPipeHandle, FOverlapped, TempError, True) then
      FPendingIO := False;
  end;
end;

procedure TPipeConnection.ConnectTest;
var
  I: Cardinal;
begin
  if FPipeHandle <> INVALID_HANDLE_VALUE then
    CallNamedPipe(PChar(FPipeName), nil, 0, nil, 0, i, 10);
end;

function TPipeConnection.CreateNamedPipeInServer(PipeName: string; BufferSize:
    Integer): THandle;
var
  lConnected: Boolean;
  lSecurityDescriptor: _SECURITY_DESCRIPTOR;
  lSecurityAttribute: SECURITY_ATTRIBUTES;
begin
  Result := INVALID_HANDLE_VALUE;
  FillChar(lSecurityAttribute, SizeOf(lSecurityAttribute), 0);
  InitializeSecurityDescriptor(@lSecurityDescriptor, SECURITY_DESCRIPTOR_REVISION);
  SetSecurityDescriptorDacl(@lSecurityDescriptor, true, nil, False);
  lSecurityAttribute.nLength := SizeOf(lSecurityAttribute);
  lSecurityAttribute.bInheritHandle := True;
  lSecurityAttribute.lpSecurityDescriptor := @lSecurityDescriptor;

  Result := Windows.CreateNamedPipe(
        PChar(PipeName),         // pipe name
        PIPE_ACCESS_DUPLEX or
        FILE_FLAG_OVERLAPPED,
        PIPE_TYPE_MESSAGE or      // message type pipe
        PIPE_READMODE_BYTE or     // byte-read mode
        PIPE_WAIT,                // blocking mode
        PIPE_UNLIMITED_INSTANCES, // max. instances
        BufferSize,               // output buffer size
        BufferSize,               // input buffer size
        PIPE_TIMEOUT,             // client time-out
        @lSecurityAttribute);

    if (Result = INVALID_HANDLE_VALUE) then
      RaiseLastOSError;
end;

function TPipeConnection.CreateOverlapped: TOverlapped;
begin
  ZeroMemory(@Result, SizeOf(TOverlapped));
  Result.hEvent := FOverlapped.hEvent;
end;

procedure TPipeConnection.Disconnect;
begin
  DisconnectNamedPipe(FPipeHandle);
end;

function TPipeConnection.GetConnected: Boolean;
var
  Dummy: Cardinal;
begin
  if PendingIO then
  begin
    case WaitForSingleObject(FOverlapped.hEvent, INFINITE) of
      WAIT_OBJECT_0:
      begin
        Result := True;
        ResetEvent(FOverlapped.hEvent);
      end;
    else
      Result := False;
      FPendingIO := False;
    end;
  end else
  begin
    Result := GetOverlappedResult(FPipeHandle, FOverlapped, Dummy, False);
    if not Result then
    begin
      Error := GetLastError;
    end;
  end;
end;

procedure TPipeConnection.Send(Content: string);
begin
  Writer.WriteString(Content);
end;

procedure TPipeConnection.SetError(const Value: Cardinal);
begin
  FError := Value;
  case FError of
     ERROR_PIPE_CONNECTED: SetEvent(FOverlapped.hEvent);
     ERROR_IO_PENDING: FPendingIO := True;
     ERROR_IO_INCOMPLETE:;
     ERROR_BROKEN_PIPE:
      begin
        Disconnect;
        Connect;
      end;
  end;
end;




{
********************************* TPipeWriter **********************************
}
constructor TPipeWriter.Create(AConnection: TPipeConnection);
begin
  FConnection := AConnection;
end;

destructor TPipeWriter.Destroy;
begin
  CloseHandle(FOverlapped.hEvent);
  inherited;
end;

procedure TPipeWriter.Write(AStream: TStream);
var
  lBytesRead, lBytesWritten, dwLastError: DWORD;
  lSuccess: BOOL;
  lDataSize, lBufferSize: Integer;
  lBuffer: PChar;
begin
  lBufferSize := FConnection.BufferSize;
  GetMem(lBuffer, lBufferSize);
  try
    lDataSize := AStream.Size;
    lSuccess := WriteFile(FConnection.PipeHandle, lDataSize, SizeOf(lDataSize), lBytesWritten, @FOverlapped);

    if not lSuccess then
    begin
      dwLastError := GetLastError;
      case dwLastError of
        ERROR_BROKEN_PIPE: Exit;
        ERROR_IO_PENDING: //正在发送数据
        begin
          if WAIT_OBJECT_0 = WaitForSingleObject(FOverlapped.hEvent, INFINITE) then
          begin
             ResetEvent(FOverlapped.hEvent);
             lSuccess := GetOverlappedResult(FConnection.PipeHandle, FOverlapped, lBytesWritten, True);
          end;
          if not lSuccess then Exit;
        end;
      else
        RaiseLastOSError;
      end;
    end;

    while lDataSize > 0 do
    begin
      lBytesRead := AStream.Read(lBuffer^, lBufferSize);
      Dec(lDataSize, lBytesRead);
      lSuccess := WriteFile(FConnection.PipeHandle, lBuffer^, lBytesRead, lBytesWritten, @FOverlapped);

      if not lSuccess then
      begin
        dwLastError := GetLastError;
        case dwLastError of
          ERROR_BROKEN_PIPE: Exit;
          ERROR_IO_PENDING:
          begin
            if WAIT_OBJECT_0 = WaitForSingleObject(FOverlapped.hEvent, INFINITE) then
            begin
              ResetEvent(FOverlapped.hEvent);
              lSuccess := GetOverlappedResult(FConnection.PipeHandle, FOverlapped, lBytesWritten, True);
            end;
            if not lSuccess then RaiseLastOSError;
          end;
        else
          RaiseLastOSError;
        end;
      end;
    end;
    FlushFileBuffers(FConnection.PipeHandle);
  finally
    FreeMem(lBuffer);
  end;
end;

procedure TPipeWriter.WriteString(AContent: string);
var
  lWriteStream: TMemoryStream;
  lData: RawByteString;
begin
  lWriteStream := TMemoryStream.Create;
  try
    lData := AnsiToUtf8(AnsiString(AContent));
    lWriteStream.Write(lData[1], Length(lData));
    lWriteStream.Position := 0;
    Write(lWriteStream);
  finally
    lWriteStream.Free;
  end;
end;

{
********************************* TPipeReader **********************************
}
constructor TPipeReader.Create(AConnection: TPipeConnection);
begin
  FConnection := AConnection;
  FOverlapped.hEvent := CreateEvent(nil, True, False, nil);
end;

destructor TPipeReader.Destroy;
begin
  CloseHandle(FOverlapped.hEvent);
  inherited;
end;

procedure TPipeReader.Read(AStream: TStream);
var
  lBytesRead, dwLastError: DWORD;
  lSuccess: BOOL;
  lDataSize, lBufferSize: Integer;
  lBuffer: PChar;
begin
  lBufferSize := FConnection.BufferSize;
  GetMem(lBuffer, lBufferSize);
  try
    lSuccess := ReadFile(FConnection.PipeHandle, lDataSize, SizeOf(lDataSize), lBytesRead, @FOverlapped);

    if not lSuccess then
    begin
      dwLastError := GetLastError;
      case dwLastError of
        ERROR_IO_PENDING:
        begin
          if WAIT_OBJECT_0 = WaitForSingleObject(FOverlapped.hEvent, INFINITE) then
          begin
             ResetEvent(FOverlapped.hEvent);
             lSuccess := GetOverlappedResult(FConnection.PipeHandle, FOverlapped, lBytesRead, True);
          end;
          if not lSuccess then Exit;
        end;
        ERROR_BROKEN_PIPE: Exit;
      else
        RaiseLastOSError;
      end;
    end;

    while lDataSize > 0 do
    begin
      lSuccess := ReadFile(FConnection.PipeHandle, lBuffer^, lBufferSize, lBytesRead, @FOverlapped);

      if not lSuccess then
      begin
        dwLastError := GetLastError;
        if dwLastError = ERROR_IO_PENDING then
        begin
          if WAIT_OBJECT_0 = WaitForSingleObject(FConnection.PipeHandle, INFINITE) then
          begin
             ResetEvent(FOverlapped.hEvent);
             lSuccess := GetOverlappedResult(FConnection.PipeHandle, FOverlapped, lBytesRead, True);
          end;
          if not lSuccess then RaiseLastOSError;
        end else
        if dwLastError <> ERROR_MORE_DATA then RaiseLastOSError;
      end;

      if lBytesRead > 0 then
        AStream.Write(lBuffer^, lBytesRead);

      Dec(lDataSize, lBytesRead);
    end;

    if not lSuccess then
      RaiseLastOSError;
  finally
    FreeMem(lBuffer);
  end;
end;

function TPipeReader.ReadString: string;
var
  lReadStream: TMemoryStream;
  lData: AnsiString;
begin
  Result := '';
  lReadStream := TMemoryStream.Create;
  try
    try
      Read(lReadStream);
      if lReadStream.Size > 0 then
      begin
        SetLength(lData, lReadStream.Size);
        lReadStream.Position := 0;
        lReadStream.Read(lData[1], Length(lData));
        Result := lData;
      end;
    except
      on E: EOSError do
      begin
        if not (E.ErrorCode in [ERROR_NO_DATA, ERROR_BROKEN_PIPE]) then
          raise;
      end;
    end;
  finally
    lReadStream.Free;
  end;
end;

end.
