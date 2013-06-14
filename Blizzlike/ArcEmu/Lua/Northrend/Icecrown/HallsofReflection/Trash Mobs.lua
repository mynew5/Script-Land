--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2011 - 2013. ]]

local tank = Unit:GetMainTank()
local player = Unit:GetRandomPlayer(0)

--Frostsworn General
function Frostsworn_OnEnterCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "You are not worthy to face the Lich King!")
	Unit:RegisterEvent("Throw_Shield", 1000, 0)
end

function Throw_Shield(Unit, Event)
	Unit:CastSpellOnTarget(69222, tank)
end

function Frostsworn_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents() 
end

function Frostsworn_OnDeath(Unit, Event)
	Unit:SendChatMessage(14, 0, "Master, I have failed...")
	Unit:RemoveEvents() 
end

RegisterUnitEvent(36723, 1, "Frostsworn_OnEnterCombat")
RegisterUnitEvent(36723, 3, "Frostsworn_OnLeaveCombat")
RegisterUnitEvent(36723, 4, "Frostsworn_OnDeath")

--Ghostly Priest
function Priest_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Circle_Destruction", 7000, 0)
	Unit:RegisterEvent("Fear", 14000, 0)
	Unit:RegisterEvent("Dark_Mending", 21000, 0)
	Unit:RegisterEvent("Pain", 28000, 0)
end

function Circle_Destruction(Unit, Event)
	Unit:CastSpellOnTarget(72320, player)
end

function Fear(Unit, Event)
	Unit:FullCastSpellOnTarget(72321, player)
end

function Dark_Mending(Unit, Event)
	Unit:FullCastSpellOnTarget(72322, player)
end

function Pain(Unit, Event)
	Unit:CastSpellOnTarget(72318, player)
end

function Priest_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents() 
	Unit:Despawn(1, 0)
end

function Priest_OnDeath(Unit, Event)
	Unit:RemoveEvents() 
	Unit:Despawn(1, 0)
end

RegisterUnitEvent(38175, 1, "Priest_OnEnterCombat")
RegisterUnitEvent(38175, 3, "Priest_OnLeaveCombat")
RegisterUnitEvent(38175, 4, "Priest_OnDeath")

--Phantom Mage
function Mage_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Ice", 1000, 0)
	Unit:RegisterEvent("Fireball", 7000, 0)
	Unit:RegisterEvent("Flamestrike", 14000, 0)
	Unit:RegisterEvent("Frostbolt", 21000, 0)
	Unit:RegisterEvent("Hallucination_one", 28000, 0)
	Unit:RegisterEvent("Hallucination_two", 35000, 0)
end

function Ice(Unit, Event)
	Unit:FullCastSpellOnTarget(72171, player)
end

function Fireball(Unit, Event)
	Unit:FullCastSpellOnTarget(72163, player)
end

function Flamestrike(Unit, Event)
	Unit:FullCastSpellOnTarget(72169, player)
end

function Frostbolt(Unit, Event)
	Unit:FullCastSpellOnTarget(72166, player)
end

function Hallucination_one(Unit, Event)
	if(Unit:GetHealthPct() <= 50) then
		Unit:CastSpellOnTarget(72343, player)
	end
end

function Hallucination_two(Unit, Event)
	if(Unit:GetHealthPct() <= 30) then
		Unit:CastSpellOnTarget(72342, player)
	end
end

function Mage_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents() 
	Unit:Despawn(1, 0)
end

function Mage_OnDeath(Unit, Event)
	Unit:RemoveEvents() 
	Unit:Despawn(1, 0)
end

RegisterUnitEvent(38172, 1, "Mage_OnEnterCombat")
RegisterUnitEvent(38172, 3, "Mage_OnLeaveCombat")
RegisterUnitEvent(38172, 4, "Mage_OnDeath")

--Shadowy Mercenary
function Mercenary_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Poison", 1000, 0)
	Unit:RegisterEvent("Dagger", 7000, 0)
	Unit:RegisterEvent("Kidney", 14000, 0)
	Unit:RegisterEvent("Shadowstep", 21000, 0)
end

function Poison(Unit, Event)
	Unit:CastSpellOnTarget(72329, player)
end

function Dagger(Unit, Event)
	Unit:CastSpellOnTarget(72333, player)
end

function Kidney(Unit, Event)
	Unit:CastSpellOnTarget(72335, player)
end

function Shadowstep(Unit, Event)
	Unit:CastSpellOnTarget(72326, player)
end

function Mercenary_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents() 
	Unit:Despawn(1, 0)
end

function Mercenary_OnDeath(Unit, Event)
	Unit:RemoveEvents() 
	Unit:Despawn(1, 0)
end

RegisterUnitEvent(38177, 1, "Mercenary_OnEnterCombat")
RegisterUnitEvent(38177, 3, "Mercenary_OnLeaveCombat")
RegisterUnitEvent(38177, 4, "Mercenary_OnDeath")

--Spectral Footman
function Footman_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Enrage", 1000, 0)
	Unit:RegisterEvent("Strike", 7000, 0)
	Unit:RegisterEvent("Bash", 14000, 0)
end

function Enrage(Unit, Event)
	Unit:CastSpell(72203)
	Unit:RegisterEvent("Enrage", 1000, 0)
end

function Strike(Unit, Event)
	Unit:FullCastSpellOnTarget(72198, player)
end

function Bash(Unit, Event)
	Unit:CastSpellOnTarget(72194, player)
end

function Footman_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents() 
	Unit:Despawn(1, 0)
end

function Footman_OnDeath(Unit, Event)
	Unit:RemoveEvents() 
	Unit:Despawn(1, 0)
end

RegisterUnitEvent(38173, 1, "Footman_OnEnterCombat")
RegisterUnitEvent(38173, 3, "Footman_OnLeaveCombat")
RegisterUnitEvent(38173, 4, "Footman_OnDeath")

--Tortured Rifleman
function Rifleman_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Shoot", 1000, 0)
	Unit:RegisterEvent("Frost", 7000, 0)
	Unit:RegisterEvent("Cursed", 14000, 0)
	Unit:RegisterEvent("Ice", 21000, 0)
	Unit:RegisterEvent("Shot", 28000, 0)
end

function Shoot(Unit, Event)
	Unit:FullCastSpellOnTarget(72208, player)
end
function Frost(Unit, Event)
	Unit:CastSpellOnTarget(72215, player)
end
function Cursed(Unit, Event)
	Unit:CastSpellOnTarget(72222, player)
end
function Ice(Unit, Event)
	Unit:CastSpellOnTarget(13810, player)
end
function Shot(Unit, Event)
	Unit:CastSpellOnTarget(72268, player)
end

function Rifleman_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents() 
	Unit:Despawn(1, 0)
end

function Rifleman_OnDeath(Unit, Event)
	Unit:RemoveEvents() 
	Unit:Despawn(1, 0)
end

RegisterUnitEvent(38176, 1, "Rifleman_OnEnterCombat")
RegisterUnitEvent(38176, 3, "Rifleman_OnLeaveCombat")
RegisterUnitEvent(38176, 4, "Rifleman_OnDeath")