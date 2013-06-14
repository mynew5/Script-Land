--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Agonizing_Flames(Unit, Event)
	Unit:FullCastSpellOnTarget(40932, Unit:GetRandomPlayer(0))
	Unit:FullCastSpellOnTarget(40932, Unit:GetRandomPlayer(0))
	Unit:FullCastSpellOnTarget(40932, Unit:GetRandomPlayer(0))
end

function Agonizing_Armor(Unit, Event)
local ArmorChoice = math.random(1,2)
	if(ArmorChoice == 1) then
		Unit:SendChatMessage(12, 0, "I will make you melt...")
		Unit:FullCastSpellOnTarget(36836, Unit:GetMainTank())
	elseif(ArmorChoice == 2) then
		Unit:SendChatMessage(12, 0, "Feel the Armor disappear!")
		Unit:FullCastSpellOnTarget(36836, Unit:GetMainTank())
	end
end

function Fire_Cone(Unit, Event)
	Unit:FullCastSpellOnTarget(36876, Unit:GetClosestPlayer())
end

function Fire_Debuff(Unit, Event)
	Unit:FullCastSpellOnTarget(38010, Unit:GetClosestPlayer())
	Unit:FullCastSpellOnTarget(38010, Unit:GetClosestPlayer())
	Unit:FullCastSpellOnTarget(38010, Unit:GetClosestPlayer())
end

function Meteor_Slash(Unit, Event)
	Unit:FullCastSpellOnTarget(45150, Unit:GetMainTank())
end

function Combat_Talk(Unit, Event)
local TalkChoice = math.random(1,10)
	if(TalkChoice == 1) then
		Unit:SendChatMessage(12, 0, "I've waited for this chance to strike!")
	elseif(TalkChoice == 2) then
		Unit:SendChatMessage(12, 0, "You can't defeat the god of flames and fire!")
	elseif(TalkChoice == 3) then
		Unit:SendChatMessage(12, 0, "I will never let you win!")
	elseif(TalkChoice == 4) then
		Unit:SendChatMessage(12, 0, "Feel the power of Ragnaros!")
	elseif(TalkChoice == 5) then
		Unit:SendChatMessage(12, 0, "My fires will consume you..")
	elseif(TalkChoice == 6) then
		Unit:SendChatMessage(12, 0, "By Fire be purged!")
	elseif(TalkChoice == 7) then
		Unit:SendChatMessage(12, 0, "Let my Fury rain upon you!")
	elseif(TalkChoice == 8) then
		Unit:SendChatMessage(12, 0, "Ha Ha Ha!")
	elseif(TalkChoice == 9) then
		Unit:SendChatMessage(12, 0, "You are no match for me..")
	elseif(TalkChoice == 10) then
		Unit:SendChatMessage(12, 0, "I will win this battle!")
	end
end

function Rag_OnCombat(Unit, Event)
local CombatChoice = math.random(1,3)
	Unit:RegisterEvent("Combat_Talk", 20000, 0)
	Unit:RegisterEvent("Agonizing_Flames", 20000, 0)
	Unit:RegisterEvent("Agonizing_Armor", 28000, 0)
	Unit:RegisterEvent("Fire_Cone", 28000, 0)
	Unit:RegisterEvent("Fire_Debuff", 25000, 0)
	Unit:RegisterEvent("Meteor_Slash", 60000, 0)
	if(CombatChoice == 1) then
		Unit:SendChatMessage(12, 0, "I've returned stronger than ever before! Ha Ha Ha!")
	elseif(CombatChoice == 2) then
		Unit:SendChatMessage(12, 0, "You should have sealed me while you had the chance!")
	elseif(CombatChoice == 3) then
		Unit:SendChatMessage(12, 0, "Who dares to conquer me?!")
	end
end

function Rag_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Rag_OnKilledTarget(Unit, Event)
local KillTargChoice = math.random(1,3)
	if(KillTargChoice == 1) then
		Unit:SendChatMessage(12, 0, "Feel Eternal Agony!")
	elseif(KillTargChoice == 2) then
		Unit:SendChatMessage(12, 0, "Your body is now made to ashes..")
	elseif(KillTargChoice == 3) then
		Unit:SendChatMessage(12, 0, "Revenge is mine!")
	end
end

function Rag_OnDied(Unit, Event)
	Unit:SendChatMessage(12, 0, "No... NOOO! You will pay for this another time mortals! I will RETUUUUUURN!")
	Unit:RemoveEvents()
end

RegisterUnitEvent(11502, 1, "Rag_OnCombat")
RegisterUnitEvent(11502, 2, "Rag_OnLeaveCombat")
RegisterUnitEvent(11502, 3, "Rag_OnKilledTarget")
RegisterUnitEvent(11502, 4, "Rag_OnDied")