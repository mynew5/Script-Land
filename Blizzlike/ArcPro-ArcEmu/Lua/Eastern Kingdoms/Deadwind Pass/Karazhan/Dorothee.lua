--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

-- TODO:Timer (3 seconds before goes into combat) ,enrage when tito is killed,check video when tito is summoned.

function Dorothee_Water_Bolt(Unit, event, miscUnit, misc)
	Unit:ClearThreatList()
	Unit:FullCastSpellOnTarget(31012,Unit:GetRandomPlayer())
end

function Dorothee_Summon_Tito(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(31014)
	Unit:SendChatMessage(14, 0, "Don't let them hurt us Tito! Oh, you won't, will you?")
end

function Dorothee_Fear(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(14, 0, "Tito! Oh Tito, no!")
	Unit:FullCastSpellOnTarget(40453, Unit:GetClosestPlayer())
end

function Dorothee(Unit, event, miscUnit, misc)
	tito = 0
	--combatcap = 0
	--Unit:SetCombatCapable(0)
	Unit:SendChatMessage(14, 0, "Oh Tito, we simply must find a way home! The old wizard could be our only hope! Strawman, Roar, Tinhead, will you - wait... oh golly, look we have visitors!")
	Unit:RegisterEvent("Dorothee_Water_Bolt", 8000, 0)
	Unit:RegisterEvent("Dorothee_Summon_Tito", 10000, 1)
	Unit:RegisterEvent("Dorothee_Fear", 15000, 0)
end

function Dorothee_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Dorothee_OnDeath(pUnit, Event)
	Unit:SendChatMessage(14, 0, "Oh at last, at last I can go home!")
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17535, 1, "Dorothee")
RegisterUnitEvent(17535, 2, "Dorothee_OnLeaveCombat")
RegisterUnitEvent(17535, 4, "Dorothee_OnDeath")