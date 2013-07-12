--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local Didthat = 0
function Kazzak_Enrage(Unit, Event, MiscUnit, Misc)
	if((Unit:GetHealthPct() < 30) and (Didthat == 0)) then
		Unit:FullCastSpell(34670)
		Didthat = 1
	else
	end
end

function Kazzak_Shadow_Bolt(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(29924, Unit:ClosestPlayer())
	Unit:SendChatMessage(11, 0, "Shadow Bolt on you...")
end

function Kazzak_Reflection(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(21063, Unit:ClosestPlayer())
	Unit:SendChatMessage(11, 0, "Now a reflection on you...")
end

function Kazzak_Kazzak(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(32960, Unit:ClosestPlayer())
	Unit:SendChatMessage(11, 0, "Mark Of Kazzak...")
end

function Kazzak_Cleave(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpell(31779)
	Unit:SendChatMessage(11, 0, "Cleave...")
end

function Kazzak_Thunderclap(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36706, Unit:ClosestPlayer())
	Unit:SendChatMessage(11, 0, "Thunderclap...")
end

function Kazzak_Void_Bolt(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(39329, Unit:ClosestPlayer())
	Unit:SendChatMessage(11, 0, "Now a good Void Bolt...")
end

function Kazzak_Soul(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpell(32966)
	Unit:SendChatMessage(11, 0, "Now you will die...")
end

function Kazzak(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Kazzak_Enrage", 1000, 1)
	Unit:RegisterEvent("Kazzak_Shadow_Bolt", 10000, 0)
	Unit:RegisterEvent("Kazzak_Reflection", 17000, 0)
	Unit:RegisterEvent("Kazzak_Kazzak", 23000, 0)
	Unit:RegisterEvent("Kazzak_Cleave", 27000, 0)
	Unit:RegisterEvent("Kazzak_Thunderclap", 33000, 0)
	Unit:RegisterEvent("Kazzak_Void_Bolt", 37000, 0)
	Unit:RegisterEvent("Kazzak_Soul", 600000, 1)
end

RegisterUnitEvent(18728,1,"Kazzak")