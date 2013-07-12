--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Maiev Shadowsong says: Curse you, Akama! I am not a pawn in your game... my will is my own. When I unleash my wrath upon Illidan it will have nothing to do with your foolish scheme!
Maiev Shadowsong says: If we truly desire the same thing, Akama, then release me! If Illidan is to die, it shall be by my hand!
Maiev Shadowsong says: Release me immediately or face my wrath!
Maiev Shadowsong says: This cell won't hold me for long. I will have Illidan's head one way or another.]]

function Maiev_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function Maiev_OnCombat(Unit, event, player)
	Unit:RegisterEvent("Maiev_Say", 62000, 0)
end

function Maiev_Say(Unit, event, player)
	Unit:SendChatMessage(12, 0, "I've waited for this moment for years. Illidan and his lapdogs will be destroyed!!")
	Unit:SendChatMessage(12, 0, "You've sealed your fate, Akama. The Master will learn of your betrayal!")
end

RegisterUnitEvent(21699, 18, "Maiev_OnCombat")
RegisterUnitEvent(21699, 4, "Maiev_Died")