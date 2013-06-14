--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Commander Sarannis yells: Band'or shorel'aran!
Commander Sarannis yells: Guards, rally! Cut these invaders down!
Commander Sarannis yells: I have not yet... begun to...
Commander Sarannis yells: Mission accomplished!
Commander Sarannis yells: Oh, stop your whimpering!
Commander Sarannis yells: Step forward. I will see that you are properly welcomed!
Commander Sarannis yells: We must not fail our leader! Kael'thas will redeem us!
Commander Sarannis yells: You are no longer dealing with some underling!]]

function Sarannis(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Sarannis_Arcane_Resonance", 10000, 0)
	Unit:RegisterEvent("Sarannis_Arcane_Devastation", 21000, 0)
end

function Sarannis_Arcane_Resonance(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(34794, Unit:GetClosestPlayer())
end

function Sarannis_Arcane_Devastation(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(34799, Unit:GetClosestPlayer())
end

RegisterUnitEvent(17976,1,"Sarannis")