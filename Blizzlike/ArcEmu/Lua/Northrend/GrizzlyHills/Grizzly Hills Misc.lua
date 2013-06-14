--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: FaKiE; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Death(pUnit, Event)
	pUnit:RemoveEvents()
end

--[[function Deciphering_the_Journal_Completed(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Let us see what this journal reveals.")
	pUnit:SetNPCFlags(0)
	pUnit:RegisterEvent
end]]

function RunicBattleGolem_EnterCombat(pUnit, Event)
local timer1=math.random(250, 8500)
	pUnit:RegisterEvent("Battle_Runes", math.random(2500,8500), 1)
end

function Battle_Runes(pUnit, Event)
	pUnit:CastSpell(52630)
end

RegisterUnitEvent(26284, 1, "RunicBattleGolem_EnterCombat")
RegisterUnitEvent(26284, 4, "Death")
RegisterUnitEvent(26284, 2, "Death")

function Iron_Rune_Shaper_EnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Rune_of_Retribution", math.random(1200,12500), 1)
end

function Rune_of_Retribution(pUnit, Event)
	pUnit:CastSpell(52628)
end

RegisterUnitEvent(26270, 1, "Iron_Rune_Shaper_EnterCombat")
RegisterUnitEvent(26270, 4, "Death")
RegisterUnitEvent(26270, 2, "Death")

function Iron_Rune_Weaver_EnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Rune_of_Retribution", math.random(1200,4500), 1)
end

function Rune_Weaving(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(52713, pUnit:GetMainTank())
		pUnit:RegisterEvent("Rune_Weaving", math.random(3500,12500), 0)
	end
end

RegisterUnitEvent(26820, 1, "Iron_Rune_Weaver_EnterCombat")
RegisterUnitEvent(26820, 4, "Death")
RegisterUnitEvent(26820, 2, "Death")

function Duskhowl_Prowler_EnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Gore", math.random(3200,6500), 1)
end

function Gore(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(32019, pUnit:GetMainTank())
		pUnit:RegisterEvent("Gore", math.random(12500,19500), 0)
	end
end

RegisterUnitEvent(27408, 1, "Duskhowl_Prowler_EnterCombat")
RegisterUnitEvent(27408, 4, "Death")
RegisterUnitEvent(27408, 2, "Death")
RegisterUnitEvent(26592, 1, "Duskhowl_Prowler_EnterCombat")
RegisterUnitEvent(26592, 4, "Death")
RegisterUnitEvent(26592, 2, "Death")

function Overseer_Durval_EnterCombat(pUnit, Event)
local RandomYell = math.random(1,4)
	pUnit:RegisterEvent("Rune_of_Destruction", math.random(1200,6500), 1)
	if(RandomYell == 1) then
		pUnit:SendChatMessage(12, 0, "Fool! You will never get away with this!")
	elseif(RandomYell == 2) then
		pUnit:SendChatMessage(12, 0, "What do you think you´re doing?")
	elseif(RandomYell == 3) then
		pUnit:SendChatMessage(12, 0, "You´ll pay for this!")
	elseif(RandomYell == 4) then
		pUnit:SendChatMessage(12, 0, "You dare to defy the sons of iron?")
	end
end

function Rune_of_Destruction(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(52715, pUnit:GetMainTank())
		pUnit:RegisterEvent("Rune_of_Destruction", math.random(12500,15500), 0)
	end
end

RegisterUnitEvent(26920, 1, "Overseer_Durval_EnterCombat")
RegisterUnitEvent(26920, 4, "Death")
RegisterUnitEvent(26920, 2, "Death")

function Overseer_Lochli_EnterCombat(pUnit, Event)
local RandomYell = math.random(1,4)
	pUnit:RegisterEvent("Thunderstorm", math.random(1200,6500), 1)
	if(RandomYell == 1) then
		pUnit:SendChatMessage(12, 0, "Fool! You will never get away with this!")
	elseif(RandomYell == 2) then
		pUnit:SendChatMessage(12, 0, "What do you think you´re doing?")
	elseif(RandomYell == 3) then
		pUnit:SendChatMessage(12, 0, "You´ll pay for this!")
	elseif(RandomYell == 4) then
		pUnit:SendChatMessage(12, 0, "You dare to defy the sons of iron?")
	end
end

function Thunderstorm(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(52717, 	pUnit:GetMainTank())
		pUnit:RegisterEvent("Thunderstorm", math.random(12500, 15500), 0)
	end
end

RegisterUnitEvent(26922, 1, "Overseer_Lochli_EnterCombat")
RegisterUnitEvent(26922, 4, "Death")
RegisterUnitEvent(26922, 2, "Death")

function Overseer_Korgan_EnterCombat(pUnit, Event)
local RandomYell = math.random(1,4)
	pUnit:RegisterEvent("Call_Lightning", math.random(1200,6500), 1)
	pUnit:RegisterEvent("Korgan_Heal", 1000, 0)
	if(RandomYell == 1) then
		pUnit:SendChatMessage(12, 0, "Fool! You will never get away with this!")
	elseif(RandomYell == 2) then
		pUnit:SendChatMessage(12, 0, "What do you think you´re doing?")
	elseif(RandomYell == 3) then
		pUnit:SendChatMessage(12, 0, "You´ll pay for this!")
	elseif(RandomYell == 4) then
		pUnit:SendChatMessage(12, 0, "You dare to defy the sons of iron?")
	end
end

function Call_Lightning(pUnit, Event)
	if (pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(32018, 	pUnit:GetMainTank())
		pUnit:RegisterEvent("Call_Lightning", math.random(12500,15500), 0)
	end
end

function Korgan_Heal(pUnit, Event)
	if(healed == 1) then
	else
		if(pUnit:GetHealthPct() < 20) then
			pUnit:CastSpell(52714)
			healed=1
		end
	end
end

RegisterUnitEvent(26921, 1, "Overseer_Korgan_EnterCombat")
RegisterUnitEvent(26921, 4, "Death")
RegisterUnitEvent(26921, 2, "Death")

function Iron_Rune_Overseer_EnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Call_Lignthing", math.random(1200,4500), 1)
end

RegisterUnitEvent(27177, 1, "Iron_Rune_Overseer_EnterCombat")
RegisterUnitEvent(27177, 4, "Death")
RegisterUnitEvent(27177, 2, "Death")

function Overseer_Brunon_EnterCombat(pUnit, Event)
local RandomYell = math.random(1,4)
	if(RandomYell == 1) then
		pUnit:SendChatMessage(12, 0, "Fool! You will never get away with this!")
	elseif(RandomYell == 2) then
		pUnit:SendChatMessage(12, 0, "What do you think you´re doing?")
	elseif(RandomYell == 3) then
		pUnit:SendChatMessage(12, 0, "You´ll pay for this!")
	elseif(RandomYell == 4) then
		pUnit:SendChatMessage(12, 0, "You dare to defy the sons of iron?")
	end
end

RegisterUnitEvent(26923, 1, "Overseer_Brunon_EnterCombat")
RegisterUnitEvent(26923, 4, "Death")
RegisterUnitEvent(26923, 2, "Death")

function Iron_Rune_Smith_EnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Smelt_Rune", math.random(3200,6500), 1)
	pUnit:RegisterEvent("Lightning_Charged", 100, 1)
end

function Smelt_Rune(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(52699, pUnit:GetMainTank())
		pUnit:RegisterEvent("Smelt_Rune", math.random(12500,15500), 0)
	end
end

RegisterUnitEvent(26408, 1, "Iron_Rune_Smith_EnterCombat")
RegisterUnitEvent(26408, 4, "Death")
RegisterUnitEvent(26408, 2, "Death")

function Rune_Smith_Durar_EnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Lightning_Charged", 100, 1)
end

function Lightning_Charged(pUnit, Event)
	pUnit:CastSpell(52710)
end

RegisterUnitEvent(26408, 1, "Iron_Rune_Smith_EnterCombat")
RegisterUnitEvent(26408, 4, "Death")
RegisterUnitEvent(26408, 2, "Death")

function Frostpaw_Warrior_EnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Frostpaw_Rend", math.random(5200,13500), 1)
	pUnit:RegisterEvent("Demoralizing_Shout", math.random(5200,13500), 1)
end

function Frostpaw_Rend(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(12054, pUnit:GetMainTank())
		pUnit:RegisterEvent("Frostpaw_Rend", math.random(10000,22500), 0)
	end
end

function Demoralizing_Shout(pUnit, Event)
	pUnit:CastSpell(13730)
	pUnit:RegisterEvent("Demoralizing_Shout", math.random(30000,45000), 0)
end

RegisterUnitEvent(26357, 1, "Frostpaw_Warrior_EnterCombat")
RegisterUnitEvent(26357, 4, "Death")
RegisterUnitEvent(26357, 2, "Death")

function Tallhorn_Stag_EnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Gore", math.random(3200,13500), 1)
end

RegisterUnitEvent(26363, 1, "Tallhorn_Stag_EnterCombat")
RegisterUnitEvent(26363, 4, "Death")
RegisterUnitEvent(26363, 2, "Death")

function Warlord_ZimBo_EnterCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "For Drak'Tharon!")
	pUnit:RegisterEvent("ZimBo_Talk", 1500, 1)
end

function ZimBo_Talk(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Zim'Bo must live to slay our betrayer!")
	pUnit:CastSpell(52283)
	pUnit:RegisterEvent("ZimBo_Talk2", 1800, 1)
	pUnit:RegisterEvent("SkullCrack", math.random(3500,7500), 1)
end

function SkullCrack(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:CastSpellOnTarget(3551, pUnit:GetMainTank())
		pUnit:RegisterEvent("SkullCrack", math.random(3500,8500), 1)
	end
end

function ZimBo_Talk2(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Zim'Bo Cannot be stopped! Da keep must be liberated!")
	pUnit:RegisterEvent("ZimBo_Talk3", 2000, 1)
end

function ZimBo_Talk3(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "You be dyin' along with all dese scourge!")
end

function ZimboDeath(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Betrayed by one of our own we were. Disgraced...")
	pUnit:RemoveEvents()
end

RegisterUnitEvent(26544, 1, "Warlord_ZimBo_EnterCombat")
RegisterUnitEvent(26544, 4, "ZimboDeath")
RegisterUnitEvent(26544, 2, "Death")

--[[function First_Prophecy(pUnit, Event)
	pUnit:MarkQuestObjectiveAsComplete (12058, 0)
	pUnit:SendChatMessage(
end

function Second_Prophecy(pUnit, Event)
	pUnit:MarkQuestObjectiveAsComplete (x, 1)
end

function Third_Prophecy(pUnit, Event)
	pUnit:MarkQuestObjectiveAsComplete (x, 2)
end

RegisterGameObjectEvent(x, 2, "x")
"'Greatest of the Maker's children, arise and claim your birthright.'"
"'Shall return to the cradle of iron and stone.'"
"'Return to Ulduar, nestled in the embrace of the storm.'"

BRINGING DOWN THE IRON THANE
"I´ll admit, dwarf, I was pleasantly surprised to see your plan succeed."
"We can´t just let you return to your companions and we can´t take you with us..."
"Wait a minute here! You promised to spare me if I helped you. I held up my end o' the bargain!"
"Stay your blade, Chieftain. He may yet have value to us."
"Remember the dwarven journal that was discovered? Well, this dwarf could be exactly what we need to track down Brann Bronzebeard and capture him."
"By the light, Brann's alive? I'd never help you capture him!"
"You will if you wish to keep your head attached to your shoulders."
"He will live so long as he proves useful. I'd be careful if I was you, dwarf."
MISSING JOURNAL PAGE?
"This is an intriguing find, NAME, but I don´t know what to make of it."
"The language is unfamiliar and for all we know, it´s just some soldier's journal."
"Let me take a look at that."
"Hmm..."
"This journal is written in dwarven. I can´t read this scrawl, but I can make out one thing."
"'Brann Bronzebeard.' The brother of Ironforge's king? You may have spoken too soon, Paluna."]]