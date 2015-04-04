unit Call_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 45604 $
// File generated on 2015/3/10 16:18:26 from Type Library described below.

// ************************************************************************  //
// Type Lib: H:\Download\Telephony\bin\x86\Call.dll (1)
// LIBID: {80336BB4-E076-42C4-82ED-6F8942BB2C59}
// LCID: 0
// Helpfile: 
// HelpString: Call Control Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Member 'Automated' of 'ICall' changed to 'Automated_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CallMajorVersion = 1;
  CallMinorVersion = 0;

  LIBID_Call: TGUID = '{80336BB4-E076-42C4-82ED-6F8942BB2C59}';

  IID_ISwitch: TGUID = '{8A13B942-1658-455F-914D-ED4352686B7E}';
  DIID_ISwitchEvents: TGUID = '{CCC320E2-B613-430D-96F2-31DDFE137386}';
  CLASS_Switch: TGUID = '{C7762D7C-83D2-48BA-9939-6E93A80AD05A}';
  IID_ICollection: TGUID = '{EB920DC2-1C64-48BF-B876-37CFF9AFC2B7}';
  IID_IReadOnlyPropertyCollection: TGUID = '{D1D17D48-0C22-4775-8C1A-B0D54A928433}';
  IID_IProperty: TGUID = '{D60805B9-41E0-4731-8884-D95DFECD7DF3}';
  IID_IPropertyCollection: TGUID = '{72DA35D8-94F8-4F30-8DB0-E08374E5B664}';
  IID_ISwitchContext: TGUID = '{FBF76D51-9CFC-4ABA-B194-2994BE351030}';
  CLASS_SwitchContext: TGUID = '{72D9EBC5-1087-4804-A199-B53FF40784C3}';
  IID_IEditableCollection: TGUID = '{36E05A79-AE86-4593-9B95-4D7058A12F4F}';
  IID_IMediaDevice: TGUID = '{B5FBCDF9-4947-4C9E-B2B8-25428BFCE9D7}';
  IID_IMediaDeviceManager: TGUID = '{EFD4B351-AE61-4C83-9905-9CA1009C6D26}';
  IID_IMediaControl: TGUID = '{4F848EA6-AE7A-4D45-9379-DBB283F4833B}';
  IID_IChannel: TGUID = '{F49F7CC0-6A49-4083-A15E-594D3763CBB7}';
  IID_ICall: TGUID = '{F72744B6-0CC8-498D-848C-F98BC5026A60}';
  IID_ICallCollection: TGUID = '{052D5C8B-1338-4FFD-AB89-C3695E249D4C}';
  IID_ICallControl: TGUID = '{50A1192B-4821-46C5-8D84-5087667A79CB}';
  IID_ICallSession: TGUID = '{14CEDE8D-1EE9-4777-A731-D2AC3BAA0A01}';
  IID_ICallLog: TGUID = '{EA347EAB-FB5B-4BC0-A72B-7505DB72C815}';
  IID_IRecordLog: TGUID = '{DBD97BBD-42F2-441A-9A66-D0D9EB857D23}';
  IID_IAgentInfo: TGUID = '{3655131A-FFC6-4147-83F5-504DE4FAFDE5}';
  IID_ILine: TGUID = '{0478A342-162B-4E7A-9A15-2C85A9065F65}';
  IID_ILineEvent: TGUID = '{FF9EF2A9-D0D4-4655-8736-8DD571F152D1}';
  IID_ITerminal: TGUID = '{BB07CC54-89B5-4EE0-92A4-C9BA730DFE79}';
  IID_ITerminalManager: TGUID = '{765DCB12-3FCA-4D36-AB43-DBF11E2CC82A}';
  IID_ITerminalCollection: TGUID = '{F01878F3-0DA2-44C7-8D97-12AF972338DF}';
  IID_IPresence: TGUID = '{519D2D8B-E63D-4F1C-BA10-6ADC665690B1}';
  IID_IPresenceManager: TGUID = '{2ABD24C6-4FED-4277-9F46-B82127E86263}';
  IID_IAddress: TGUID = '{BB079A5D-B5ED-410E-A0CB-B12742AE2672}';
  IID_IAddressManager: TGUID = '{A35DAA32-4817-4C25-A11A-1EBF4D95DC3E}';
  IID_IAddressCollection: TGUID = '{253D9256-A921-4F39-AD3F-FB75E232EE6C}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum LINE_TYPE
type
  LINE_TYPE = TOleEnum;
const
  LINE_TYPE_UNKNOWN = $00000000;
  LINE_TYPE_AGENT = $00000001;
  LINE_TYPE_TRUNK = $00000002;
  LINE_TYPE_FAX = $00000004;

// Constants for enum LINE_STATE
type
  LINE_STATE = TOleEnum;
const
  LINE_STATE_STANDBY = $00000000;
  LINE_STATE_PICKUPED = $00000001;
  LINE_STATE_RINGING = $00000002;
  LINE_STATE_DIALING = $00000003;
  LINE_STATE_WAIT_DIALTONE = $00000004;
  LINE_STATE_WAIT_RINGBACKTONE = $00000005;
  LINE_STATE_WAIT_HANGUP = $00000006;
  LINE_STATE_WAIT_ANSWER = $00000007;
  LINE_STATE_TALKING = $00000008;
  LINE_STATE_HOLDING = $00000009;
  LINE_STATE_PARKING = $0000000A;
  LINE_STATE_CONFERENCING = $0000000B;
  LINE_STATE_QUEUING = $0000000C;
  LINE_STATE_PENDING = $0000000D;
  LINE_STATE_AUTOATTENDANT = $0000000E;

// Constants for enum CALL_DIRECTION
type
  CALL_DIRECTION = TOleEnum;
const
  CALL_ORIGIN_UNKNOWN = $00000000;
  CALL_ORIGIN_INTERNAL = $00000001;
  CALL_ORIGIN_EXTERNAL = $00000002;
  CALL_ORIGIN_INCOMING = $00000006;
  CALL_ORIGIN_OUTGOING = $0000000A;

// Constants for enum CALL_STATE
type
  CALL_STATE = TOleEnum;
const
  CALL_STATE_UNKNOWN = $00000000;
  CALL_STATE_IDLE = $00000001;
  CALL_STATE_OFFERING = $00000002;
  CALL_STATE_ALERTING = $00000003;
  CALL_STATE_ACCEPTED = $00000004;
  CALL_STATE_CONNECTED = $00000005;
  CALL_STATE_ONHOOK = $00000006;
  CALL_STATE_OFFHOOK = $00000007;
  CALL_STATE_PROCEEDING = $00000008;
  CALL_STATE_DISCONNECTED = $00000009;
  CALL_STATE_ONHOLD = $0000000A;
  CALL_STATE_QUEUING = $0000000B;
  CALL_STATE_IVR = $0000000C;
  CALL_STATE_NOANSWER = $0000000D;
  CALL_STATE_BUSY = $0000000E;
  CALL_STATE_CONFERENCE = $0000000F;

// Constants for enum ROUTE_STRATEGY
type
  ROUTE_STRATEGY = TOleEnum;
const
  ROUTE_STRATEGY_RANDOM = $00000000;
  ROUTE_STRATEGY_HUNTING = $00000001;
  ROUTE_STRATEGY_RINGDOWN = $00000002;

// Constants for enum ADDRESS_STATE
type
  ADDRESS_STATE = TOleEnum;
const
  ADDRESS_STATE_AVAILABLE = $00000001;
  ADDRESS_STATE_UNAVAILABLE = $00000002;
  ADDRESS_STATE_READY = $00000005;
  ADDRESS_STATE_NOTREADY = $00000009;
  ADDRESS_STATE_BUSY = $00000015;
  ADDRESS_STATE_DND = $00000025;

// Constants for enum MEDIA_SOUND
type
  MEDIA_SOUND = TOleEnum;
const
  MEDIA_SND_FILENAME = $00000001;
  MEDIA_SND_FILELIST = $00000002;
  MEDIA_SND_TTS = $00000004;
  MEDIA_SND_MONEY = $00000008;
  MEDIA_SND_ASYNC = $00000010;
  MEDIA_SND_SYNC = $00000020;
  MEDIA_SND_LOOP = $00000040;
  MEDIA_SND_MEMORY = $00000080;
  MEDIA_SND_STOPONDTMF = $00000100;
  MEDIA_SND_PREEMPT = $00000200;

// Constants for enum MEDIA_STATUS
type
  MEDIA_STATUS = TOleEnum;
const
  MEDIA_STATUS_STOPED = $00000000;
  MEDIA_STATUS_RUNNING = $00000001;
  MEDIA_STATUS_PAUSED = $00000002;

// Constants for enum CALL_REASON
type
  CALL_REASON = TOleEnum;
const
  CALL_REASON_UNKNOWN = $00000000;
  CALL_REASON_CAMPEDON = $00000001;
  CALL_REASON_DIRECT = $00000002;
  CALL_REASON_FORWARDBUSY = $00000003;
  CALL_REASON_FORWARDNOANSWER = $00000004;
  CALL_REASON_FORWARDUNCONDITIONAL = $00000005;
  CALL_REASON_INTRUDE = $00000006;
  CALL_REASON_PARKED = $00000007;
  CALL_REASON_PICKUP = $00000008;
  CALL_REASON_REMINDER = $00000009;
  CALL_REASON_TRANSFER = $0000000A;
  CALL_REASON_UNPARK = $0000000B;
  CALL_REASON_COMPLETION = $0000000C;

// Constants for enum TONE_TYPE
type
  TONE_TYPE = TOleEnum;
const
  TONE_TYPE_DIALTONE = $00000000;
  TONE_TYPE_BUSYTONE = $00000001;
  TONE_TYPE_RINGBACKTONE = $00000002;
  TONE_TYPE_HOWLERTONE = $00000003;

// Constants for enum SHOW_TYPE
type
  SHOW_TYPE = TOleEnum;
const
  SHOW_TYPE_UNKNOWN = $00000000;
  SHOW_TYPE_NOTREADY = $00000001;
  SHOW_TYPE_IDLE = $00000002;
  SHOW_TYPE_BUSY = $00000003;
  SHOW_TYPE_DND = $00000004;
  SHOW_TYPE_AWAY = $00000005;

// Constants for enum TERMINAL_PRIVILEGE
type
  TERMINAL_PRIVILEGE = TOleEnum;
const
  TERMINAL_PRIVILEGE_PREEMPT = $00000001;
  TERMINAL_PRIVILEGE_LISTEN = $00000002;
  TERMINAL_PRIVILEGE_INTERRUPT = $00000004;
  TERMINAL_PRIVILEGE_INTERPOSE = $00000008;
  TERMINAL_PRIVILEGE_ALL = $0000000F;

// Constants for enum HANGUP_CAUSE
type
  HANGUP_CAUSE = TOleEnum;
const
  HANGUP_CAUSE_NORMAL = $00000000;
  HANGUP_CAUSE_TIMEOUT = $00000001;
  HANGUP_CAUSE_PENDING = $00000002;
  HANGUP_CAUSE_NOANSWER = $00000003;
  HANGUP_CAUSE_BUSY = $00000004;
  HANGUP_CAUSE_NETWORK = $00000005;
  HANGUP_CAUSE_FAILURE = $00000006;
  HANGUP_CAUSE_INTERRUPT = $00000007;

