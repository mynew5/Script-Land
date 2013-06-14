function Teleporting_onUse (pUnit, Event, pMisc)
pMisc:Teleport (1, 4615.02, -3858.68, 944.155)
end
RegisterGameObjectEvent (2000000, 2, "Teleporting_onUse")