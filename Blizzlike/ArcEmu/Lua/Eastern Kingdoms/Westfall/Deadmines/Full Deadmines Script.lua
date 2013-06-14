--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Undeadex_Callofgrave(Unit, Event)
	Unit:CastSpell(5137)
end

function Undeadex_OnCombat(Unit, Event)
	Unit:RegisterEvent("Undeadex_Callofgrave", 10000, 0)
end

RegisterUnitEvent(624, 0, "Undeadex_OnCombat")

function Undeaddyn_dynamite(Unit, Event)
	Unit:CastSpell(7395)
end

function Undeaddyn_OnCombat(Unit, Event)
	Unit:RegisterEvent("Undeadex_dynamite", 6500, 0)
end

RegisterUnitEvent(625, 0, "Undeaddyn_OnCombat")


function Undeadskel_strike(Unit, Event)
	Unit:CastSpell(11976)
end

function Undeaddyn_OnCombat(Unit, Event)
	Unit:RegisterEvent("Undeadskel_dynamite", 3000, 0)
end

RegisterUnitEvent(623, 0, "Undeadskel_OnCombat")

function woodcarver_strike(Unit, Event)
	Unit:CastSpell(40505)
end

function woodcarver_OnCombat(Unit, Event)
	Unit:RegisterEvent("Undeadskel_dynamite", 8000, 0)
	Unit:CastSpell(6466)
end

RegisterUnitEvent(641, 0, "woodcarver_OnCombat")

function engineer_spawn(Unit, Event)
	Unit:CastSpell(3605)
end

function engineer_OnCombat(Unit, Event)
	Unit:RegisterEvent("engineer_spawn", 20000, 0)
	Unit:CastSpell(6660)
end

RegisterUnitEvent(622, 0, "engineer_OnCombat")

function crafts_ore(Unit, Event)
	Unit:CastSpell(5159)
end

function crafts_OnCombat(Unit, Event)
	Unit:RegisterEvent("crafts_ore", 20000, 0)
	Unit:CastSpell(5159)
end

RegisterUnitEvent(1731, 0, "crafts_OnCombat")

function wizard_ice(Unit, Event)
	Unit:CastSpell(113)
end

function wizard_fire(Unit, Event)
	Unit:CastSpell(9053)
end

function wizard_OnCombat(Unit, Event)
	Unit:RegisterEvent("wizard_ice", 12000, 0)
	Unit:RegisterEvent("wizard_fire", 4000, 0)
	Unit:CastSpell(4979)
end

RegisterUnitEvent(4418, 0, "wizard_OnCombat")

function watchman_OnCombat(Unit, Event)
	Unit:CastSpell(6660)
end

RegisterUnitEvent(1725, 0, "watchman_OnCombat")

function task_peirce(Unit, Event)
	Unit:CastSpell(6685)
end

function task_OnCombat(Unit, Event)
	Unit:RegisterEvent("task_peirce", 8000, 0)
	Unit:CastSpell(6660)
end

RegisterUnitEvent(4417, 0, "task_OnCombat")

function strip_peirce(Unit, Event)
	Unit:CastSpell(6016)
end

function strip_OnCombat(Unit, Event)
	Unit:RegisterEvent("task_peirce", 8000, 0)
end

RegisterUnitEvent(4416, 0, "strip_OnCombat")
RegisterUnitEvent(598, 0, "strip_OnCombat")

function squal_blast(Unit, Event)
	Unit:CastSpell(6016)
end

function squal_freeze(Unit, Event)
	Unit:CastSpell(122)
end

function squal_OnCombat(Unit, Event)
	Unit:RegisterEvent("squal_blast", 8000, 0)
	Unit:RegisterEvent("squal_freeze", 12000, 0)
	Unit:CastSpell(12544)
end

RegisterUnitEvent(1732, 0, "squal_OnCombat")

function pirate_OnCombat(Unit, Event)
	Unit:CastSpell(5172)
end

RegisterUnitEvent(657, 0, "pirate_OnCombat")

function overseer_shout(Unit, Event)
	Unit:CastSpell(5115)
end

function overseer_OnCombat(Unit, Event)
	Unit:CastSpell(5115)
	Unit:RegisterEvent("overseer_shout", 14000, 0)
end

RegisterUnitEvent(634, 0, "overseer_OnCombat")

function blackguard_OnSpawn(Unit, Event)
	Unit:CastSpell(6408)
end

RegisterUnitEvent(636, 0, "blackguard_OnSpawn")

function mage_fire(Unit, Event)
	Unit:CastSpell(9053)
end

function mage_OnSpawn(Unit, Event)
	Unit:CastSpell(5110)
	Unit:RegisterEvent("mage_fire", 4000, 0)
end

RegisterUnitEvent(1726, 0, "mage_OnSpawn")

function hench_slam(Unit, Event)
	Unit:CastSpell(8242)
end

function hench_OnSpawn(Unit, Event)
	Unit:RegisterEvent("hench_slam", 8000, 0)
end

RegisterUnitEvent(594, 0, "hench_OnSpawn")

function evoke_strike(Unit, Event)
	Unit:CastSpell(11829)
end

function evoke_OnSpawn(Unit, Event)
	Unit:RegisterEvent("evoke_strike", 8500, 0)
	local spruch = math.random(1,2)
	if (spruch == 1) then
		Unit:CastSpell(12544)
	elseif (spruch == 2) then
		Unit:CastSpell(4979)
	end
end

RegisterUnitEvent(1729, 0, "evoke_OnSpawn")

function conjure_fire(Unit, Event)
	Unit:CastSpell(9053)
end

function conjure_OnSpawn(Unit, Event)
	Unit:RegisterEvent("evoke_strike", 3500, 0)
end

RegisterUnitEvent(619, 0, "conjure_OnSpawn")