// Constants for enum CALL_TYPE
type
  CALL_TYPE = TOleEnum;
const
  CALL_TYPE_PSTN = $00000000;
  CALL_TYPE_IP = $00000001;
  CALL_TYPE_VM = $00000002;
  CALL_TYPE_AA = $00000003;

// Constants for enum DIAL_STATE
type
  DIAL_STATE = TOleEnum;
const
  DIAL_STATE_IDLE = $00000000;
  DIAL_STATE_INPROGRESS = $00000001;
  DIAL_STATE_SUCCESS = $00000002;
  DIAL_STATE_FAILURE = $00000003;

// Constants for enum MEDIA_STOP
type
  MEDIA_STOP = TOleEnum;
const
  MEDIA_STOP_CURRENT = $00000000;
  MEDIA_STOP_ALL = $00000001;

// Constants for enum SIGNALING
type
  SIGNALING = TOleEnum;
const
  SIGNALING_UNKNOWN = $00000000;
  SIGNALING_STATION_AGENT = $00000001;
  SIGNALING_STATION_FAX = $00000002;
  SIGNALING_TRUNK_ANALOG = $00000005;
  SIGNALING_TRUNK_T1 = $00000006;
  SIGNALING_TRUNK_IP = $00000007;
  SIGNALING_TRUNK_PRI = $00000008;
  SIGNALING_TRUNK_PHS = $00000009;
  SIGNALING_TRUNK_E1 = $0000000A;

// Constants for enum TERMINAL_STATE
type
  TERMINAL_STATE = TOleEnum;
const
  TERMINAL_STATE_AVAILABLE = $00000001;
  TERMINAL_STATE_UNAVAILABLE = $00000002;

// Constants for enum FORWARD_CAUSE
type
  FORWARD_CAUSE = TOleEnum;
const
  FORWARD_CAUSE_ALERT = $00000000;
  FORWARD_CAUSE_DND = $00000001;
  FORWARD_CAUSE_BUSY = $00000002;
  FORWARD_CAUSE_NOANSWER = $00000003;
  FORWARD_CAUSE_QUEUE_OVERFLOW = $00000004;
  FORWARD_CAUSE_QUEUE_EXIT = $00000005;

// Constants for enum ADDRESS_TYPE
type
  ADDRESS_TYPE = TOleEnum;
const
  ADDRESS_TYPE_EXTENSION = $00000000;
  ADDRESS_TYPE_TRUNK = $00000001;
  ADDRESS_TYPE_WORKGROUP = $00000002;
  ADDRESS_TYPE_ATTENDANT = $00000003;
  ADDRESS_TYPE_VOICEMAIL = $00000004;

// Constants for enum ADDRESS_NAME
type
  ADDRESS_NAME = TOleEnum;
const
  ADDRESS_NAME_ID = $00000000;
  ADDRESS_NAME_NUMBER = $00000001;
  ADDRESS_NAME_NAME = $00000002;
  ADDRESS_NAME_ACCESSCODE = $00000003;
  ADDRESS_NAME_STATE = $00000004;
  ADDRESS_NAME_IPADDRESS = $00000005;
  ADDRESS_NAME_ROUTING = $00000006;
  ADDRESS_NAME_WORKFLOW = $00000007;
  ADDRESS_NAME_SENDTONE_TIMEDELAY = $00000008;
  ADDRESS_NAME_ALERT_TIMEDELAY = $00000009;
  ADDRESS_NAME_RING_TIMEDELAY = $0000000A;
  ADDRESS_NAME_DIAL_TIMEDELAY = $0000000B;
  ADDRESS_NAME_WRAPUP_TIMEDELAY = $00000015;
  ADDRESS_NAME_QUEUE_OVERFLOW = $0000000C;
  ADDRESS_NAME_QUEUE_INTERVAL = $0000000D;
  ADDRESS_NAME_PRIORITY_INTERVAL = $0000000E;
  ADDRESS_NAME_DONOTDISTURB = $0000000F;
  ADDRESS_NAME_ACCOUNTCODE = $00000010;
  ADDRESS_NAME_PAD = $00000011;
  ADDRESS_NAME_HUNTGROUP = $00000012;
  ADDRESS_NAME_AVAILABLE = $00000013;
  ADDRESS_NAME_SUPERVISOR = $00000014;

// Constants for enum CONTEXT_CONSTANT
type
  CONTEXT_CONSTANT = TOleEnum;
const
  CONTEXT_INSTRUCTION_DEBUG = $00000000;
  CONTEXT_INSTRUCTION_PREEMPT = $00000001;
  CONTEXT_INSTRUCTION_LISTEN = $00000002;
  CONTEXT_INSTRUCTION_INTERRUPT = $00000003;
  CONTEXT_INSTRUCTION_INTERPOSE = $00000004;
  CONTEXT_INSTRUCTION_SAYEXT = $00000005;
  CONTEXT_INSTRUCTION_SAYRES = $00000006;
  CONTEXT_INSTRUCTION_DIVERT = $00000007;
  CONTEXT_TIMEDELAY_RINGING = $0000000A;
  CONTEXT_TIMEDELAY_DIALING = $0000000B;
  CONTEXT_TIMEDELAY_SENDTONE = $0000000C;
  CONTEXT_FORWARD_LENGTH = $00000014;
  CONTEXT_VOX_GREETING = $0000001E;
  CONTEXT_TTS_GREETING = $0000001F;
  CONTEXT_VOX_QUEUING = $00000020;
  CONTEXT_TTS_QUEUING = $00000021;
  CONTEXT_VOX_WAITING = $00000022;
  CONTEXT_VOX_BUSY = $00000024;
  CONTEXT_TTS_BUSY = $00000025;
  CONTEXT_VOX_NOANSWER = $00000026;
  CONTEXT_TTS_NOANSWER = $00000027;
  CONTEXT_VOX_WRONG = $00000028;
  CONTEXT_LOG_LEVEL = $0000005A;

// Constants for enum TERMINAL_NAME
type
  TERMINAL_NAME = TOleEnum;
const
  TERMINAL_NAME_ID = $00000000;
  TERMINAL_NAME_PAD = $00000001;
  TERMINAL_NAME_NAME = $00000002;
  TERMINAL_NAME_TYPE = $00000003;
  TERMINAL_NAME_STATE = $00000004;
  TERMINAL_NAME_RECORDING = $00000005;
  TERMINAL_NAME_SAVEPATH = $00000006;
  TERMINAL_NAME_SAVEFILE = $00000007;
  TERMINAL_NAME_CLEARING = $00000008;
  TERMINAL_NAME_DISKSIZE = $00000009;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISwitch = interface;
  ISwitchDisp = dispinterface;
  ISwitchEvents = dispinterface;
  ICollection = interface;
  ICollectionDisp = dispinterface;
  IReadOnlyPropertyCollection = interface;
  IReadOnlyPropertyCollectionDisp = dispinterface;
  IProperty = interface;
  IPropertyDisp = dispinterface;
  IPropertyCollection = interface;
  IPropertyCollectionDisp = dispinterface;
  ISwitchContext = interface;
  ISwitchContextDisp = dispinterface;
  IEditableCollection = interface;
  IEditableCollectionDisp = dispinterface;
  IMediaDevice = interface;
  IMediaDeviceDisp = dispinterface;
  IMediaDeviceManager = interface;
  IMediaDeviceManagerDisp = dispinterface;
  IMediaControl = interface;
  IMediaControlDisp = dispinterface;
  IChannel = interface;
  IChannelDisp = dispinterface;
  ICall = interface;
  ICallDisp = dispinterface;
  ICallCollection = interface;
  ICallCollectionDisp = dispinterface;
  ICallControl = interface;
  ICallControlDisp = dispinterface;
  ICallSession = interface;
  ICallSessionDisp = dispinterface;
  ICallLog = interface;
  ICallLogDisp = dispinterface;
  IRecordLog = interface;
  IRecordLogDisp = dispinterface;
  IAgentInfo = interface;
  IAgentInfoDisp = dispinterface;
  ILine = interface;
  ILineDisp = dispinterface;
  ILineEvent = interface;
  ILineEventDisp = dispinterface;
  ITerminal = interface;
  ITerminalDisp = dispinterface;
  ITerminalManager = interface;
  ITerminalManagerDisp = dispinterface;
  ITerminalCollection = interface;
  ITerminalCollectionDisp = dispinterface;
  IPresence = interface;
  IPresenceDisp = dispinterface;
  IPresenceManager = interface;
  IPresenceManagerDisp = dispinterface;
  IAddress = interface;
  IAddressDisp = dispinterface;
  IAddressManager = interface;
  IAddressManagerDisp = dispinterface;
  IAddressCollection = interface;
  IAddressCollectionDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Switch = ISwitch;
  SwitchContext = ISwitchContext;


// *********************************************************************//
// Interface: ISwitch
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8A13B942-1658-455F-914D-ED4352686B7E}
// *********************************************************************//
  ISwitch = interface(IDispatch)
    ['{8A13B942-1658-455F-914D-ED4352686B7E}']
    procedure Initialize(const pContext: SwitchContext); safecall;
    procedure Shutdown; safecall;
    function Get_Version: WideString; safecall;
    function Get_Terminals: ITerminalCollection; safecall;
    function Get_Addresses: IAddressCollection; safecall;
    property Version: WideString read Get_Version;
    property Terminals: ITerminalCollection read Get_Terminals;
    property Addresses: IAddressCollection read Get_Addresses;
  end;

// *********************************************************************//
// DispIntf:  ISwitchDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8A13B942-1658-455F-914D-ED4352686B7E}
// *********************************************************************//
  ISwitchDisp = dispinterface
    ['{8A13B942-1658-455F-914D-ED4352686B7E}']
    procedure Initialize(const pContext: SwitchContext); dispid 201;
    procedure Shutdown; dispid 202;
    property Version: WideString readonly dispid 301;
    property Terminals: ITerminalCollection readonly dispid 302;
    property Addresses: IAddressCollection readonly dispid 203;
  end;

// *********************************************************************//
// DispIntf:  ISwitchEvents
// Flags:     (4096) Dispatchable
// GUID:      {CCC320E2-B613-430D-96F2-31DDFE137386}
// *********************************************************************//
  ISwitchEvents = dispinterface
    ['{CCC320E2-B613-430D-96F2-31DDFE137386}']
    function OnInit(const term: ITerminal): HResult; dispid 201;
    function OnPickup(const term: ITerminal): HResult; dispid 202;
    function OnHangup(const term: ITerminal): HResult; dispid 203;
    function OnDialing(const term: ITerminal; const bstrDTMF: WideString): HResult; dispid 204;
    function OnRinging(const term: ITerminal; nRingCount: Integer): HResult; dispid 205;
    function OnCompleted(const term: ITerminal): HResult; dispid 206;
    function OnStateChanged(const term: ITerminal; oldState: LINE_STATE; newState: LINE_STATE): HResult; dispid 207;
    function OnIncomingCall(const term: ITerminal; const Call: ICall): HResult; dispid 208;
    function OnOutgoingCall(const term: ITerminal; const Call: ICall): HResult; dispid 209;
    function OnMakeCall(const term: ITerminal; const Call: ICall): HResult; dispid 210;
    function OnProceedCall(const term: ITerminal; const Call: ICall): HResult; dispid 211;
    function OnAcceptCall(const term: ITerminal; const Call: ICall): HResult; dispid 212;
    function OnAnswerCall(const term: ITerminal; const Call: ICall): HResult; dispid 213;
    function OnDivertCall(const term: ITerminal; const Call: ICall): HResult; dispid 214;
    function OnHoldCall(const term: ITerminal; const Call: ICall): HResult; dispid 215;
    function OnRetrieveCall(const term: ITerminal; const Call: ICall): HResult; dispid 216;
    function OnJoinCall(const term: ITerminal; const Call: ICall): HResult; dispid 217;
    function OnLeaveCall(const term: ITerminal; const Call: ICall): HResult; dispid 218;
    function OnReleaseCall(const term: ITerminal; const Call: ICall): HResult; dispid 219;
    function OnClearCall(const term: ITerminal; const Call: ICall): HResult; dispid 220;
  end;

