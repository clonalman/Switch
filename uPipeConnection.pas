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
    function ReadSize: Integer;
  public
    constructor Create(AConnection: TPipeConnection);
    destructor Destroy; override;
    procedure Read(AStream: TStream);
    function ReadString: string;
  end;

  TPipeWriter = class(TObject)
  private
    FConnection: TPipeConnection;
    FOverlapped: TOverlapped;
    procedure WriteSize(DataSize: Integer);
  public
    constructor Create(AConnection: TPipeConnection);
    destructor Destroy; override;
    procedure Flush;
    procedure Write(AStream: TStream);
    procedure WriteString(AContent: string);
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
        PIPE_READMODE_MESSAGE or  // byte-read mode
        PIPE_WAIT,                // blocking mode
        PIPE_UNLIMITED_INSTANCES, // max. instances
        BufferSize,               // output buffer size
        BufferSize,               // input buffer size
        PIPE_TIMEOUT,             // client time-out
        @lSecurityAttribute);

    if (Result = INVALID_HANDLE_VALUE) then
      RaiseLastOSError;
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
  Writer.Flush;
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
  FOverlapped.hEvent := CreateEvent(nil, True, False, nil);
end;

destructor TPipeWriter.Destroy;
begin
  CloseHandle(FOverlapped.hEvent);
  inherited;
end;

procedure TPipeWriter.Flush;
begin
  FlushFileBuffers(FConnection.PipeHandle);
end;

procedure TPipeWriter.WriteSize(DataSize: Integer);
var
  lBytesWritten: DWORD;
begin
  if not WriteFile(FConnection.PipeHandle, DataSize, SizeOf(DataSize), lBytesWritten, @FOverlapped) then
  begin
    case GetLastError of
      ERROR_IO_PENDING:
        begin
          if WaitForSingleObject(FOverlapped.hEvent, INFINITE) = WAIT_OBJECT_0 then
          begin
            ResetEvent(FOverlapped.hEvent);
            if not GetOverlappedResult(FConnection.PipeHandle, FOverlapped, lBytesWritten, True) then
            begin
              RaiseLastOSError;
            end;
          end else
          begin
            ResetEvent(FOverlapped.hEvent);
          end;
        end;
    else
      RaiseLastOSError;
    end;
  end;
end;

procedure TPipeWriter.Write(AStream: TStream);
var
  lBytesRead, lBytesWritten: DWORD;
  lDataSize, lBufferSize: Integer;
  lBuffer: PChar;
begin
  lBufferSize := FConnection.BufferSize;
  GetMem(lBuffer, lBufferSize);
  try
    lDataSize := AStream.Size;
    WriteSize(lDataSize);
    while lDataSize > 0 do
    begin
      lBytesRead := AStream.Read(lBuffer^, lBufferSize);
      Dec(lDataSize, lBytesRead);

      if not WriteFile(FConnection.PipeHandle, lBuffer^, lBytesRead, lBytesWritten, @FOverlapped) then
      begin
        case GetLastError of
          ERROR_IO_PENDING:
            begin
              if WaitForSingleObject(FOverlapped.hEvent, INFINITE) = WAIT_OBJECT_0 then
              begin
                ResetEvent(FOverlapped.hEvent);
                if not GetOverlappedResult(FConnection.PipeHandle, FOverlapped, lBytesWritten, True) then
                begin
                  RaiseLastOSError;
                end;
              end else
              begin
                ResetEvent(FOverlapped.hEvent);
              end;
            end;
        else
          RaiseLastOSError;
        end;
      end;
      ZeroMemory(lBuffer, lBufferSize);
    end;
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

function TPipeReader.ReadSize: Integer;
var
  lBytesRead: DWORD;
begin
  if not ReadFile(FConnection.PipeHandle, Result, SizeOf(Result), lBytesRead, @FOverlapped) then
  begin
    case GetLastError of
      ERROR_IO_PENDING:
        begin
          if WaitForSingleObject(FOverlapped.hEvent, INFINITE) = WAIT_OBJECT_0 then
          begin
            ResetEvent(FOverlapped.hEvent);
            if not GetOverlappedResult(FConnection.PipeHandle, FOverlapped, lBytesRead, True) then
            begin
               RaiseLastOSError;
            end;
          end else
          begin
            ResetEvent(FOverlapped.hEvent);
          end;
        end;
      ERROR_BROKEN_PIPE: Exit;
    else
      RaiseLastOSError;
    end;
  end;
end;


procedure TPipeReader.Read(AStream: TStream);
var
  lBytesRead: DWORD;
  lDataSize, lBufferSize: Integer;
  lBuffer: PChar;
begin
  lBufferSize := FConnection.BufferSize;

  GetMem(lBuffer, lBufferSize);
  try
    lDataSize := Self.ReadSize;
    while lDataSize > 0 do
    begin
      if not ReadFile(FConnection.PipeHandle, lBuffer^, lBufferSize, lBytesRead, @FOverlapped) then
      begin
        case GetLastError of
          ERROR_BROKEN_PIPE: Break;
          ERROR_MORE_DATA:;
          ERROR_IO_PENDING:
            begin
              if WaitForSingleObject(FOverlapped.hEvent, INFINITE) = WAIT_OBJECT_0 then
              begin
                ResetEvent(FOverlapped.hEvent);
                if not GetOverlappedResult(FConnection.PipeHandle, FOverlapped, lBytesRead, True) then
                begin
                  RaiseLastOSError;
                end;
              end else
              begin
                ResetEvent(FOverlapped.hEvent);
              end;
            end;
        else
          RaiseLastOSError;
        end;
      end;

      if lBytesRead > 0 then
      begin
        AStream.Write(lBuffer^, lBytesRead);
        Dec(lDataSize, lBytesRead);
      end;

      ZeroMemory(lBuffer, lBufferSize);
    end;
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
        Result := string(lData);
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
