--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--TODO ,  roar movie to set combatcapable and proper blizzlikeness. Done for now.

function Roar_Frightened_Scream(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31013, Unit:GetRandomPlayer())
end

function Roar_OnKilledTarget(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(14, 0, "You didn't have to go and do that!")
end

function Roar(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Roar_Frightened_Scream", 10000, 0)
	Unit:SendChatMessage(14, 0, "I'm not afraid a' you! Do you wanna' fight? Huh, do ya'? C'mon! I'll fight ya' with both paws behind my back!")
end

function Roar_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Roar_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17546, 1, "Roar")
RegisterUnitEvent(17546, 2, "Roar_OnLeaveCombat")
RegisterUnitEvent(17546, 3, "Roar_OnKilledTarget")
RegisterUnitEvent(17546, 4, "Roar_OnDeath")