// *********************************************************************//
// Interface: ICollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EB920DC2-1C64-48BF-B876-37CFF9AFC2B7}
// *********************************************************************//
  ICollection = interface(IDispatch)
    ['{EB920DC2-1C64-48BF-B876-37CFF9AFC2B7}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): OleVariant; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: OleVariant read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  ICollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EB920DC2-1C64-48BF-B876-37CFF9AFC2B7}
// *********************************************************************//
  ICollectionDisp = dispinterface
    ['{EB920DC2-1C64-48BF-B876-37CFF9AFC2B7}']
    property Count: Integer readonly dispid 1;
    property Item[Index: Integer]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IReadOnlyPropertyCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D1D17D48-0C22-4775-8C1A-B0D54A928433}
// *********************************************************************//
  IReadOnlyPropertyCollection = interface(ICollection)
    ['{D1D17D48-0C22-4775-8C1A-B0D54A928433}']
    function GetProperty(lPropertyId: Integer): IProperty; safecall;
    function IsPropertySet(lPropertyId: Integer): WordBool; safecall;
    function GetNamedProperty(const bstrPropertyName: WideString): IProperty; safecall;
    function IsNamedPropertySet(const bstrPropertyName: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IReadOnlyPropertyCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D1D17D48-0C22-4775-8C1A-B0D54A928433}
// *********************************************************************//
  IReadOnlyPropertyCollectionDisp = dispinterface
    ['{D1D17D48-0C22-4775-8C1A-B0D54A928433}']
    function GetProperty(lPropertyId: Integer): IProperty; dispid 201;
    function IsPropertySet(lPropertyId: Integer): WordBool; dispid 202;
    function GetNamedProperty(const bstrPropertyName: WideString): IProperty; dispid 203;
    function IsNamedPropertySet(const bstrPropertyName: WideString): WordBool; dispid 204;
    property Count: Integer readonly dispid 1;
    property Item[Index: Integer]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IProperty
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D60805B9-41E0-4731-8884-D95DFECD7DF3}
// *********************************************************************//
  IProperty = interface(IDispatch)
    ['{D60805B9-41E0-4731-8884-D95DFECD7DF3}']
    function Get_Id: Integer; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(Value: OleVariant); safecall;
    function Get_BoolValue: WordBool; safecall;
    procedure Set_BoolValue(Value: WordBool); safecall;
    function Get_StringValue: WideString; safecall;
    procedure Set_StringValue(const Value: WideString); safecall;
    function Get_NumericValue: Integer; safecall;
    procedure Set_NumericValue(Value: Integer); safecall;
    function Get_ObjectValue: IUnknown; safecall;
    procedure Set_ObjectValue(const Value: IUnknown); safecall;
    property Id: Integer read Get_Id;
    property Name: WideString read Get_Name;
    property Value: OleVariant read Get_Value write Set_Value;
    property BoolValue: WordBool read Get_BoolValue write Set_BoolValue;
    property StringValue: WideString read Get_StringValue write Set_StringValue;
    property NumericValue: Integer read Get_NumericValue write Set_NumericValue;
    property ObjectValue: IUnknown read Get_ObjectValue write Set_ObjectValue;
  end;

// *********************************************************************//
// DispIntf:  IPropertyDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D60805B9-41E0-4731-8884-D95DFECD7DF3}
// *********************************************************************//
  IPropertyDisp = dispinterface
    ['{D60805B9-41E0-4731-8884-D95DFECD7DF3}']
    property Id: Integer readonly dispid 201;
    property Name: WideString readonly dispid 202;
    property Value: OleVariant dispid 203;
    property BoolValue: WordBool dispid 204;
    property StringValue: WideString dispid 205;
    property NumericValue: Integer dispid 206;
    property ObjectValue: IUnknown dispid 207;
  end;

// *********************************************************************//
// Interface: IPropertyCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {72DA35D8-94F8-4F30-8DB0-E08374E5B664}
// *********************************************************************//
  IPropertyCollection = interface(IReadOnlyPropertyCollection)
    ['{72DA35D8-94F8-4F30-8DB0-E08374E5B664}']
    function AddProperty(lPropertyId: Integer; vValue: OleVariant): IProperty; safecall;
    procedure RemoveProperty(lPropertyId: Integer); safecall;
    function AddNamedProperty(const bstrPropertyName: WideString; vValue: OleVariant): IProperty; safecall;
    procedure RemoveNamedProperty(const bstrPropertyName: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IPropertyCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {72DA35D8-94F8-4F30-8DB0-E08374E5B664}
// *********************************************************************//
  IPropertyCollectionDisp = dispinterface
    ['{72DA35D8-94F8-4F30-8DB0-E08374E5B664}']
    function AddProperty(lPropertyId: Integer; vValue: OleVariant): IProperty; dispid 401;
    procedure RemoveProperty(lPropertyId: Integer); dispid 402;
    function AddNamedProperty(const bstrPropertyName: WideString; vValue: OleVariant): IProperty; dispid 403;
    procedure RemoveNamedProperty(const bstrPropertyName: WideString); dispid 404;
    function GetProperty(lPropertyId: Integer): IProperty; dispid 201;
    function IsPropertySet(lPropertyId: Integer): WordBool; dispid 202;
    function GetNamedProperty(const bstrPropertyName: WideString): IProperty; dispid 203;
    function IsNamedPropertySet(const bstrPropertyName: WideString): WordBool; dispid 204;
    property Count: Integer readonly dispid 1;
    property Item[Index: Integer]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: ISwitchContext
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FBF76D51-9CFC-4ABA-B194-2994BE351030}
// *********************************************************************//
  ISwitchContext = interface(IPropertyCollection)
    ['{FBF76D51-9CFC-4ABA-B194-2994BE351030}']
  end;

// *********************************************************************//
// DispIntf:  ISwitchContextDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FBF76D51-9CFC-4ABA-B194-2994BE351030}
// *********************************************************************//
  ISwitchContextDisp = dispinterface
    ['{FBF76D51-9CFC-4ABA-B194-2994BE351030}']
    function AddProperty(lPropertyId: Integer; vValue: OleVariant): IProperty; dispid 401;
    procedure RemoveProperty(lPropertyId: Integer); dispid 402;
    function AddNamedProperty(const bstrPropertyName: WideString; vValue: OleVariant): IProperty; dispid 403;
    procedure RemoveNamedProperty(const bstrPropertyName: WideString); dispid 404;
    function GetProperty(lPropertyId: Integer): IProperty; dispid 201;
    function IsPropertySet(lPropertyId: Integer): WordBool; dispid 202;
    function GetNamedProperty(const bstrPropertyName: WideString): IProperty; dispid 203;
    function IsNamedPropertySet(const bstrPropertyName: WideString): WordBool; dispid 204;
    property Count: Integer readonly dispid 1;
    property Item[Index: Integer]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IEditableCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {36E05A79-AE86-4593-9B95-4D7058A12F4F}
// *********************************************************************//
  IEditableCollection = interface(ICollection)
    ['{36E05A79-AE86-4593-9B95-4D7058A12F4F}']
    procedure Add(const Value: IUnknown); safecall;
    procedure Remove(const Value: IUnknown); safecall;
  end;

// *********************************************************************//
// DispIntf:  IEditableCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {36E05A79-AE86-4593-9B95-4D7058A12F4F}
// *********************************************************************//
  IEditableCollectionDisp = dispinterface
    ['{36E05A79-AE86-4593-9B95-4D7058A12F4F}']
    procedure Add(const Value: IUnknown); dispid 301;
    procedure Remove(const Value: IUnknown); dispid 302;
    property Count: Integer readonly dispid 1;
    property Item[Index: Integer]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IMediaDevice
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B5FBCDF9-4947-4C9E-B2B8-25428BFCE9D7}
// *********************************************************************//
  IMediaDevice = interface(IDispatch)
    ['{B5FBCDF9-4947-4C9E-B2B8-25428BFCE9D7}']
    procedure Initialize(const platform: Switch); safecall;
    procedure Shutdown; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMediaDeviceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B5FBCDF9-4947-4C9E-B2B8-25428BFCE9D7}
// *********************************************************************//
  IMediaDeviceDisp = dispinterface
    ['{B5FBCDF9-4947-4C9E-B2B8-25428BFCE9D7}']
    procedure Initialize(const platform: Switch); dispid 201;
    procedure Shutdown; dispid 202;
  end;

// *********************************************************************//
// Interface: IMediaDeviceManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EFD4B351-AE61-4C83-9905-9CA1009C6D26}
// *********************************************************************//
  IMediaDeviceManager = interface(IDispatch)
    ['{EFD4B351-AE61-4C83-9905-9CA1009C6D26}']
    function Get_Devices: ICollection; safecall;
    function AddDevice(const classId: WideString): IMediaDevice; safecall;
    property Devices: ICollection read Get_Devices;
  end;

// *********************************************************************//
// DispIntf:  IMediaDeviceManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EFD4B351-AE61-4C83-9905-9CA1009C6D26}
// *********************************************************************//
  IMediaDeviceManagerDisp = dispinterface
    ['{EFD4B351-AE61-4C83-9905-9CA1009C6D26}']
    property Devices: ICollection readonly dispid 201;
    function AddDevice(const classId: WideString): IMediaDevice; dispid 202;
  end;

// *********************************************************************//
// Interface: IMediaControl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4F848EA6-AE7A-4D45-9379-DBB283F4833B}
// *********************************************************************//
  IMediaControl = interface(IDispatch)
    ['{4F848EA6-AE7A-4D45-9379-DBB283F4833B}']
    procedure Start(const bstrVoice: WideString; vParams: OleVariant; nFlags: MEDIA_SOUND); safecall;
    procedure Stop; safecall;
    procedure Pause; safecall;
    procedure Resume; safecall;
    procedure Close; safecall;
    function Get_Status: MEDIA_STATUS; safecall;
    function Get_Count: Integer; safecall;
    property Status: MEDIA_STATUS read Get_Status;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IMediaControlDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4F848EA6-AE7A-4D45-9379-DBB283F4833B}
