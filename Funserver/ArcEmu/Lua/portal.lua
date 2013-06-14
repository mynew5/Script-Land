function Teleporting_onUse(pUnit, Event, pMisc)
  pMisc:Teleport(0, -4843,34, -1063,29, 502,191)
end

RegisterGameObjectEvent(5900001, 2, "Teleporting_onUse")
