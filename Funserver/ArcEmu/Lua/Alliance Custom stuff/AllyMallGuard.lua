--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local ID = 10000 --Replace your ID here for your npc entry

function Boss_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Another pesky Horde...")
	pUnit:RegisterEvent("Boss_Spell", 1000, 0)
end

function Boss_Spell(pUnit, Event)
	pUnit:CastSpellOnTarget(5, pUnit:GetMainTank())
end

function Boss_OnLeaveCombat(pUnit, Event)
	pUnit:SendChatMessage(13, 0, "You have faded...")
	pUnit:RemoveEvents()
end

function Boss_OnKilledTarget(pUnit, Event)
        pUnit:SendChatMessage(14, 0, "You are not prepared!")
	pUnit:PlaySoundToSet(11466)
        pUnit:CastSpell(36300)
end

function Boss_OnDeath(pUnit, Event)
        pUnit:RemoveEvents()
end

RegisterUnitEvent(ID, 1, "Boss_OnCombat")
RegisterUnitEvent(ID, 2, "Boss_OnLeaveCombat")
RegisterUnitEvent(ID, 3, "Boss_OnKilledTarget")
RegisterUnitEvent(ID, 4, "Boss_OnDeath")
