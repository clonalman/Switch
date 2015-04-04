object SwitchService: TSwitchService
  OldCreateOrder = False
  DisplayName = 'Switch Server'
  AfterInstall = ServiceAfterInstall
  OnContinue = ServiceContinue
  OnExecute = ServiceExecute
  OnPause = ServicePause
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 275
  Width = 428
end
