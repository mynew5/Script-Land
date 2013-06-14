--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Moon Project; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SunbladeMagister_OnCombat(Unit, Event)
	Unit:RegisterAIUpdateEvent(3000)
end

function SunbladeMagister_Frostbolt(Unit, Event)
local plr = Unit:GetRandomPlayer(1)
	if(plr) then
		Unit:FullCastSpellOnTarget(46035, plr)
	end
end

function SunbladeMagister_ArcaneNova(Unit)
	local arcaneflip = math.random(6)
	local plr = Unit:GetRandomPlayer(7)
	if((arcaneflip == 1) and (plr ~= nil)) then
		Unit:FullCastSpellOnTarget(46036, plr)
	else
	end
end

function SunbladeMagister_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
end

function SunbladeMagister_OnDied(Unit)
	Unit:RemoveEvents()
	Unit:RemoveAIUpdateEvent()
end

RegisterUnitEvent(24685, 1, "SunbladeMagister_OnCombat")
RegisterUnitEvent(24685, 21,"SunbladeMagister_Frostbolt")
RegisterUnitEvent(24685, 21,"SunbladeMagister_ArcaneNova")
RegisterUnitEvent(24685, 2, "SunbladeMagister_OnLeaveCombat")
RegisterUnitEvent(24685, 4, "SunbladeMagister_OnDied")