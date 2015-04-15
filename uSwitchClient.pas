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
unit uSwitchClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, ActiveX, TypInfo, EventSink,
  Call_TLB, uPipeServer, uPipeConnection, uPipeMessage;

type

  TSwitchClient = class(TComponent)
  private
    FConnections: TThreadList;
    FContext: TSwitchContext;
    FSwitch: TSwitch;

    procedure OnAcceptCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnAnswerCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnClearCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnCompleted(Sender: TObject; const Terminal: ITerminal);
    procedure OnDialing(Sender: TObject; const Terminal: ITerminal; const dtmf:
        WideString);
    procedure OnDivertCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnHangup(Sender: TObject; const Terminal: ITerminal);
    procedure OnHoldCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnIncomingCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnInit(Sender: TObject; const Terminal: ITerminal);
    procedure OnJoinCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnLeaveCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnMakeCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnOutgoingCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnPickup(Sender: TObject; const Terminal: ITerminal);
    procedure OnProceedCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnReleaseCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnRetrieveCall(Sender: TObject; const Terminal: ITerminal; const
        Call: ICall);
    procedure OnRinging(Sender: TObject; const Terminal: ITerminal; RingCount:
        Integer);
    procedure OnStateChanged(Sender: TObject; const Terminal: ITerminal;
        oldState, newState: TERMINAL_STATE);
    procedure Send(Content: string); overload;
    procedure Send(Terminal: ITerminal; RingCount: Integer; Topic: string);
        overload;
    procedure Send(Terminal: ITerminal; Topic: string); overload;
    procedure Send(Terminal: ITerminal; DtmfString, Topic: string); overload;
    procedure Send(Terminal: ITerminal; Call: ICall; Topic: string); overload;
    procedure Send(Terminal: ITerminal; oldState, newState: TERMINAL_STATE;
        Topic: string); overload;
    procedure Send(Terminal: ITerminal; RecordLog: IRecordLog; Topic: string);overload;

    procedure MakeMessage(AMessage: TPipeMessage; Address: IAddress); overload;
    procedure MakeMessage(AMessage: TPipeMessage; Call: ICall); overload;
    procedure MakeMessage(AMessage: TPipeMessage; CallLog: ICallLog); overload;
    procedure MakeMessage(AMessage: TPipeMessage; Line: ILine); overload;
    procedure MakeMessage(AMessage: TPipeMessage; Terminal: ITerminal);
        overload;
    procedure MakeMessage(AMessage: TPipeMessage; RecordLog: IRecordLog);overload;
  public
    constructor Create(AOwner: TNamedPipeServer);
    destructor Destroy; override;
    procedure OnMessageReceived(AConnection: TPipeConnection; AMessage:
        TPipeMessage);
  end;

implementation

{
type

TLineState = (lsStandby, lsPickuped, lsRinging, lsDialing, lsWaitDialTone,
              lsWaitRingBackTone, lsWaitHangup, lsWaitAnswer, lsTalking,
              lsHolding, lsParking, lsConferencing, lsQueuing, lsPending, lsAutoAttendant);

TCallState = (
  CALL_STATE_UNKNOWN, //index 0
  CALL_STATE_IDLE,
  CALL_STATE_OFFERING,
  CALL_STATE_ALERTING,
  CALL_STATE_ACCEPTED,
  CALL_STATE_CONNECTED,
  CALL_STATE_ONHOOK,
  CALL_STATE_OFFHOOK,
  CALL_STATE_PROCEEDING,
  CALL_STATE_DISCONNECTED,
  CALL_STATE_ONHOLD,
  CALL_STATE_QUEUING,
  CALL_STATE_IVR,
  CALL_STATE_NOANSWER,
  CALL_STATE_BUSY,
  CALL_STATE_CONFERENCE
  );

  }
{
******************************** TSwitchClient *********************************
}
constructor TSwitchClient.Create(AOwner: TNamedPipeServer);
begin
  inherited Create(AOwner);
  FConnections := AOwner.Connections;

  FSwitch := TSwitch.Create(Self);
  FSwitch.OnInit := OnInit;
  FSwitch.OnPickup := OnPickup;
  FSwitch.OnHangup := OnHangup;
  FSwitch.OnDialing := OnDialing;
  FSwitch.OnRinging := OnRinging;
  FSwitch.OnCompleted := OnCompleted;
  FSwitch.OnStateChanged := OnStateChanged;

  FSwitch.OnJoinCall := OnJoinCall;
  FSwitch.OnLeaveCall := OnLeaveCall;
  FSwitch.OnIncomingCall := OnIncomingCall;
  FSwitch.OnProceedCall := OnProceedCall;
  FSwitch.OnDivertCall := OnDivertCall;
  FSwitch.OnOutgoingCall := OnOutgoingCall;
  FSwitch.OnMakeCall := OnMakeCall;
  FSwitch.OnHoldCall := OnHoldCall;
  FSwitch.OnRetrieveCall := OnRetrieveCall;
  FSwitch.OnAnswerCall := OnAnswerCall;
  FSwitch.OnReleaseCall := OnReleaseCall;
  FSwitch.OnClearCall := OnClearCall;
  FSwitch.OnAcceptCall := OnAcceptCall;

  FContext := TSwitchContext.Create(Self);

  FSwitch.Initialize(FContext.DefaultInterface);

  {
  for i := 0 to Pred(FSwitch.Terminals.Count) do
  begin
    if FEventSink.Connect(Switch.Terminals[i]) then
    begin
      FWrappers.Add(TTerminalWrapper.Create(Switch.Terminals[i]));
    end;
  end;
  }
