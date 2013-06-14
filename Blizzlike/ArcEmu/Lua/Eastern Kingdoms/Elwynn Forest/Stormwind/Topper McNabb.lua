--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

TOPPERMCNABB = {}

function TOPPERMCNABB_onDied(Unit, event, player)
	Unit:RemoveEvents()
end

function TOPPERMCNABB_onSpawn(Unit, event, player)
	Unit:RegisterEvent("TOPPERMCNABB_Say", 30000, 0)
end

function TOPPERMCNABB_Say(Unit, event, player)
local chance = math.random(1,6)
	if(chance == 1) then
		Unit:SendChatMessage(12, 7, "Spare some change for a poor blind man? ...What do you mean I'm not blind? ...I'M NOT BLIND! I CAN SEE! It's a miracle!" )
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 7, "I will gladly pay you Tuesday for a hamburger today.")
	elseif(chance == 3) then
		Unit:SendChatMessage(12, 7, "Alms for the poor?")
	elseif(chance == 4) then
		Unit:SendChatMessage(12, 7, "Shine yer armor for a copper.")
	elseif(chance == 5) then
		Unit:SendChatMessage(12, 7, "It's all their fault, stupid Alliance army. Just had to build their towers right behind my farm.")
	elseif(chance == 6) then
		Unit:SendChatMessage(12, 7, "Help a poor bloke out?")
	end
end

RegisterUnitEvent(1402, 18, "TOPPERMCNABB_onSpawn")
RegisterUnitEvent(1402, 4, "TOPPERMCNABB_onDied") 