// *********************************************************************//
  IMediaControlDisp = dispinterface
    ['{4F848EA6-AE7A-4D45-9379-DBB283F4833B}']
    procedure Start(const bstrVoice: WideString; vParams: OleVariant; nFlags: MEDIA_SOUND); dispid 101;
    procedure Stop; dispid 102;
    procedure Pause; dispid 103;
    procedure Resume; dispid 104;
    procedure Close; dispid 105;
    property Status: MEDIA_STATUS readonly dispid 201;
    property Count: Integer readonly dispid 202;
  end;

// *********************************************************************//
// Interface: IChannel
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F49F7CC0-6A49-4083-A15E-594D3763CBB7}
// *********************************************************************//
  IChannel = interface(IDispatch)
    ['{F49F7CC0-6A49-4083-A15E-594D3763CBB7}']
    function Get_No: Integer; safecall;
    function Get_Player: IMediaControl; safecall;
    function Get_Recorder: IMediaControl; safecall;
    function Get_Sig: SIGNALING; safecall;
    function Get_Available: WordBool; safecall;
    procedure Pickup; safecall;
    procedure Hangup(nCause: HANGUP_CAUSE); safecall;
    function GetCallerId: WideString; safecall;
    function GetCalleeId: WideString; safecall;
    function GetRingCount: Integer; safecall;
    function GetDtmfBuffer: WideString; safecall;
    procedure Queue(nPriority: Integer); safecall;
    procedure Clear; safecall;
    procedure StartTimer(nDelay: Word; nMode: Word); safecall;
    procedure SendTone(nToneType: TONE_TYPE); safecall;
    procedure SendDTMF(const DestNum: WideString); safecall;
    procedure StartRing; safecall;
    procedure StopSendTone; safecall;
    procedure StopRing; safecall;
    procedure TalkWith(const ch: IChannel); safecall;
    procedure StopTalkWith(const ch: IChannel); safecall;
    procedure StopTimer; safecall;
    function CreateGroup: Integer; safecall;
    procedure ExitGroup; safecall;
    procedure JoinGroup(nGroupId: Integer); safecall;
    procedure LinkFrom(const ch: IChannel); safecall;
    procedure StopLinkFrom(const ch: IChannel); safecall;
    property No: Integer read Get_No;
    property Player: IMediaControl read Get_Player;
    property Recorder: IMediaControl read Get_Recorder;
    property Sig: SIGNALING read Get_Sig;
    property Available: WordBool read Get_Available;
  end;

// *********************************************************************//
// DispIntf:  IChannelDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F49F7CC0-6A49-4083-A15E-594D3763CBB7}
// *********************************************************************//
  IChannelDisp = dispinterface
    ['{F49F7CC0-6A49-4083-A15E-594D3763CBB7}']
    property No: Integer readonly dispid 202;
    property Player: IMediaControl readonly dispid 209;
    property Recorder: IMediaControl readonly dispid 210;
    property Sig: SIGNALING readonly dispid 207;
    property Available: WordBool readonly dispid 218;
    procedure Pickup; dispid 220;
    procedure Hangup(nCause: HANGUP_CAUSE); dispid 221;
    function GetCallerId: WideString; dispid 215;
    function GetCalleeId: WideString; dispid 216;
    function GetRingCount: Integer; dispid 219;
    function GetDtmfBuffer: WideString; dispid 213;
    procedure Queue(nPriority: Integer); dispid 228;
    procedure Clear; dispid 230;
    procedure StartTimer(nDelay: Word; nMode: Word); dispid 222;
    procedure SendTone(nToneType: TONE_TYPE); dispid 206;
    procedure SendDTMF(const DestNum: WideString); dispid 208;
    procedure StartRing; dispid 211;
    procedure StopSendTone; dispid 212;
    procedure StopRing; dispid 214;
    procedure TalkWith(const ch: IChannel); dispid 223;
    procedure StopTalkWith(const ch: IChannel); dispid 224;
    procedure StopTimer; dispid 201;
    function CreateGroup: Integer; dispid 203;
    procedure ExitGroup; dispid 204;
    procedure JoinGroup(nGroupId: Integer); dispid 205;
    procedure LinkFrom(const ch: IChannel); dispid 217;
    procedure StopLinkFrom(const ch: IChannel); dispid 225;
  end;

// *********************************************************************//
// Interface: ICall
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F72744B6-0CC8-498D-848C-F98BC5026A60}
// *********************************************************************//
  ICall = interface(IDispatch)
    ['{F72744B6-0CC8-498D-848C-F98BC5026A60}']
    function Get_InstanceId: TGUID; safecall;
    function Get_CallerId: WideString; safecall;
    function Get_CalleeId: WideString; safecall;
    function Get_Publisher: ILine; safecall;
    function Get_Subscribers: ICollection; safecall;
    function Get_Inclusions: ICollection; safecall;
    function Get_Exclusions: ICollection; safecall;
    function Get_ExitState: CALL_STATE; safecall;
    function Get_CallState: CALL_STATE; safecall;
    function Get_AccessCode: WideString; safecall;
    function Get_Automated_: WordBool; safecall;
    property InstanceId: TGUID read Get_InstanceId;
    property CallerId: WideString read Get_CallerId;
    property CalleeId: WideString read Get_CalleeId;
    property Publisher: ILine read Get_Publisher;
    property Subscribers: ICollection read Get_Subscribers;
    property Inclusions: ICollection read Get_Inclusions;
    property Exclusions: ICollection read Get_Exclusions;
    property ExitState: CALL_STATE read Get_ExitState;
    property CallState: CALL_STATE read Get_CallState;
    property AccessCode: WideString read Get_AccessCode;
    property Automated_: WordBool read Get_Automated_;
  end;

// *********************************************************************//
// DispIntf:  ICallDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F72744B6-0CC8-498D-848C-F98BC5026A60}
// *********************************************************************//
  ICallDisp = dispinterface
    ['{F72744B6-0CC8-498D-848C-F98BC5026A60}']
    property InstanceId: {NOT_OLEAUTO(TGUID)}OleVariant readonly dispid 201;
    property CallerId: WideString readonly dispid 202;
    property CalleeId: WideString readonly dispid 203;
    property Publisher: ILine readonly dispid 204;
    property Subscribers: ICollection readonly dispid 207;
    property Inclusions: ICollection readonly dispid 208;
    property Exclusions: ICollection readonly dispid 209;
    property ExitState: CALL_STATE readonly dispid 205;
    property CallState: CALL_STATE readonly dispid 210;
    property AccessCode: WideString readonly dispid 206;
    property Automated_: WordBool readonly dispid 211;
  end;

