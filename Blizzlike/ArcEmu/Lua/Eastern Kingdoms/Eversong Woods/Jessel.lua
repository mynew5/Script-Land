--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: AscendScripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Jessel_OnSpawn(Unit,Event)
	Unit:CastSpell(35112)
	Unit:CastSpell(35112)
	Unit:RegisterEvent("Jessel_Text", 90000, 0)
end

function Jessel_Text(Unit,Event)
	Unit:RemoveAura(35112)
	Unit:SendChatMessage(16, 0, "Jessel wakes up, startled.")
	Unit:RegisterEvent("Jessel_Talk", 2000, 1)
end

function Jessel_Talk(Unit,Event)
	Unit:SendChatMessage(12, 1, "Was... Was it all a dream? Azuremyst, Bloodmyst, Zangarmarsh, Shadowmoon... even Zul'Aman... Jane! Jane where are you!")
	Unit:RegisterEvent("Jessel_JaneTalk", 5000, 1)
end

function Jessel_JaneTalk(Unit,Event)
local X,Y,Z = Unit:GetX(),Unit:GetY(),Unit:GetZ()
local Jane = Unit:GetCreatureNearestCoords(X,Y,Z,20098)
	Jane:SendChatMessage(12, 1, "I'm right here, daddy. You've been asleep all day long. You sure must be tired!")
	Jane:SendChatMessage(16, 0, "Jane resumes playing on the beach.")
	Unit:RegisterEvent("Jessel_TalkBack", 3000, 1)
end

function Jessel_TalkBack(Unit,Event)
	Unit:CastSpell(35112)
	Unit:SendChatMessage(12, 1, "Ah, wonderful. It was all just a dream...")
end

function Jessel_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

function Jessel_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20100, 18, "Jessel_OnSpawn")
RegisterUnitEvent(20100, 2, "Jessel_OnLeaveCombat")
RegisterUnitEvent(20100, 3, "Jessel_OnDied")