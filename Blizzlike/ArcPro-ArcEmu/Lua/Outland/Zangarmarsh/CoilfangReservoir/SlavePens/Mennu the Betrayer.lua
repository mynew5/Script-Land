--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Betrayer(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Betrayer_Healing", 5000, 0)
	Unit:RegisterEvent("Betrayer_Earth", 7000, 0)
	Unit:RegisterEvent("Betrayer_Stoneskin", 8000, 0)
	Unit:RegisterEvent("Betrayer_Fire_Totem", 10000, 0)
	Unit:RegisterEvent("Betrayer_Light_Bolt", 11000, 0)
end

function Betrayer_Healing(Unit)
	Unit:FullCastSpell(34977)
	Unit:SendChatMessage(12, 0, "Some heal...")
end

function Betrayer_Earth(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31981, Unit:GetClosestPlayer())
	Unit:SendChatMessage(12, 0, "Totem...")
end

function Betrayer_Stoneskin(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31985, Unit:GetRandomPlayer())
	Unit:SendChatMessage(12, 0, "Totem...")
end

function Betrayer_Fire_Totem(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(23419, Unit:GetClosestPlayer())
	Unit:SendChatMessage(11, 0, "Totem fire...Good...")
end

function Betrayer_Light_Bolt(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(36152, Unit:GetClosestPlayer())
	Unit:SendChatMessage(11, 0, "Catch that...")
end

RegisterUnitEvent(17941,1,"Betrayer")