// *********************************************************************//
// Interface: ICallCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {052D5C8B-1338-4FFD-AB89-C3695E249D4C}
// *********************************************************************//
  ICallCollection = interface(IDispatch)
    ['{052D5C8B-1338-4FFD-AB89-C3695E249D4C}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): ICall; safecall;
    function Get__NewEnum: IUnknown; safecall;
    procedure Add(const Address: ICall); safecall;
    procedure Remove(const Address: ICall); safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: ICall read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  ICallCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {052D5C8B-1338-4FFD-AB89-C3695E249D4C}
// *********************************************************************//
  ICallCollectionDisp = dispinterface
    ['{052D5C8B-1338-4FFD-AB89-C3695E249D4C}']
    property Count: Integer readonly dispid 1;
    property Item[Index: Integer]: ICall readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
    procedure Add(const Address: ICall); dispid 202;
    procedure Remove(const Address: ICall); dispid 203;
  end;

// *********************************************************************//
// Interface: ICallControl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {50A1192B-4821-46C5-8D84-5087667A79CB}
// *********************************************************************//
  ICallControl = interface(IDispatch)
    ['{50A1192B-4821-46C5-8D84-5087667A79CB}']
    procedure AlternateCall; safecall;
    procedure DropCall; safecall;
    procedure ClearCall; safecall;
    procedure DivertCall(const DestNum: WideString); safecall;
    procedure HoldCall; safecall;
    procedure RetrieveCall; safecall;
    procedure JoinCall; safecall;
    procedure LeaveCall; safecall;
    procedure MakeCall(const DestNum: WideString); safecall;
    procedure Forward(cause: FORWARD_CAUSE); safecall;
    procedure ReconnectCall; safecall;
    procedure Dial(const DestNum: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  ICallControlDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {50A1192B-4821-46C5-8D84-5087667A79CB}
// *********************************************************************//
  ICallControlDisp = dispinterface
    ['{50A1192B-4821-46C5-8D84-5087667A79CB}']
    procedure AlternateCall; dispid 203;
    procedure DropCall; dispid 204;
    procedure ClearCall; dispid 205;
    procedure DivertCall(const DestNum: WideString); dispid 206;
    procedure HoldCall; dispid 207;
    procedure RetrieveCall; dispid 208;
    procedure JoinCall; dispid 201;
    procedure LeaveCall; dispid 202;
    procedure MakeCall(const DestNum: WideString); dispid 217;
    procedure Forward(cause: FORWARD_CAUSE); dispid 209;
    procedure ReconnectCall; dispid 211;
    procedure Dial(const DestNum: WideString); dispid 210;
  end;

// *********************************************************************//
// Interface: ICallSession
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {14CEDE8D-1EE9-4777-A731-D2AC3BAA0A01}
// *********************************************************************//
  ICallSession = interface(IDispatch)
    ['{14CEDE8D-1EE9-4777-A731-D2AC3BAA0A01}']
  end;

// *********************************************************************//
// DispIntf:  ICallSessionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {14CEDE8D-1EE9-4777-A731-D2AC3BAA0A01}
// *********************************************************************//
  ICallSessionDisp = dispinterface
    ['{14CEDE8D-1EE9-4777-A731-D2AC3BAA0A01}']
  end;

// *********************************************************************//
// Interface: ICallLog
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EA347EAB-FB5B-4BC0-A72B-7505DB72C815}
// *********************************************************************//
  ICallLog = interface(IDispatch)
    ['{EA347EAB-FB5B-4BC0-A72B-7505DB72C815}']
    function Get_InstanceId: TGUID; safecall;
    function Get_CallerId: WideString; safecall;
    function Get_CallerNumber: WideString; safecall;
    function Get_CallerPad: WideString; safecall;
    function Get_CallerName: WideString; safecall;
    function Get_CallerType: LINE_TYPE; safecall;
    function Get_CalleeId: WideString; safecall;
    function Get_CalleeNumber: WideString; safecall;
    function Get_CalleePad: WideString; safecall;
    function Get_CalleeName: WideString; safecall;
    function Get_CalleeType: LINE_TYPE; safecall;
    function Get_SessionId: WideString; safecall;
    function Get_Sequence: Integer; safecall;
    function Get_Conference: Integer; safecall;
    function Get_Direction: CALL_DIRECTION; safecall;
    function Get_ExitState: CALL_STATE; safecall;
    function Get_AccessCode: WideString; safecall;
    function Get_AccountCode: WideString; safecall;
    function Get_StartTime: TDateTime; safecall;
    function Get_EndTime: TDateTime; safecall;
    function Get_DialTime: TDateTime; safecall;
    function Get_RingTime: TDateTime; safecall;
    function Get_AnswerTime: TDateTime; safecall;
    function Get_QueueTime: TDateTime; safecall;
    function Get_NoAnswerTime: TDateTime; safecall;
    function Get_BusyTime: TDateTime; safecall;
    function Get_VoiceMailTime: TDateTime; safecall;
    function Get_AttendantTime: TDateTime; safecall;
    function Get_RecordTime: TDateTime; safecall;
    function Get_WrapupTime: TDateTime; safecall;
    function Get_WaitDuration: Double; safecall;
    function Get_AnswerDuration: Double; safecall;
    function Get_DialDuration: Double; safecall;
    function Get_RingDuration: Double; safecall;
    function Get_HoldDuration: Double; safecall;
    function Get_NoAnswerDuration: Double; safecall;
    function Get_BusyDuration: Double; safecall;
    function Get_QueueDuration: Double; safecall;
    function Get_TalkDuration: Double; safecall;
    function Get_RecordDuration: Double; safecall;
    function Get_VMDuration: Double; safecall;
    function Get_VMRecordDuration: Double; safecall;
    function Get_AADuration: Double; safecall;
    function Get_AAExitPoint: WideString; safecall;
    function Get_WrapupDuration: Double; safecall;
    function Get_AudioFileName: WideString; safecall;
    function Get_DtmfString: WideString; safecall;
    function Get_GMTOffset: Integer; safecall;
    property InstanceId: TGUID read Get_InstanceId;
    property CallerId: WideString read Get_CallerId;
    property CallerNumber: WideString read Get_CallerNumber;
    property CallerPad: WideString read Get_CallerPad;
    property CallerName: WideString read Get_CallerName;
    property CallerType: LINE_TYPE read Get_CallerType;
    property CalleeId: WideString read Get_CalleeId;
    property CalleeNumber: WideString read Get_CalleeNumber;
    property CalleePad: WideString read Get_CalleePad;
    property CalleeName: WideString read Get_CalleeName;
    property CalleeType: LINE_TYPE read Get_CalleeType;
    property SessionId: WideString read Get_SessionId;
    property Sequence: Integer read Get_Sequence;
    property Conference: Integer read Get_Conference;
    property Direction: CALL_DIRECTION read Get_Direction;
    property ExitState: CALL_STATE read Get_ExitState;
    property AccessCode: WideString read Get_AccessCode;
    property AccountCode: WideString read Get_AccountCode;
    property StartTime: TDateTime read Get_StartTime;
    property EndTime: TDateTime read Get_EndTime;
    property DialTime: TDateTime read Get_DialTime;
    property RingTime: TDateTime read Get_RingTime;
    property AnswerTime: TDateTime read Get_AnswerTime;
    property QueueTime: TDateTime read Get_QueueTime;
    property NoAnswerTime: TDateTime read Get_NoAnswerTime;
    property BusyTime: TDateTime read Get_BusyTime;
    property VoiceMailTime: TDateTime read Get_VoiceMailTime;
    property AttendantTime: TDateTime read Get_AttendantTime;
    property RecordTime: TDateTime read Get_RecordTime;
    property WrapupTime: TDateTime read Get_WrapupTime;
    property WaitDuration: Double read Get_WaitDuration;
    property AnswerDuration: Double read Get_AnswerDuration;
    property DialDuration: Double read Get_DialDuration;
    property RingDuration: Double read Get_RingDuration;
    property HoldDuration: Double read Get_HoldDuration;
    property NoAnswerDuration: Double read Get_NoAnswerDuration;
    property BusyDuration: Double read Get_BusyDuration;
    property QueueDuration: Double read Get_QueueDuration;
    property TalkDuration: Double read Get_TalkDuration;
    property RecordDuration: Double read Get_RecordDuration;
    property VMDuration: Double read Get_VMDuration;
    property VMRecordDuration: Double read Get_VMRecordDuration;
    property AADuration: Double read Get_AADuration;
    property AAExitPoint: WideString read Get_AAExitPoint;
    property WrapupDuration: Double read Get_WrapupDuration;
    property AudioFileName: WideString read Get_AudioFileName;
    property DtmfString: WideString read Get_DtmfString;
    property GMTOffset: Integer read Get_GMTOffset;
  end;

// *********************************************************************//
// DispIntf:  ICallLogDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EA347EAB-FB5B-4BC0-A72B-7505DB72C815}
// *********************************************************************//
  ICallLogDisp = dispinterface
    ['{EA347EAB-FB5B-4BC0-A72B-7505DB72C815}']
    property InstanceId: {NOT_OLEAUTO(TGUID)}OleVariant readonly dispid 201;
    property CallerId: WideString readonly dispid 202;
    property CallerNumber: WideString readonly dispid 203;
    property CallerPad: WideString readonly dispid 206;
    property CallerName: WideString readonly dispid 207;
    property CallerType: LINE_TYPE readonly dispid 208;
    property CalleeId: WideString readonly dispid 209;
    property CalleeNumber: WideString readonly dispid 210;
    property CalleePad: WideString readonly dispid 211;
    property CalleeName: WideString readonly dispid 212;
    property CalleeType: LINE_TYPE readonly dispid 213;
    property SessionId: WideString readonly dispid 214;
    property Sequence: Integer readonly dispid 215;
    property Conference: Integer readonly dispid 216;
    property Direction: CALL_DIRECTION readonly dispid 217;
    property ExitState: CALL_STATE readonly dispid 218;
    property AccessCode: WideString readonly dispid 219;
    property AccountCode: WideString readonly dispid 220;
    property StartTime: TDateTime readonly dispid 221;
    property EndTime: TDateTime readonly dispid 222;
    property DialTime: TDateTime readonly dispid 223;
    property RingTime: TDateTime readonly dispid 224;
    property AnswerTime: TDateTime readonly dispid 225;
    property QueueTime: TDateTime readonly dispid 226;
    property NoAnswerTime: TDateTime readonly dispid 227;
    property BusyTime: TDateTime readonly dispid 228;
    property VoiceMailTime: TDateTime readonly dispid 229;
    property AttendantTime: TDateTime readonly dispid 230;
    property RecordTime: TDateTime readonly dispid 231;
    property WrapupTime: TDateTime readonly dispid 232;
    property WaitDuration: Double readonly dispid 233;
    property AnswerDuration: Double readonly dispid 234;
    property DialDuration: Double readonly dispid 235;
    property RingDuration: Double readonly dispid 236;
    property HoldDuration: Double readonly dispid 237;
    property NoAnswerDuration: Double readonly dispid 239;
    property BusyDuration: Double readonly dispid 240;
    property QueueDuration: Double readonly dispid 241;
    property TalkDuration: Double readonly dispid 242;
    property RecordDuration: Double readonly dispid 243;
    property VMDuration: Double readonly dispid 244;
    property VMRecordDuration: Double readonly dispid 245;
    property AADuration: Double readonly dispid 246;
    property AAExitPoint: WideString readonly dispid 247;
    property WrapupDuration: Double readonly dispid 248;
    property AudioFileName: WideString readonly dispid 249;
    property DtmfString: WideString readonly dispid 250;
    property GMTOffset: Integer readonly dispid 251;
  end;

// *********************************************************************//
// Interface: IRecordLog
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DBD97BBD-42F2-441A-9A66-D0D9EB857D23}
// *********************************************************************//
  IRecordLog = interface(IDispatch)
    ['{DBD97BBD-42F2-441A-9A66-D0D9EB857D23}']
    function Get_SessionId: WideString; safecall;
    function Get_Pad: WideString; safecall;
    function Get_Number: WideString; safecall;
    function Get_StartTime: TDateTime; safecall;
    function Get_EndTime: TDateTime; safecall;
    function Get_AudioFileName: WideString; safecall;
    property SessionId: WideString read Get_SessionId;
    property Pad: WideString read Get_Pad;
    property Number: WideString read Get_Number;
    property StartTime: TDateTime read Get_StartTime;
    property EndTime: TDateTime read Get_EndTime;
    property AudioFileName: WideString read Get_AudioFileName;
  end;

// *********************************************************************//
// DispIntf:  IRecordLogDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DBD97BBD-42F2-441A-9A66-D0D9EB857D23}
// *********************************************************************//
  IRecordLogDisp = dispinterface
    ['{DBD97BBD-42F2-441A-9A66-D0D9EB857D23}']
    property SessionId: WideString readonly dispid 201;
    property Pad: WideString readonly dispid 202;
    property Number: WideString readonly dispid 203;
    property StartTime: TDateTime readonly dispid 204;
    property EndTime: TDateTime readonly dispid 205;
    property AudioFileName: WideString readonly dispid 206;
  end;

// *********************************************************************//
// Interface: IAgentInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3655131A-FFC6-4147-83F5-504DE4FAFDE5}
// *********************************************************************//
  IAgentInfo = interface(IDispatch)
    ['{3655131A-FFC6-4147-83F5-504DE4FAFDE5}']
    function Get_Address: IAddress; safecall;
    function Get_ReasonCode: Integer; safecall;
    function Get_Login: WordBool; safecall;
    function Get_LoginDuration: Double; safecall;
    function Get_LoginTime: TDateTime; safecall;
    function Get_LogoutDuration: Double; safecall;
    function Get_LogoutTime: TDateTime; safecall;
    function Get_InCallDuration: Double; safecall;
    function Get_InCallLength: Integer; safecall;
    function Get_OutCallDuration: Double; safecall;
    function Get_OutCallLength: Integer; safecall;
    function Get_HoldDuration: Double; safecall;
    function Get_HoldLength: Integer; safecall;
    function Get_VMDuration: Double; safecall;
    function Get_VMLength: Integer; safecall;
    function Get_WrapupTime: TDateTime; safecall;
    function Get_WrapUpLength: Integer; safecall;
    property Address: IAddress read Get_Address;
    property ReasonCode: Integer read Get_ReasonCode;
    property Login: WordBool read Get_Login;
    property LoginDuration: Double read Get_LoginDuration;
    property LoginTime: TDateTime read Get_LoginTime;
    property LogoutDuration: Double read Get_LogoutDuration;
    property LogoutTime: TDateTime read Get_LogoutTime;
    property InCallDuration: Double read Get_InCallDuration;
    property InCallLength: Integer read Get_InCallLength;
    property OutCallDuration: Double read Get_OutCallDuration;
    property OutCallLength: Integer read Get_OutCallLength;
    property HoldDuration: Double read Get_HoldDuration;
    property HoldLength: Integer read Get_HoldLength;
    property VMDuration: Double read Get_VMDuration;
    property VMLength: Integer read Get_VMLength;
    property WrapupTime: TDateTime read Get_WrapupTime;
    property WrapUpLength: Integer read Get_WrapUpLength;
  end;

// *********************************************************************//
// DispIntf:  IAgentInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3655131A-FFC6-4147-83F5-504DE4FAFDE5}
// *********************************************************************//
  IAgentInfoDisp = dispinterface
    ['{3655131A-FFC6-4147-83F5-504DE4FAFDE5}']
    property Address: IAddress readonly dispid 201;
    property ReasonCode: Integer readonly dispid 202;
    property Login: WordBool readonly dispid 203;
    property LoginDuration: Double readonly dispid 204;
    property LoginTime: TDateTime readonly dispid 205;
    property LogoutDuration: Double readonly dispid 206;
    property LogoutTime: TDateTime readonly dispid 207;
    property InCallDuration: Double readonly dispid 208;
    property InCallLength: Integer readonly dispid 209;
    property OutCallDuration: Double readonly dispid 210;
    property OutCallLength: Integer readonly dispid 211;
    property HoldDuration: Double readonly dispid 212;
    property HoldLength: Integer readonly dispid 213;
    property VMDuration: Double readonly dispid 214;
    property VMLength: Integer readonly dispid 215;
    property WrapupTime: TDateTime readonly dispid 216;
    property WrapUpLength: Integer readonly dispid 217;
  end;

