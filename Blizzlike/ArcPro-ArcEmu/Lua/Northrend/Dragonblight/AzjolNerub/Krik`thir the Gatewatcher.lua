--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Krikthir_OnEnterCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "This kingdom belongs to the Scourge! Only the dead may enter.")
	pUnit:RegisterEvent("Krikthir_MindFlay", 7000, 0)
	pUnit:RegisterEvent("Krikthir_CurseofFatigue", 10000, 0)
	if(pUnit:GetHealthPct() < 10) then
		pUnit:RegisterEvent("Krikthir_Enrage", 1, 1)
	end
end

function Krikthir_MindFlay(pUnit, Event)
	pUnit:FullCastSpellOnTarget(52586, pUnit:GetRandomPlayer(0))
end

function Krikthir_CurseofFatigue(pUnit, Event)
	pUnit:FullCastSpell(52592)
end

function Krikthir_Enrage(pUnit,Event)
	pUnit:CastSpell(28747)
end

function Krikthir_OnKilledTarget(pUnit, Event)
	local choice = math.random(1,2)
	if(choice == 1) then
		pUnit:SendChatMessage(14, 0, "You were foolish to come.")
	elseif(choice == 2) then	
		pUnit:SendChatMessage(14, 0, "As Anub'Arak commands!")
	end
end

function Krikthir_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

function Krikthir_OnDied(pUnit, Event, player)
	pUnit:SendChatMessage(14, 0, "I should be grateful. But I long ago lost the capacity.")
	pUnit:RemoveEvents()
end

RegisterUnitEvent(28684, 1, "Krikthir_OnEnterCombat")
RegisterUnitEvent(28684, 2, "Krikthir_OnLeaveCombat")
RegisterUnitEvent(28684, 4, "Krikthir_OnDied")
RegisterUnitEvent(28684, 3, "Krikthir_OnKilledTarget")