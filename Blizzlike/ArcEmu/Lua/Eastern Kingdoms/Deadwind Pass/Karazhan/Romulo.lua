--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[Romulo yells: How well my comfort is revived by this!
Romulo yells: Thou detestable maw, thou womb of death; I enforce thy rotten jaws to open!
Romulo yells: Thou smilest... upon the stroke that... murders me.
Romulo yells: Wilt thou provoke me? Then have at thee, boy!]]

function Romulo_Backward_Lunge(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30815, Unit:GetRandomPlayer())
end

function Romulo_Deadly_Swathe(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(30817)
end

function Romulo_Daring(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(30841)
end

function Romulo_Poisoned_Thrust(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(30822)
end

function Romulo(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Romulo_Backward_Lunge", 10000, 0)
	Unit:RegisterEvent("Romulo_Deadly_Swathe", 15000, 0)
	Unit:RegisterEvent("Romulo_Daring", 21000, 0)
	Unit:RegisterEvent("Romulo_Poisoned_Thrust", 60000, 0)
end

function Romulo_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Romulo_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17533, 1, "Romulo")
RegisterUnitEvent(17533, 2, "Romulo_OnLeaveCombat")
RegisterUnitEvent(17533, 4, "Romulo_OnDeath")