// *********************************************************************//
// Interface: ILine
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0478A342-162B-4E7A-9A15-2C85A9065F65}
// *********************************************************************//
  ILine = interface(IDispatch)
    ['{0478A342-162B-4E7A-9A15-2C85A9065F65}']
    function Get_Terminal: ITerminal; safecall;
    function Get_Address: IAddress; safecall;
    function Get_ActiveCall: ICall; safecall;
    function Get_LineType: LINE_TYPE; safecall;
    function Get_LineState: LINE_STATE; safecall;
    function Get_IsGroup: WordBool; safecall;
    function Get_DtmfString: WideString; safecall;
    procedure Pickup; safecall;
    procedure Hangup(nCause: HANGUP_CAUSE); safecall;
    procedure Clear; safecall;
    procedure Dial(const DestNum: WideString); safecall;
    procedure BlindTransfer(const DestNum: WideString); safecall;
    procedure Flash(nHits: Integer); safecall;
    procedure PlayVoice(const bstrVoice: WideString; nMode: MEDIA_SOUND); safecall;
    procedure StopPlayVoice(nType: MEDIA_STOP); safecall;
    procedure RecordVoice(const FileName: WideString); safecall;
    procedure StopRecordVoice(nType: MEDIA_STOP); safecall;
    function Get_Active: WordBool; safecall;
    function Get_CallerId: WideString; safecall;
    function Get_CalleeId: WideString; safecall;
    procedure Login(const username: WideString; const password: WideString); safecall;
    procedure Logout; safecall;
    property Terminal: ITerminal read Get_Terminal;
    property Address: IAddress read Get_Address;
    property ActiveCall: ICall read Get_ActiveCall;
    property LineType: LINE_TYPE read Get_LineType;
    property LineState: LINE_STATE read Get_LineState;
    property IsGroup: WordBool read Get_IsGroup;
    property DtmfString: WideString read Get_DtmfString;
    property Active: WordBool read Get_Active;
    property CallerId: WideString read Get_CallerId;
    property CalleeId: WideString read Get_CalleeId;
  end;

// *********************************************************************//
// DispIntf:  ILineDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0478A342-162B-4E7A-9A15-2C85A9065F65}
// *********************************************************************//
  ILineDisp = dispinterface
    ['{0478A342-162B-4E7A-9A15-2C85A9065F65}']
    property Terminal: ITerminal readonly dispid 204;
    property Address: IAddress readonly dispid 202;
    property ActiveCall: ICall readonly dispid 218;
    property LineType: LINE_TYPE readonly dispid 206;
    property LineState: LINE_STATE readonly dispid 208;
    property IsGroup: WordBool readonly dispid 209;
    property DtmfString: WideString readonly dispid 205;
    procedure Pickup; dispid 201;
    procedure Hangup(nCause: HANGUP_CAUSE); dispid 203;
    procedure Clear; dispid 210;
    procedure Dial(const DestNum: WideString); dispid 217;
    procedure BlindTransfer(const DestNum: WideString); dispid 211;
    procedure Flash(nHits: Integer); dispid 226;
    procedure PlayVoice(const bstrVoice: WideString; nMode: MEDIA_SOUND); dispid 212;
    procedure StopPlayVoice(nType: MEDIA_STOP); dispid 213;
    procedure RecordVoice(const FileName: WideString); dispid 214;
    procedure StopRecordVoice(nType: MEDIA_STOP); dispid 216;
    property Active: WordBool readonly dispid 219;
    property CallerId: WideString readonly dispid 207;
    property CalleeId: WideString readonly dispid 215;
    procedure Login(const username: WideString; const password: WideString); dispid 220;
    procedure Logout; dispid 221;
  end;

// *********************************************************************//
// Interface: ILineEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FF9EF2A9-D0D4-4655-8736-8DD571F152D1}
// *********************************************************************//
  ILineEvent = interface(IDispatch)
    ['{FF9EF2A9-D0D4-4655-8736-8DD571F152D1}']
    function Get_Line: ILine; safecall;
    function Get_PreviousState: LINE_STATE; safecall;
    function Get_CurrentState: LINE_STATE; safecall;
    property Line: ILine read Get_Line;
    property PreviousState: LINE_STATE read Get_PreviousState;
    property CurrentState: LINE_STATE read Get_CurrentState;
  end;

// *********************************************************************//
// DispIntf:  ILineEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FF9EF2A9-D0D4-4655-8736-8DD571F152D1}
// *********************************************************************//
  ILineEventDisp = dispinterface
    ['{FF9EF2A9-D0D4-4655-8736-8DD571F152D1}']
    property Line: ILine readonly dispid 201;
    property PreviousState: LINE_STATE readonly dispid 202;
    property CurrentState: LINE_STATE readonly dispid 203;
  end;

// *********************************************************************//
// Interface: ITerminal
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BB07CC54-89B5-4EE0-92A4-C9BA730DFE79}
// *********************************************************************//
  ITerminal = interface(IDispatch)
    ['{BB07CC54-89B5-4EE0-92A4-C9BA730DFE79}']
    function Get_UniqueId: TGUID; safecall;
    function Get_Id: Integer; safecall;
    function Get_Sig: SIGNALING; safecall;
    function Get_Pad: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_State: TERMINAL_STATE; safecall;
    function Get_Certified: WordBool; safecall;
    function Get_Recording: WordBool; safecall;
    function Get_SavePath: WideString; safecall;
    function Get_Available: WordBool; safecall;
    function Get_ActiveLine: ILine; safecall;
    function Get_Addresses: IAddressCollection; safecall;
    function Get_Records: ICollection; safecall;
    function Get_Calls: ICollection; safecall;
    function GetValue(Name: TERMINAL_NAME): OleVariant; safecall;
    procedure SetValue(Name: TERMINAL_NAME; Value: OleVariant); safecall;
    procedure Pickup; safecall;
    procedure Hangup(cause: HANGUP_CAUSE); safecall;
    procedure Clear; safecall;
    procedure PlayVoice(const bstrVoice: WideString; nMode: MEDIA_SOUND); safecall;
    procedure StopPlayVoice(nType: MEDIA_STOP); safecall;
    procedure RecordVoice(const FileName: WideString); safecall;
    procedure StopRecordVoice(nType: MEDIA_STOP); safecall;
    procedure ReceiveDTMF(nLen: Integer; const DestNum: WideString); safecall;
    procedure SendDTMF(const DestNum: WideString); safecall;
    procedure BlindTransfer(const DestNum: WideString); safecall;
    procedure Flash(hits: Integer); safecall;
    procedure Ring(RingCount: Integer); safecall;
    procedure BargeIn; safecall;
    procedure Preempt(const DestNum: WideString); safecall;
    procedure Listen(const DestNum: WideString); safecall;
    procedure Interrupt(const DestNum: WideString); safecall;
    procedure Interpose(const DestNum: WideString); safecall;
    property UniqueId: TGUID read Get_UniqueId;
    property Id: Integer read Get_Id;
    property Sig: SIGNALING read Get_Sig;
    property Pad: WideString read Get_Pad;
    property Name: WideString read Get_Name;
    property State: TERMINAL_STATE read Get_State;
    property Certified: WordBool read Get_Certified;
    property Recording: WordBool read Get_Recording;
    property SavePath: WideString read Get_SavePath;
    property Available: WordBool read Get_Available;
    property ActiveLine: ILine read Get_ActiveLine;
    property Addresses: IAddressCollection read Get_Addresses;
    property Records: ICollection read Get_Records;
    property Calls: ICollection read Get_Calls;
  end;

// *********************************************************************//
// DispIntf:  ITerminalDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BB07CC54-89B5-4EE0-92A4-C9BA730DFE79}
// *********************************************************************//
  ITerminalDisp = dispinterface
    ['{BB07CC54-89B5-4EE0-92A4-C9BA730DFE79}']
    property UniqueId: {NOT_OLEAUTO(TGUID)}OleVariant readonly dispid 201;
    property Id: Integer readonly dispid 202;
    property Sig: SIGNALING readonly dispid 203;
    property Pad: WideString readonly dispid 204;
    property Name: WideString readonly dispid 205;
    property State: TERMINAL_STATE readonly dispid 206;
    property Certified: WordBool readonly dispid 207;
    property Recording: WordBool readonly dispid 208;
    property SavePath: WideString readonly dispid 209;
    property Available: WordBool readonly dispid 210;
    property ActiveLine: ILine readonly dispid 211;
    property Addresses: IAddressCollection readonly dispid 212;
    property Records: ICollection readonly dispid 213;
    property Calls: ICollection readonly dispid 214;
    function GetValue(Name: TERMINAL_NAME): OleVariant; dispid 215;
    procedure SetValue(Name: TERMINAL_NAME; Value: OleVariant); dispid 216;
    procedure Pickup; dispid 219;
    procedure Hangup(cause: HANGUP_CAUSE); dispid 220;
    procedure Clear; dispid 221;
    procedure PlayVoice(const bstrVoice: WideString; nMode: MEDIA_SOUND); dispid 222;
    procedure StopPlayVoice(nType: MEDIA_STOP); dispid 223;
    procedure RecordVoice(const FileName: WideString); dispid 224;
    procedure StopRecordVoice(nType: MEDIA_STOP); dispid 225;
    procedure ReceiveDTMF(nLen: Integer; const DestNum: WideString); dispid 226;
    procedure SendDTMF(const DestNum: WideString); dispid 227;
    procedure BlindTransfer(const DestNum: WideString); dispid 228;
    procedure Flash(hits: Integer); dispid 229;
    procedure Ring(RingCount: Integer); dispid 230;
    procedure BargeIn; dispid 231;
    procedure Preempt(const DestNum: WideString); dispid 232;
    procedure Listen(const DestNum: WideString); dispid 233;
    procedure Interrupt(const DestNum: WideString); dispid 234;
    procedure Interpose(const DestNum: WideString); dispid 235;
  end;

// *********************************************************************//
// Interface: ITerminalManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {765DCB12-3FCA-4D36-AB43-DBF11E2CC82A}
// *********************************************************************//
  ITerminalManager = interface(IDispatch)
    ['{765DCB12-3FCA-4D36-AB43-DBF11E2CC82A}']
    function Get_Terminals: ITerminalCollection; safecall;
    function Register(const ch: IChannel): ITerminal; safecall;
    procedure Unregister(const term: ITerminal); safecall;
    procedure OnComplete(const term: ITerminal); safecall;
    procedure OnStatus(const term: ITerminal; Value: LINE_STATE); safecall;
    procedure OnDTMF(const term: ITerminal; nLength: Integer; const wsLast: WideString); safecall;
    procedure OnDial(const term: ITerminal; nState: DIAL_STATE); safecall;
    procedure OnBargeIn(const term: ITerminal); safecall;
    procedure OnRingCount(const term: ITerminal; nRingCount: Integer); safecall;
    procedure OnFlashCount(const term: ITerminal; hits: Integer); safecall;
    procedure OnTimeout(const term: ITerminal); safecall;
    property Terminals: ITerminalCollection read Get_Terminals;
  end;

