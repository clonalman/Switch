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
program Switch;

uses
  SvcMgr,
  Call_TLB in 'Call_TLB.pas',
  Common in '..\Core\Common.pas',
  BmpApi in '..\Core\ShCti\BmpApi.pas',
  Shpa3api in '..\Core\ShCti\Shpa3api.pas',
  ShPcmApi in '..\Core\ShCti\ShPcmApi.pas',
  EventSink in '..\Core\EventSink.pas',
  uSwitchService in 'uSwitchService.pas' {CallService: TService},
  uPipeMessage in 'uPipeMessage.pas',
  uPipeServer in 'uPipeServer.pas',
  uSwitchPipeServer in 'uSwitchPipeServer.pas',
  uSwitchClient in 'uSwitchClient.pas',
  uPipeConnection in 'uPipeConnection.pas';

{$R *.RES}
var
  Started, Stopped: Boolean;

begin
  Application.Initialize;
  Application.CreateForm(TSwitchService, ASwitchService);
  ASwitchService.ServiceStart(ASwitchService, Started);
  ASwitchService.ServiceExecute(ASwitchService);
  ASwitchService.ServiceStop(ASwitchService, Stopped);
  //Application.Run;
end.