end;

destructor TSwitchClient.Destroy;
begin
  if Assigned(FSwitch) then
  begin
    FSwitch.Shutdown;
    FSwitch.Free;
  end;
  if Assigned(FContext) then
  begin
    FContext.Free;
  end;
  inherited Destroy;
end;


procedure TSwitchClient.OnAcceptCall(Sender: TObject; const Terminal: ITerminal;
    const Call: ICall);
begin
  Send(terminal, call, 'call-accept');
end;

procedure TSwitchClient.OnAnswerCall(Sender: TObject; const Terminal: ITerminal;
    const Call: ICall);
begin
  Send(terminal, call, 'call-answer');
end;

procedure TSwitchClient.OnClearCall(Sender: TObject; const Terminal: ITerminal;
    const Call: ICall);
begin
  Send(terminal, call, 'call-clear');
end;

procedure TSwitchClient.OnCompleted(Sender: TObject; const Terminal: ITerminal);
begin
  Send(Terminal, 'call-completed');
end;

procedure TSwitchClient.OnDialing(Sender: TObject; const Terminal: ITerminal;
    const dtmf: WideString);
begin
  Send(terminal, dtmf, 'call-dailing');

  if Length(Dtmf) = 4 then
  begin
    Terminal.BlindTransfer(Dtmf);
  end;
end;


procedure TSwitchClient.OnHangup(Sender: TObject; const Terminal: ITerminal);
var
  i: Integer;
  recordLog: IRecordLog;
begin
  Send(Terminal, 'call-hangup');

  with Terminal.Records do
  begin
    for i := 0 to Pred(Count) do
    begin
      if VarSupports(Item[i], IRecordLog, recordLog) then
      begin
        Send(Terminal, recordLog, 'call-record');
      end;
    end;
  end;
end;

procedure TSwitchClient.OnHoldCall(Sender: TObject; const Terminal: ITerminal;
    const Call: ICall);
begin
  Send(terminal, call, 'call-hold');
end;

procedure TSwitchClient.OnIncomingCall(Sender: TObject; const Terminal:
    ITerminal; const Call: ICall);
begin
  Send(Terminal, Call, 'call-incoming');
end;

procedure TSwitchClient.OnInit(Sender: TObject; const Terminal: ITerminal);
begin
  Send(Terminal, 'call-init');
end;

procedure TSwitchClient.OnJoinCall(Sender: TObject; const Terminal: ITerminal;
    const Call: ICall);
var
  i: Integer;
  line: ILine;
begin
  with call.Inclusions do
  begin
    for i := 0 to Pred(Count) do
    begin
      if VarSupports(Item[i], ILine, line) then
      begin
        Send(line.Terminal, call, 'call-join');
      end;
    end;
  end;
end;

procedure TSwitchClient.OnLeaveCall(Sender: TObject; const Terminal: ITerminal;
    const Call: ICall);
var
  i: Integer;
  line: ILine;
begin
  with call.Inclusions do
  begin
    for i := 0 to Pred(Count) do
    begin
      if VarSupports(Item[i], ILine, line) then
      begin
        Send(line.Terminal, call, 'call-leave');
      end;
    end;
  end;
end;

procedure TSwitchClient.OnDivertCall(Sender: TObject; const Terminal: ITerminal;
    const Call: ICall);
var
  i: Integer;
  line: ILine;