// *********************************************************************//
// DispIntf:  ITerminalManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {765DCB12-3FCA-4D36-AB43-DBF11E2CC82A}
// *********************************************************************//
  ITerminalManagerDisp = dispinterface
    ['{765DCB12-3FCA-4D36-AB43-DBF11E2CC82A}']
    property Terminals: ITerminalCollection readonly dispid 303;
    function Register(const ch: IChannel): ITerminal; dispid 301;
    procedure Unregister(const term: ITerminal); dispid 302;
    procedure OnComplete(const term: ITerminal); dispid 201;
    procedure OnStatus(const term: ITerminal; Value: LINE_STATE); dispid 202;
    procedure OnDTMF(const term: ITerminal; nLength: Integer; const wsLast: WideString); dispid 205;
    procedure OnDial(const term: ITerminal; nState: DIAL_STATE); dispid 210;
    procedure OnBargeIn(const term: ITerminal); dispid 211;
    procedure OnRingCount(const term: ITerminal; nRingCount: Integer); dispid 213;
    procedure OnFlashCount(const term: ITerminal; hits: Integer); dispid 207;
    procedure OnTimeout(const term: ITerminal); dispid 208;
  end;

// *********************************************************************//
// Interface: ITerminalCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F01878F3-0DA2-44C7-8D97-12AF972338DF}
// *********************************************************************//
  ITerminalCollection = interface(IDispatch)
    ['{F01878F3-0DA2-44C7-8D97-12AF972338DF}']
    function Find(const DestNum: WideString): ITerminal; safecall;
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): ITerminal; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: ITerminal read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  ITerminalCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F01878F3-0DA2-44C7-8D97-12AF972338DF}
// *********************************************************************//
  ITerminalCollectionDisp = dispinterface
    ['{F01878F3-0DA2-44C7-8D97-12AF972338DF}']
    function Find(const DestNum: WideString): ITerminal; dispid 201;
    property Count: Integer readonly dispid 1;
    property Item[Index: Integer]: ITerminal readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IPresence
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {519D2D8B-E63D-4F1C-BA10-6ADC665690B1}
// *********************************************************************//
  IPresence = interface(IDispatch)
    ['{519D2D8B-E63D-4F1C-BA10-6ADC665690B1}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Show: SHOW_TYPE; safecall;
    procedure Set_Show(Value: SHOW_TYPE); safecall;
    function Get_Priority: Integer; safecall;
    procedure Set_Priority(Value: Integer); safecall;
    function Get_Delay: TDateTime; safecall;
    procedure Set_Delay(Value: TDateTime); safecall;
    function Get_Capabilities: ICollection; safecall;
    procedure SetState(State: Integer); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Show: SHOW_TYPE read Get_Show write Set_Show;
    property Priority: Integer read Get_Priority write Set_Priority;
    property Delay: TDateTime read Get_Delay write Set_Delay;
    property Capabilities: ICollection read Get_Capabilities;
  end;

// *********************************************************************//
// DispIntf:  IPresenceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {519D2D8B-E63D-4F1C-BA10-6ADC665690B1}
// *********************************************************************//
  IPresenceDisp = dispinterface
    ['{519D2D8B-E63D-4F1C-BA10-6ADC665690B1}']
    property Name: WideString dispid 201;
    property Show: SHOW_TYPE dispid 203;
    property Priority: Integer dispid 204;
    property Delay: TDateTime dispid 205;
    property Capabilities: ICollection readonly dispid 206;
    procedure SetState(State: Integer); dispid 208;
  end;

// *********************************************************************//
// Interface: IPresenceManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2ABD24C6-4FED-4277-9F46-B82127E86263}
// *********************************************************************//
  IPresenceManager = interface(IDispatch)
    ['{2ABD24C6-4FED-4277-9F46-B82127E86263}']
    function Get_Presences: ICollection; safecall;
    property Presences: ICollection read Get_Presences;
  end;

// *********************************************************************//
// DispIntf:  IPresenceManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2ABD24C6-4FED-4277-9F46-B82127E86263}
// *********************************************************************//
  IPresenceManagerDisp = dispinterface
    ['{2ABD24C6-4FED-4277-9F46-B82127E86263}']
    property Presences: ICollection readonly dispid 201;
  end;

// *********************************************************************//
// Interface: IAddress
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BB079A5D-B5ED-410E-A0CB-B12742AE2672}
// *********************************************************************//
  IAddress = interface(IDispatch)
    ['{BB079A5D-B5ED-410E-A0CB-B12742AE2672}']
    function Get_Id: Integer; safecall;
    function Get_Number: WideString; safecall;
    procedure Set_Number(const Value: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_AccessCode: WideString; safecall;
    procedure Set_AccessCode(const Value: WideString); safecall;
    function Get_AccountCode: WideString; safecall;
    procedure Set_AccountCode(const Value: WideString); safecall;
    function Get_State: ADDRESS_STATE; safecall;
    procedure Set_State(Value: ADDRESS_STATE); safecall;
    function Get_Lines: ICollection; safecall;
    procedure AddRoute(const DestNum: WideString; cause: FORWARD_CAUSE); safecall;
    procedure AddResource(const pResource: IAddress); safecall;
    function GetValue(Name: ADDRESS_NAME): OleVariant; safecall;
    procedure SetValue(Name: ADDRESS_NAME; Value: OleVariant); safecall;
    procedure SetState(Value: Integer); safecall;
    property Id: Integer read Get_Id;
    property Number: WideString read Get_Number write Set_Number;
    property Name: WideString read Get_Name write Set_Name;
    property AccessCode: WideString read Get_AccessCode write Set_AccessCode;
    property AccountCode: WideString read Get_AccountCode write Set_AccountCode;
    property State: ADDRESS_STATE read Get_State write Set_State;
    property Lines: ICollection read Get_Lines;
  end;

// *********************************************************************//
// DispIntf:  IAddressDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BB079A5D-B5ED-410E-A0CB-B12742AE2672}
// *********************************************************************//
  IAddressDisp = dispinterface
    ['{BB079A5D-B5ED-410E-A0CB-B12742AE2672}']
    property Id: Integer readonly dispid 201;
    property Number: WideString dispid 202;
    property Name: WideString dispid 208;
    property AccessCode: WideString dispid 203;
    property AccountCode: WideString dispid 207;
    property State: ADDRESS_STATE dispid 205;
    property Lines: ICollection readonly dispid 204;
    procedure AddRoute(const DestNum: WideString; cause: FORWARD_CAUSE); dispid 209;
    procedure AddResource(const pResource: IAddress); dispid 210;
    function GetValue(Name: ADDRESS_NAME): OleVariant; dispid 212;
    procedure SetValue(Name: ADDRESS_NAME; Value: OleVariant); dispid 206;
    procedure SetState(Value: Integer); dispid 214;
  end;

// *********************************************************************//
// Interface: IAddressManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A35DAA32-4817-4C25-A11A-1EBF4D95DC3E}
// *********************************************************************//
  IAddressManager = interface(IDispatch)
    ['{A35DAA32-4817-4C25-A11A-1EBF4D95DC3E}']
    function Get_Addresses: IAddressCollection; safecall;
    function AddAddress(atype: ADDRESS_TYPE): IAddress; safecall;
    procedure RemoveAddress(const pAddress: IAddress); safecall;
    function FindAddress(Name: ADDRESS_NAME; Value: OleVariant): IAddress; safecall;
    property Addresses: IAddressCollection read Get_Addresses;
  end;

// *********************************************************************//
// DispIntf:  IAddressManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A35DAA32-4817-4C25-A11A-1EBF4D95DC3E}
// *********************************************************************//
  IAddressManagerDisp = dispinterface
    ['{A35DAA32-4817-4C25-A11A-1EBF4D95DC3E}']
    property Addresses: IAddressCollection readonly dispid 201;
    function AddAddress(atype: ADDRESS_TYPE): IAddress; dispid 204;
    procedure RemoveAddress(const pAddress: IAddress); dispid 202;
    function FindAddress(Name: ADDRESS_NAME; Value: OleVariant): IAddress; dispid 203;
  end;

// *********************************************************************//
// Interface: IAddressCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {253D9256-A921-4F39-AD3F-FB75E232EE6C}
// *********************************************************************//
  IAddressCollection = interface(IDispatch)
    ['{253D9256-A921-4F39-AD3F-FB75E232EE6C}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): IAddress; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Find(const Num: WideString): IAddress; safecall;
    procedure Add(const Address: IAddress); safecall;
    procedure Remove(const Address: IAddress); safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: IAddress read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAddressCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {253D9256-A921-4F39-AD3F-FB75E232EE6C}
// *********************************************************************//
  IAddressCollectionDisp = dispinterface
    ['{253D9256-A921-4F39-AD3F-FB75E232EE6C}']
    property Count: Integer readonly dispid 1;
    property Item[Index: Integer]: IAddress readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
    function Find(const Num: WideString): IAddress; dispid 201;
    procedure Add(const Address: IAddress); dispid 202;
    procedure Remove(const Address: IAddress); dispid 203;
  end;

// *********************************************************************//
// The Class CoSwitch provides a Create and CreateRemote method to          
// create instances of the default interface ISwitch exposed by              
// the CoClass Switch. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSwitch = class
    class function Create: ISwitch;
    class function CreateRemote(const MachineName: string): ISwitch;
  end;

  TSwitchOnInit = procedure(ASender: TObject; const term: ITerminal) of object;
  TSwitchOnPickup = procedure(ASender: TObject; const term: ITerminal) of object;
  TSwitchOnHangup = procedure(ASender: TObject; const term: ITerminal) of object;
  TSwitchOnDialing = procedure(ASender: TObject; const term: ITerminal; const bstrDTMF: WideString) of object;
  TSwitchOnRinging = procedure(ASender: TObject; const term: ITerminal; nRingCount: Integer) of object;
  TSwitchOnCompleted = procedure(ASender: TObject; const term: ITerminal) of object;
  TSwitchOnStateChanged = procedure(ASender: TObject; const term: ITerminal; oldState: LINE_STATE; 
                                                      newState: LINE_STATE) of object;
  TSwitchOnIncomingCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnOutgoingCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnMakeCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnProceedCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnAcceptCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnAnswerCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnDivertCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnHoldCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnRetrieveCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnJoinCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnLeaveCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnReleaseCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;
  TSwitchOnClearCall = procedure(ASender: TObject; const term: ITerminal; const Call: ICall) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSwitch
// Help String      : Switch
// Default Interface: ISwitch
// Def. Intf. DISP? : No
// Event   Interface: ISwitchEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TSwitch = class(TOleServer)
  private
    FOnInit: TSwitchOnInit;
    FOnPickup: TSwitchOnPickup;
    FOnHangup: TSwitchOnHangup;
    FOnDialing: TSwitchOnDialing;
    FOnRinging: TSwitchOnRinging;
    FOnCompleted: TSwitchOnCompleted;
    FOnStateChanged: TSwitchOnStateChanged;
    FOnIncomingCall: TSwitchOnIncomingCall;
    FOnOutgoingCall: TSwitchOnOutgoingCall;
    FOnMakeCall: TSwitchOnMakeCall;
    FOnProceedCall: TSwitchOnProceedCall;
    FOnAcceptCall: TSwitchOnAcceptCall;
    FOnAnswerCall: TSwitchOnAnswerCall;
    FOnDivertCall: TSwitchOnDivertCall;
    FOnHoldCall: TSwitchOnHoldCall;
    FOnRetrieveCall: TSwitchOnRetrieveCall;
    FOnJoinCall: TSwitchOnJoinCall;
    FOnLeaveCall: TSwitchOnLeaveCall;
    FOnReleaseCall: TSwitchOnReleaseCall;
    FOnClearCall: TSwitchOnClearCall;
    FIntf: ISwitch;
    function GetDefaultInterface: ISwitch;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_Version: WideString;
    function Get_Terminals: ITerminalCollection;
    function Get_Addresses: IAddressCollection;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISwitch);
    procedure Disconnect; override;
    procedure Initialize(const pContext: SwitchContext);
    procedure Shutdown;
    property DefaultInterface: ISwitch read GetDefaultInterface;
    property Version: WideString read Get_Version;
    property Terminals: ITerminalCollection read Get_Terminals;
    property Addresses: IAddressCollection read Get_Addresses;
  published
    property OnInit: TSwitchOnInit read FOnInit write FOnInit;
    property OnPickup: TSwitchOnPickup read FOnPickup write FOnPickup;
    property OnHangup: TSwitchOnHangup read FOnHangup write FOnHangup;
    property OnDialing: TSwitchOnDialing read FOnDialing write FOnDialing;
    property OnRinging: TSwitchOnRinging read FOnRinging write FOnRinging;
    property OnCompleted: TSwitchOnCompleted read FOnCompleted write FOnCompleted;
    property OnStateChanged: TSwitchOnStateChanged read FOnStateChanged write FOnStateChanged;
    property OnIncomingCall: TSwitchOnIncomingCall read FOnIncomingCall write FOnIncomingCall;
    property OnOutgoingCall: TSwitchOnOutgoingCall read FOnOutgoingCall write FOnOutgoingCall;
    property OnMakeCall: TSwitchOnMakeCall read FOnMakeCall write FOnMakeCall;
    property OnProceedCall: TSwitchOnProceedCall read FOnProceedCall write FOnProceedCall;
    property OnAcceptCall: TSwitchOnAcceptCall read FOnAcceptCall write FOnAcceptCall;
    property OnAnswerCall: TSwitchOnAnswerCall read FOnAnswerCall write FOnAnswerCall;
    property OnDivertCall: TSwitchOnDivertCall read FOnDivertCall write FOnDivertCall;
    property OnHoldCall: TSwitchOnHoldCall read FOnHoldCall write FOnHoldCall;
    property OnRetrieveCall: TSwitchOnRetrieveCall read FOnRetrieveCall write FOnRetrieveCall;
    property OnJoinCall: TSwitchOnJoinCall read FOnJoinCall write FOnJoinCall;
    property OnLeaveCall: TSwitchOnLeaveCall read FOnLeaveCall write FOnLeaveCall;
    property OnReleaseCall: TSwitchOnReleaseCall read FOnReleaseCall write FOnReleaseCall;
    property OnClearCall: TSwitchOnClearCall read FOnClearCall write FOnClearCall;
  end;

// *********************************************************************//
// The Class CoSwitchContext provides a Create and CreateRemote method to          
// create instances of the default interface ISwitchContext exposed by              
// the CoClass SwitchContext. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSwitchContext = class
    class function Create: ISwitchContext;
    class function CreateRemote(const MachineName: string): ISwitchContext;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSwitchContext
// Help String      : Switch Context
// Default Interface: ISwitchContext
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TSwitchContext = class(TOleServer)
  private
    FIntf: ISwitchContext;
    function GetDefaultInterface: ISwitchContext;
  protected
    procedure InitServerData; override;
    function Get_Count: Integer;
    function Get_Item(Index: Integer): OleVariant;
    function Get__NewEnum: IUnknown;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISwitchContext);
    procedure Disconnect; override;
    function GetProperty(lPropertyId: Integer): IProperty;
    function IsPropertySet(lPropertyId: Integer): WordBool;
    function GetNamedProperty(const bstrPropertyName: WideString): IProperty;
    function IsNamedPropertySet(const bstrPropertyName: WideString): WordBool;
    function AddProperty(lPropertyId: Integer; vValue: OleVariant): IProperty;
    procedure RemoveProperty(lPropertyId: Integer);
    function AddNamedProperty(const bstrPropertyName: WideString; vValue: OleVariant): IProperty;
    procedure RemoveNamedProperty(const bstrPropertyName: WideString);
    property DefaultInterface: ISwitchContext read GetDefaultInterface;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: OleVariant read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  published
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

