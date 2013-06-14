--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EDT_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "I will crush you into little tiny pieces!")
	pUnit:RegisterEvent("AvatarofFlame", 7000, 0)
	pUnit:RegisterEvent("HandOfThaurissan", 14000, 0)
end

function AvatarofFlame(pUnit,Event)
	pUnit:CastSpell(15636)
end

function HandOfThaurissan(pUnit, Event)
	pUnit:CastSpell(17492)
end

--[[Aggro encounter will go here.

What he say to start aggro: Come to aid the Throne!

What he say after aggro (killing Shadowforge Senate): Thank you for clearing out those foolish senators. Now prepare to meet your doom at the hands of Ragnaros' most powerful servant.
They were just getting in the way anyways.
pUnit:SendChatMessage(14, 0, "They were just getting in the way anyways.")]]

function EDT_OnKilledTarget(pUnit, Event)
local npcsay = math.random(1,3)
	if(npcsay == 1) then
		pUnit:SendChatMessage(14, 0, "Hail to the King, baby!")
	elseif(npcsay == 2) then
		pUnit:SendChatMessage(14, 0, "Is that the best you can do? Do you really expect that you could defeat someone as awe inspiring as me?")
	else
		pUnit:SendChatMessage(14, 0, "Your efforts are utterly pointless, fools! You will never be able to defeat me!")
	end
end

function EDT_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function EDT_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9019, 1, "EDT_OnCombat")
RegisterUnitEvent(9019, 2, "EDT_OnLeaveCombat")
RegisterUnitEvent(9019, 3, "EDT_OnKilledTarget")
RegisterUnitEvent(9019, 4, "EDT_OnDeath")