begin
  with call.Inclusions do
  begin
    for i := 0 to Pred(Count) do
    begin
      if Supports(Item[i], ILine, line) then
      begin
        case call.ExitState of
           CALL_STATE_BUSY:
             begin
               Send(line.Terminal, call, 'call-busy');
             end;
           CALL_STATE_NOANSWER:
             begin
               Send(line.Terminal, call, 'call-noanswer');
             end;
        end;
      end;
    end;
  end;
end;

procedure TSwitchClient.OnMakeCall(Sender: TObject; const Terminal: ITerminal;
    const Call: ICall);
begin
  {
  if call.Automated_ then
  begin
    Terminal.Pickup;
    Terminal.PlayVoice('Resources/Welcome.wav', MEDIA_SND_FILENAME or MEDIA_SND_SYNC);
    Terminal.Clear;
  end;
  }
  Send(Terminal, Call, 'call-make');
end;

procedure TSwitchClient.OnReleaseCall(Sender: TObject; const Terminal:
    ITerminal; const Call: ICall);
var
  i: Integer;
  line: ILine;
begin

  if call.Automated_ then
  begin
    Terminal.Clear;
    Terminal.StopPlayVoice(MEDIA_STOP_ALL);
  end;

  Send(terminal, Call, 'call-release');

  with call.Inclusions do
  begin
    for i := 0 to Pred(Count) do
    begin
      if Supports(Item[i], ILine, line) then
      begin
        Send(line.Terminal, call, 'call-release');
      end;
    end;
  end;
end;

procedure TSwitchClient.OnOutgoingCall(Sender: TObject; const Terminal:
    ITerminal; const Call: ICall);
begin
  Send(Terminal, Call, 'call-outgoing');
end;

procedure TSwitchClient.OnPickup(Sender: TObject; const Terminal: ITerminal);
begin
  Send(Terminal, 'call-pickup');
end;

procedure TSwitchClient.OnProceedCall(Sender: TObject; const Terminal:
    ITerminal; const Call: ICall);
begin
  Send(Terminal, Call, 'call-proceed');
end;


procedure TSwitchClient.OnRetrieveCall(Sender: TObject; const Terminal:
    ITerminal; const Call: ICall);
begin
  Send(terminal, Call, 'call-retrieve');
end;

procedure TSwitchClient.OnRinging(Sender: TObject; const Terminal: ITerminal;
    RingCount: Integer);
begin
  Send(terminal, RingCount, 'call-ringing');
end;

procedure TSwitchClient.OnStateChanged(Sender: TObject; const Terminal:
    ITerminal; oldState, newState: TERMINAL_STATE);
begin
  Send(Terminal, oldState, newState, 'call-state');
end;

procedure TSwitchClient.OnMessageReceived(AConnection: TPipeConnection;
    AMessage: TPipeMessage);
begin
  Send(AMessage.AsString);
end;

procedure TSwitchClient.Send(Content: string);
var
  i: Integer;
  List: TList;
begin
  List := FConnections.LockList;
  try
    for i := 0 to List.Count - 1 do
    begin
      if Assigned(List[i]) then
      begin
        TPipeConnection(List[i]).Send(Content);
      end;
    end;
  finally
    FConnections.UnlockList;
  end;
end;

procedure TSwitchClient.Send(Terminal: ITerminal; RingCount: Integer; Topic:
    string);
var
  Msg: TPipeMessage;
begin
  Msg := TPipeMessage.Create(Topic);
  try
    MakeMessage(Msg, Terminal);
    Msg.Data['ringCount'] := IntToStr(RingCount);
    Send(Msg.AsString);
  finally
    Msg.Free;
  end;
end;

procedure TSwitchClient.Send(Terminal: ITerminal; Topic: string);
var
  Msg: TPipeMessage;
begin
  Msg := TPipeMessage.Create(Topic, [], []);
  try
    MakeMessage(Msg, Terminal);
    Send(Msg.AsString);
  finally
    Msg.Free;
  end;
end;

procedure TSwitchClient.Send(Terminal: ITerminal; DtmfString, Topic: string);
var
  Msg: TPipeMessage;
begin
  Msg := TPipeMessage.Create(Topic, [], []);
  try
    MakeMessage(Msg, Terminal);
    Msg.Data['dtmfString'] := DtmfString;
    Send(Msg.AsString);
  finally
    Msg.Free;
  end;
end;

procedure TSwitchClient.Send(Terminal: ITerminal; RecordLog: IRecordLog; Topic: string);
var
  Msg: TPipeMessage;
