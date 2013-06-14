--[[
Ragefire Chasm script (Trash Mobs)

Scripted by: Mathix of ac-web.org
Progress: 99%
]]

--[[ Bloodfiller Orb
when you click this orb a npc will spawn (need gobject ID to complete this)]]

-- Earthborer
function EarthborerOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(EarthborerSpell1, 15000, 0)
end

function EarthBorerSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(18070, Unit:GetMainTank())
end

RegisterUnitEvent(11320, 1, "EarthborerOnCombat")

-- Molten Elemental
function MoltenElementalOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(MoltenElementalSpell1, 40000, 0)
end

function MoltenElementalSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(134, Unit)
end

RegisterUnitEvent(11321, 1, "MoltenElementalOnCombat")

-- Blade Cultist
function BladeCultistOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(BladCultistSpell1, 30000, 0)
end

function BladeCultistSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(18266, Unit:GetMainTank())
end

RegisterUnitEvent(11322, 1, "BladeCultistOnCombat")

-- Searing Blade Enforcerer
function SearingBladeEnforcererOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(SearingBladeEnforcererSpell1, 15000, 0)
end

function SearingBladeEnforcererSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(8242, Unit:GetMainTank())
end

RegisterUnitEvent(11323, 1, "SearingBladeEnforcererOnCombat")

-- Searing Blade Warlock
function SearingBladeWarlockOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(SearingBladeWarlockSpell1, 20000, 0)
	Unit:RegisterEvent(SearingBladeWarlockSpell2, 1000, 1)
end

function SearingBladeWarlockSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(20791, Unit:GetMainTank())
end

function SearingBladeWarlockSpell2(Unit, Event, Attacker)
	if(SearingBladeWarlockPet == 0) then
		Unit:CreateGuardian(8996, 120000, 0, 14)
		local SearingBladeWarlockPet = 1
	end
end

function SearingBladeWarlockPetOnDied(Unit, Event, lasttarget)
	local SearingBladeWarlockPet = 0
end

RegisterUnitEvent(11324, 1, "SearingBladeWarlockOnCombat")
RegisterUnitEvent(8996, 4, "SearingBladeWarlockPetOnDied")

-- Ragefire Trogg

function RagefireTroggOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(RagefireTroggSpell1, 40000, 0)
end

function RagefireTroggSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank())
end

RegisterUnitEvent(11318, 1, "RagefireTroggOnCombat")

-- Ragefire Shaman
function RagefireShamanOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(RagefireShamanSpell1, 15, 0)
	Unit:RegisterEvent(RagefireShamanSpell2, 20, 0)
end

function RagefireShamanSpell1(Unit, Event, Attacker)
	local RagefireShamanFriend = Unit:GetRandomFriend()
	if(RagefireShamanFriend:GetHealthPct() <= 75) then
		Unit:FullCastSpellOnTarget(11986, RagefireShamanFriend)
	else 
		local RagefireShamanFriend = Unit:GetRandomFriend()
	end
end

function RagefireShamanSpell2(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank())
end

RegisterUnitEvent(11319, 1, "RagefireShamanOnCombat")