class function CoSwitch.Create: ISwitch;
begin
  Result := CreateComObject(CLASS_Switch) as ISwitch;
end;

class function CoSwitch.CreateRemote(const MachineName: string): ISwitch;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Switch) as ISwitch;
end;

procedure TSwitch.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C7762D7C-83D2-48BA-9939-6E93A80AD05A}';
    IntfIID:   '{8A13B942-1658-455F-914D-ED4352686B7E}';
    EventIID:  '{CCC320E2-B613-430D-96F2-31DDFE137386}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSwitch.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as ISwitch;
  end;
end;

procedure TSwitch.ConnectTo(svrIntf: ISwitch);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TSwitch.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TSwitch.GetDefaultInterface: ISwitch;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSwitch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSwitch.Destroy;
begin
  inherited Destroy;
end;

procedure TSwitch.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    201: if Assigned(FOnInit) then
         FOnInit(Self, IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal});
    202: if Assigned(FOnPickup) then
         FOnPickup(Self, IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal});
    203: if Assigned(FOnHangup) then
         FOnHangup(Self, IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal});
    204: if Assigned(FOnDialing) then
         FOnDialing(Self,
                    IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                    Params[1] {const WideString});
    205: if Assigned(FOnRinging) then
         FOnRinging(Self,
                    IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                    Params[1] {Integer});
    206: if Assigned(FOnCompleted) then
         FOnCompleted(Self, IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal});
    207: if Assigned(FOnStateChanged) then
         FOnStateChanged(Self,
                         IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                         Params[1] {LINE_STATE},
                         Params[2] {LINE_STATE});
    208: if Assigned(FOnIncomingCall) then
         FOnIncomingCall(Self,
                         IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                         IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    209: if Assigned(FOnOutgoingCall) then
         FOnOutgoingCall(Self,
                         IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                         IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    210: if Assigned(FOnMakeCall) then
         FOnMakeCall(Self,
                     IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                     IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    211: if Assigned(FOnProceedCall) then
         FOnProceedCall(Self,
                        IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                        IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    212: if Assigned(FOnAcceptCall) then
         FOnAcceptCall(Self,
                       IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                       IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    213: if Assigned(FOnAnswerCall) then
         FOnAnswerCall(Self,
                       IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                       IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    214: if Assigned(FOnDivertCall) then
         FOnDivertCall(Self,
                       IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                       IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    215: if Assigned(FOnHoldCall) then
         FOnHoldCall(Self,
                     IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                     IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    216: if Assigned(FOnRetrieveCall) then
         FOnRetrieveCall(Self,
                         IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                         IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    217: if Assigned(FOnJoinCall) then
         FOnJoinCall(Self,
                     IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                     IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    218: if Assigned(FOnLeaveCall) then
         FOnLeaveCall(Self,
                      IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                      IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    219: if Assigned(FOnReleaseCall) then
         FOnReleaseCall(Self,
                        IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                        IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
    220: if Assigned(FOnClearCall) then
         FOnClearCall(Self,
                      IUnknown(TVarData(Params[0]).VPointer) as ITerminal {const ITerminal},
                      IUnknown(TVarData(Params[1]).VPointer) as ICall {const ICall});
  end; {case DispID}
end;

function TSwitch.Get_Version: WideString;
begin
  Result := DefaultInterface.Version;
end;

function TSwitch.Get_Terminals: ITerminalCollection;
begin
  Result := DefaultInterface.Terminals;
end;

function TSwitch.Get_Addresses: IAddressCollection;
begin
  Result := DefaultInterface.Addresses;
end;

procedure TSwitch.Initialize(const pContext: SwitchContext);
begin
  DefaultInterface.Initialize(pContext);
end;

procedure TSwitch.Shutdown;
begin
  DefaultInterface.Shutdown;
end;

class function CoSwitchContext.Create: ISwitchContext;
begin
  Result := CreateComObject(CLASS_SwitchContext) as ISwitchContext;
end;

class function CoSwitchContext.CreateRemote(const MachineName: string): ISwitchContext;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SwitchContext) as ISwitchContext;
end;

procedure TSwitchContext.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{72D9EBC5-1087-4804-A199-B53FF40784C3}';
    IntfIID:   '{FBF76D51-9CFC-4ABA-B194-2994BE351030}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSwitchContext.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISwitchContext;
  end;
end;

procedure TSwitchContext.ConnectTo(svrIntf: ISwitchContext);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSwitchContext.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSwitchContext.GetDefaultInterface: ISwitchContext;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TSwitchContext.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSwitchContext.Destroy;
begin
  inherited Destroy;
end;

function TSwitchContext.Get_Count: Integer;
begin
  Result := DefaultInterface.Count;
end;

function TSwitchContext.Get_Item(Index: Integer): OleVariant;
begin
  Result := DefaultInterface.Item[Index];
end;

function TSwitchContext.Get__NewEnum: IUnknown;
begin
  Result := DefaultInterface._NewEnum;
end;

function TSwitchContext.GetProperty(lPropertyId: Integer): IProperty;
begin
  Result := DefaultInterface.GetProperty(lPropertyId);
end;

function TSwitchContext.IsPropertySet(lPropertyId: Integer): WordBool;
begin
  Result := DefaultInterface.IsPropertySet(lPropertyId);
end;

function TSwitchContext.GetNamedProperty(const bstrPropertyName: WideString): IProperty;
begin
  Result := DefaultInterface.GetNamedProperty(bstrPropertyName);
end;

function TSwitchContext.IsNamedPropertySet(const bstrPropertyName: WideString): WordBool;
begin
  Result := DefaultInterface.IsNamedPropertySet(bstrPropertyName);
end;

function TSwitchContext.AddProperty(lPropertyId: Integer; vValue: OleVariant): IProperty;
begin
  Result := DefaultInterface.AddProperty(lPropertyId, vValue);
end;

procedure TSwitchContext.RemoveProperty(lPropertyId: Integer);
begin
  DefaultInterface.RemoveProperty(lPropertyId);
end;

function TSwitchContext.AddNamedProperty(const bstrPropertyName: WideString; vValue: OleVariant): IProperty;
begin
  Result := DefaultInterface.AddNamedProperty(bstrPropertyName, vValue);
end;

procedure TSwitchContext.RemoveNamedProperty(const bstrPropertyName: WideString);
begin
  DefaultInterface.RemoveNamedProperty(bstrPropertyName);
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TSwitch, TSwitchContext]);
end;

end.
