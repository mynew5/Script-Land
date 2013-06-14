--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, Janni, Recon, Nandi; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Kira Songshine
function kira_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function kira_OnCombat(Unit, event, player)
	Unit:RegisterEvent("kira_Say", 49000, 0)
end

function kira_Say(Unit, event, player)
local chance = math.random(1,3)
	if(chance == 1) then
		Unit:SendChatMessage(12, 0, "Fresh bread, baked this very morning!")
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 0, "Come get your fresh bread!")
	elseif(chance == 3) then
		Unit:SendChatMessage(12, 0, "Fresh bread for sale!")
	end
end

RegisterUnitEvent(3937, 18, "kira_OnCombat")
RegisterUnitEvent(3937, 4, "kira_Died")

--Mcnabb
function mcnabb_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function mcnabb_OnCombat(Unit, event, player)
	Unit:RegisterEvent("mcnabb_Say", 40000, 0)
end

function mcnabb_Say(Unit, event, player)
local chance = math.random(1,3)
	if(chance == 1) then
		Unit:SendChatMessage(12, 0, "It's all their fault, stupid Alliance army. Just had to build their towers right behind my farm." )
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 0, "I will gladly pay you Tuesday for a hamburger today.")
	elseif(chance == 3) then
		Unit:SendChatMessage(12, 0, "Spare some change for a poor blind man? ...What do you mean I'm not blind? ...I'M NOT BLIND! I CAN SEE! It's a miracle!")
	end
end

RegisterUnitEvent(1402, 18, "mcnabb_OnCombat")
RegisterUnitEvent(1402, 4, "mcnabb_Died")

--Myra Tyrngaarde
function tyrnge_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function tyrnge_OnCombat(Unit, event, player)
	Unit:RegisterEvent("tyrnge_Say", 29000, 0)
end

function tyrnge_Say(Unit, event, player)
local chance = math.random(1,3)
	if(chance == 1) then
		Unit:SendChatMessage(12, 0, "Fresh bread, baked this very morning!")
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 0, "Come get your fresh bread!")
	elseif(chance == 3) then
		Unit:SendChatMessage(12, 0, "Fresh bread for sale!")
	end
end

RegisterUnitEvent(5109, 18, "tyrnge_OnCombat")
RegisterUnitEvent(5109, 4, "tyrnge_Died")

--Baker
function baker_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function baker_OnCombat(Unit, event, player)
	Unit:RegisterEvent("baker_Say", 28000, 0)
end

function baker_Say(Unit, event, player)
local chance = math.random(1,3)
	if(chance == 1) then
		Unit:SendChatMessage(12, 0, "Fresh bread, baked this very morning!")
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 0, "Come get your fresh bread!")
	elseif(chance == 3) then
		Unit:SendChatMessage(12, 0, "Fresh bread for sale!")
	end
end

RegisterUnitEvent(3518, 18, "baker_OnCombat")
RegisterUnitEvent(3518, 4, "baker_Died")

--Timmy
function timmy_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function timmy_OnCombat(Unit, event, player)
	Unit:RegisterEvent("timmy_Say", 68000, 0)
end

function timmy_Say(Unit, event, player)
local chance = math.random(1,6)
	if(chance == 1) then
		Unit:SendChatMessage(12, 0, "Kitten for sale, looking for a good home." )
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 0, "I can't believe dad won't let me keep your sister.")
	elseif(chance == 3) then
		Unit:SendChatMessage(12, 0, "Can anyone give my adorable, extra little kitty a home?")
	elseif(chance == 4) then
		Unit:SendChatMessage(12, 0, "What does allergic mean anyway? And what does it have to do with either of my kitties?")
	elseif(chance == 5) then
		Unit:SendChatMessage(12, 0, "Will someone please give my little kitten a good home?")
	elseif(chance == 6) then
		Unit:SendChatMessage(12, 0, "Don't worry, I'll find a good home for ya.")
	end
end

RegisterUnitEvent(8666, 18, "timmy_OnCombat")
RegisterUnitEvent(8666, 4, "timmy_Died")

--Tosi
function tosi_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function tosi_OnCombat(Unit, event, player)
	Unit:RegisterEvent("tosi_Say", 69000, 0)
end

function tosi_Say(Unit, event, player)
	Unit:SendChatMessage(12, 0, "You are my children now. You will grow up to be a strong of the horde!")
end

RegisterUnitEvent(14498, 18, "tosi_OnCombat")
RegisterUnitEvent(14498, 4, "tosi_Died")