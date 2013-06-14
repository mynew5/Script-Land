--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RuulTheDarkener_OnEnterCombat(Unit,Event)
	Unit:RegisterUnitEvent("RuulTheDarkener_Cleave", 15000, 0)
	Unit:RegisterUnitEvent("RuulTheDarkener_Spellbreaker", 18000, 0)
	local Choice = math.random(1,2)
	if(Choice == 1) then
		Unit:SendChatMessage(14, 0, "Your world is at an end.")
	elseif(Choice == 2) then
		Unit:SendChatMessage(14, 0, "The skies will darken and all will go quiet. Only then will you know the sweet serenity of death.")
	end
end

function RuulTheDarkener_Cleave(Unit,Event)
	Unit:FullCastSpellOnTarget(15284, Unit:GetClosestPlayer())
end

function RuulTheDarkener_Spellbreaker(Unit,Event)
	Unit:FullCastSpellOnTarget(35871, Unit:GetClosestPlayer())
end

function RuulTheDarkener_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function RuulTheDarkener_OnDied(Unit,Event)
	Unit:SpawnCreature(22106)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21315, 1, "RuulTheDarkener_OnEnterCombat")
RegisterUnitEvent(21315, 2, "RuulTheDarkener_OnLeaveCombat")
RegisterUnitEvent(21315, 4, "RuulTheDarkener_OnDied")