--[[----------------------------------------------------------------------------

  Application Name: RotarySwitch

  Description:
  Retrieving the state of the built-in rotary switch

  This sample is retrieving the state of the built-in rotary switch every time the
  timer expires. The position of the switch at that moment is then printed to the
  console. With the app running, the rotary switch has to be turned to show changes.
  A SIM4000 or another device with a built-in rotary switch is necessary to run
  this sample.

------------------------------------------------------------------------------]]
--Start of Global Scope---------------------------------------------------------

-- Creation of rotary switch handle
-- luacheck: globals gRotary gTimerHandle
gRotary = Switch.create('ROTARY')

-- Creation of timer handle and configuration. Timer is set to three seconds.
gTimerHandle = Timer.create()
Timer.setPeriodic(gTimerHandle, true)
Timer.setExpirationTime(gTimerHandle, 3000)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

--Declaration of the 'main' function as an entry point for the event loop
--@main()
local function main()
  Timer.start(gTimerHandle)
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--@handleOnExpired()
local function handleOnExpired()
  local state = Switch.getState(gRotary)
  print('State of rotary switch: ' .. state)
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'handleOnExpired' function to the timer 'OnExpired' event
Timer.register(gTimerHandle, 'OnExpired', handleOnExpired)

--End of Function and Event Scope-----------------------------------------------