begin
  Msg := TPipeMessage.Create(Topic, [], []);
  try
    MakeMessage(Msg, Terminal);
    MakeMessage(Msg, RecordLog);
    Send(Msg.AsString);
  finally
    Msg.Free;
  end;
end;

procedure TSwitchClient.Send(Terminal: ITerminal; Call: ICall; Topic: string);
var
  Msg: TPipeMessage;
begin
  Msg := TPipeMessage.Create(Topic, [], []);
  try
    MakeMessage(Msg, Terminal);
    MakeMessage(Msg, Call);
    Send(Msg.AsString);
  finally
    Msg.Free;
  end;
end;

procedure TSwitchClient.Send(Terminal: ITerminal; oldState, newState:
    TERMINAL_STATE; Topic: string);
var
  Msg: TPipeMessage;
begin
  Msg := TPipeMessage.Create(Topic, [], []);
  try
    MakeMessage(Msg, Terminal);
    Msg.Data['state'] := UIntToStr(newState);
    Send(Msg.AsString);
  finally
    Msg.Free;
  end;
end;


procedure TSwitchClient.MakeMessage(AMessage: TPipeMessage; Address: IAddress);
begin
  AMessage.Data['name'] := Address.Name;
  AMessage.Data['number'] := Address.Number;
  AMessage.Data['state'] := UIntToStr(Address.State);
  AMessage.Data['now'] := DateTimeToStr(Now);
end;

procedure TSwitchClient.MakeMessage(AMessage: TPipeMessage; Call: ICall);
var
  Log: ICallLog;
begin
  if Supports(Call, ICallLog, Log) then
  begin
    MakeMessage(AMessage, Log);
  end;
end;

procedure TSwitchClient.MakeMessage(AMessage: TPipeMessage; CallLog: ICallLog);
begin
  AMessage.Data['instanceId'] := GuidToString(CallLog.InstanceId);
  AMessage.Data['sessionId'] := CallLog.SessionId;
  AMessage.Data['callerId'] := CallLog.CallerId;
  AMessage.Data['calleeId'] := CallLog.CalleeId;
  AMessage.Data['accessCode'] := CallLog.AccessCode;
  AMessage.Data['exitState'] := UIntToStr(CallLog.ExitState);
  AMessage.Data['direction'] := UIntToStr(CallLog.Direction);
  AMessage.Data['start'] := DateTimeToStr(CallLog.StartTime);
  AMessage.Data['end'] := DateTimeToStr(CallLog.EndTime);
  AMessage.Data['wait'] := FloatToStrF(CallLog.WaitDuration,ffFixed,10,2);
  AMessage.Data['talk'] := FloatToStrF(CallLog.TalkDuration,ffFixed,10,2);
  AMessage.Data['now'] := DateTimeToStr(Now);
end;

procedure TSwitchClient.MakeMessage(AMessage: TPipeMessage; Line: ILine);
begin
  AMessage.Data['callerId'] := Line.CallerId;
  AMessage.Data['calleeId'] := Line.CalleeId;
  AMessage.Data['state'] := UIntToStr(Line.LineState);
  MakeMessage(AMessage, Line.Address);
  if Assigned(Line.ActiveCall) then
  begin
    MakeMessage(AMessage, Line.ActiveCall);
  end;
  AMessage.Data['now'] := DateTimeToStr(Now);
end;

procedure TSwitchClient.MakeMessage(AMessage: TPipeMessage; RecordLog: IRecordLog);
begin
  AMessage.Data['sessionId'] := RecordLog.SessionId;
  AMessage.Data['start'] := DateTimeToStr(RecordLog.StartTime);
  AMessage.Data['end'] := DateTimeToStr(RecordLog.EndTime);
  AMessage.Data['audioFileName'] := RecordLog.AudioFileName;
  AMessage.Data['now'] := DateTimeToStr(Now);
end;

procedure TSwitchClient.MakeMessage(AMessage: TPipeMessage; Terminal:
    ITerminal);
begin
  AMessage.Data['name'] := Terminal.Name;
  AMessage.Data['pad'] := Terminal.Pad;
  AMessage.Data['sig'] := UIntToStr(Terminal.Sig);// GetEnumName(TypeInfo(SIGNALING), Terminal.Sig)
  if Assigned(Terminal.ActiveLine) then
  begin
    MakeMessage(AMessage, Terminal.ActiveLine);
  end;
  AMessage.Data['now'] := DateTimeToStr(Now);
end;

end.
