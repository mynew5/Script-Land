--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Kalithresh(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Kalithresh_Reflect", 8000, 0)
	Unit:RegisterEvent("Kalithresh_Empale", 10000, 0)
	Unit:RegisterEvent("Kalithresh_Rage", 180000, 1)
end

function Kalithresh_Reflect(Unit)
	Unit:FullCastSpell(37885)
	Unit:SendChatMessage(12, 0, "I will reflect your sprell NOOB...")
end

function Kalithresh_Empale(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(36453, Unit:GetRandomPlayer())
	Unit:SendChatMessage(12, 0, "Do you like when i bash you...")
end

function Kalithresh_Rage(Unit)
	Unit:FullCastSpell(34451)
	Unit:SendChatMessage(12, 0, "Let's go...")
end

RegisterUnitEvent(17798, 1, "Kalithresh")