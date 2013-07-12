--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, Ascendscripting
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Geomancer Flintdagger
function GeomancerFlintdagger_OnSpawn(Unit,Event)
	Unit:CastSpell(2601)
end

function GeomancerFlintdagger_OnEnterCombat(Unit,Event)
local totem = Unit:GetCreatureNearestCoords(Unit:GetX(), Unit:GetY(), Unit:GetZ(), 6111)
local plr =	Unit:GetMainTank()
	Unit:RegisterEvent("FireNovaTotem", 15000, 1)
	Unit:RegisterEvent("Fireball", 3000, 1)
end

function FireNovaTotem(Unit,Event)
	if(totem ~= nil) then
		return
	else
		Unit:CastSpell(8499)
	end
end

function Fireball(Unit,Event)
	Unit:FullCastSpellOnTarget(20823, plr)
end

function GeomancerFlintdagger_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function GeomancerFlintdagger_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2609, 18, "GeomancerFlintdagger_OnSpawn")
RegisterUnitEvent(2609, 1, "GeomancerFlintdagger_OnEnterCombat")
RegisterUnitEvent(2609, 2, "GeomancerFlintdagger_OnLeaveCombat")
RegisterUnitEvent(2609, 4, "GeomancerFlintdagger_OnDied")

--Giant Plains Creeper
function GiantPlainsCreeper_OnEnterCombat(Unit,Event)
local plr =	Unit:GetMainTank()
	Unit:RegisterEvent("EncasingWebs", 18000, 0)
	Unit:RegisterEvent("Poison", 5000, 1)
end

function EncasingWebs(Unit,Event)
	Unit:FullCastSpellOnTarget(4962, plr)
end

function Poison(Unit,Event)
	Unit:FullCastSpellOnTarget(744, plr)
end

function GiantPlainsCreeper_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function GiantPlainsCreeper_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2565, 1, "GiantPlainsCreeper_OnEnterCombat")
RegisterUnitEvent(2565, 2, "GiantPlainsCreeper_OnLeaveCombat")
RegisterUnitEvent(2565, 4, "GiantPlainsCreeper_OnDied")

--Highland Fleshstalker
function HighlandFleshstalker_OnEnterCombat(Unit,Event)
local plr =	Unit:GetMainTank()
	if(Unit:GetHealthPct() <= 29) then
		Unit:FullCastSpellOnTarget(3393, plr)
	end
end

RegisterUnitEvent(2561, 1, "HighlandFleshstalker_OnEnterCombat")

--Highland Thrasher
function HighlandThrasher_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Thrash", 7000, 0)
end

function Thrash(Unit, Event)
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank())
end

function HighlandThrasher_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function HighlandThrasher_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2560, 1, "HighlandThrasher_OnEnterCombat")
RegisterUnitEvent(2560, 2, "HighlandThrasher_OnLeaveCombat")
RegisterUnitEvent(2560, 4, "HighlandThrasher_OnDied")

--Mesa Buzzard
function MesaBuzzard_OnCombat(Unit,Event)
local choice = math.random(1,2)
	if(choice == 1) then 	
		Unit:FullCastSpellOnTarget(8139, Unit:GetMainTank())
	elseif(choice == 2) then
		return
	end
end

RegisterUnitEvent(2579, 1, "MesaBuzzard_OnCombat")

--Plains Creeper
function PlainsCreeper_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("EncasingWebs", 18000, 0)
	Unit:RegisterEvent("Poison", 5000, 1)
end

function EncasingWebs(Unit, Event)
	Unit:FullCastSpellOnTarget(4962, Unit:GetMainTank())
end

function Poison(Unit, Event)
	Unit:FullCastSpellOnTarget(744, Unit:GetMainTank())
end

function PlainsCreeper_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function PlainsCreeper_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2563, 1, "PlainsCreeper_OnEnterCombat")
RegisterUnitEvent(2563, 2, "PlainsCreeper_OnLeaveCombat")
RegisterUnitEvent(2563, 4, "PlainsCreeper_OnDied")

--Rumbling Exile
function RumblingExile_OnEnterCombat(Unit, Event)
	Unit:FullCastSpellOnTarget(6524, Unit:GetMainTank())
end

RegisterUnitEvent(2592, 1, "RumblingExile_OnEnterCombat")

--Syndicate Conjuror
function SyndicateConjuror_OnSpawn(Unit, Event)
	Unit:FullCastSpell(43896)
	Unit:FullCastSpell(25085)
end

function SyndicateConjuror_OnEnterCombat(Unit, Event)
local VoidWalker = Unit:GetCreatureNearestCoords(Unit:GetX(), Unit:GetY(), Unit:GetZ(), 24476)
	VoidWalker:MoveTo(plr:GetX(), plr:GetY(), plr:GetZ())
	Unit:RegsiterEvent("ShadowBolt", 4000, 0)
	Unit:RegsiterEvent("Sleep", 23000, 0)
end

function ShadowBolt(Unit,Event)
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank())
end

function Sleep(Unit,Event)
	Unit:FullCastSpellOnTarget(15970, Unit:GetMainTank())
end

function SyndicateConjuror_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function SyndicateConjuror_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2590, 18, "SyndicateConjuror_OnSpawn")
RegisterUnitEvent(2590, 1, "SyndicateConjuror_OnEnterCombat")
RegisterUnitEvent(2590, 2, "SyndicateConjuror_OnLeaveCombat")
RegisterUnitEvent(2590, 4, "SyndicateConjuror_OnDied")

--Syndicate Highwayman
function SyndicateHighwayman_OnSpawn(Unit,Event)
	Unit:CastSpell(1784)
end

function SyndicateHighwayman_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Backstab", 8000, 0)
end

function Backstab(Unit,Event)
	Unit:FullCastSpellOnTarget(37685, Unit:GetMainTank())
end

function SyndicateHighwayman_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function SyndicateHighwayman_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2586, 18, "SyndicateHighwayman_OnSpawn")
RegisterUnitEvent(2586, 1, "SyndicateHighwayman_OnEnterCombat")
RegisterUnitEvent(2586, 2, "SyndicateHighwayman_OnLeaveCombat")
RegisterUnitEvent(2586, 4, "SyndicateHighwayman_OnDied")

--Syndicate Magus
function SyndicateMagus_OnSpawn(Unit, Event)
	Unit:CastSpell(12544)
end

function SyndicateMagus_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Frostbolt", 11000, 0)
end

function Frostbolt(Unit, Event)
	Unit:FullCastSpellOnTarget(9672, Unit:GetMainTank())
end

function SyndicateMagus_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function SyndicateMagus_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2591, 18, "SyndicateMagus_OnSpawn")
RegisterUnitEvent(2591, 1, "SyndicateMagus_OnEnterCombat")
RegisterUnitEvent(2591, 2, "SyndicateMagus_OnLeaveCombat")
RegisterUnitEvent(2591, 4, "SyndicateMagus_OnDied")

--Syndicate Pathstalker
function SyndicatePathstalker_OnEnterCombat(Unit, Event)
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank())
end

RegisterUnitEvent(2587, 1, "SyndicatePathstalker_OnEnterCombat")

--Syndicate Prowler
function SyndicateProwler_OnSpawn(Unit, Event)
	Unit:CastSpell(1784)
end

function SyndicateProwler_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Disarm", 13000, 1)
	Unit:RegisterEvent("SinisterStrike", 6000, 1)
end

function Disarm(Unit, Event)
	Unit:FullCastSpellOnTarget(6713, plr)
end

function SinisterStrike(Unit, Event)
	Unit:FullCastSpellOnTarget(14873, plr)
end

function SyndicateProwler_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function SyndicateProwler_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2588, 18, "SyndicateProwler_OnSpawn")
RegisterUnitEvent(2588, 1, "SyndicateProwler_OnEnterCombat")
RegisterUnitEvent(2588, 2, "SyndicateProwler_OnLeaveCombat")
RegisterUnitEvent(2588, 4, "SyndicateProwler_OnDied")

--Syndicate Thief
function SyndicateThief_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Backstab", 1000, 1)
	Unit:RegisterEvent("Disarm", 13000, 1)
	Unit:RegisterEvent("Poison", 20000, 1)
end

function Backstab(Unit, Event)
	Unit:FullCastSpellOnTarget(7159, Unit:GetMainTank())
end

function Disarm(Unit, Event)
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank())
end

function Poison(Unit, Event)
	Unit:FullCastSpellOnTarget(744, Unit:GetMainTank())
end

function SyndicateThief_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function SyndicateThief_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2241, 1, "SyndicateThief_OnEnterCombat")
RegisterUnitEvent(2241, 2, "SyndicateThief_OnLeaveCombat")
RegisterUnitEvent(2241, 4, "SyndicateThief_OnDied")

--Thundering Exile
function ThunderingExile_OnEnterCombat(Unit, Event)
	Unit:RegsiterEvent("LightningBolt", 4000, 0)
	Unit:RegsiterEvent("Shock", 22000, 0)
end

function LightningBolt(Unit, Event)
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank())
end

function Shock(Unit, Event)
	Unit:FullCastSPellOnTarget(11824, Unit:GetMainTank())
end

function ThunderingExile_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function ThunderingExile_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2762, 1, "ThunderingExile_OnEnterCombat")
RegisterUnitEvent(2762, 2, "ThunderingExile_OnLeaveCombat")
RegisterUnitEvent(2762, 4, "ThunderingExile_OnDied")

--Vengeful Surge
function VengefulSurge_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("FrostNova", 14000, 1)
end

function FrostNova(Unit, Event)
	Unit:FullCastSpellOnTarget(14907, Unit:GetMainTank())
end

function VengefulSurge_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function VengefulSurge_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2776, 1, "VengefulSurge_OnEnterCombat")
RegisterUnitEvent(2776, 2, "VengefulSurge_OnLeaveCombat")
RegisterUnitEvent(2776, 4, "VengefulSurge_OnDied")

--Witherbark Axe Thrower
function WitherbarkAxeThrower_OnEnterCombat(Unit,Event)
local choice = math.random(1,2)
	if(choice == 1) then
		Unit:FullCastSpellOnTarget(4974, Unit:GetMainTank())
		Unit:FullCastSpellOnTarget(10277, Unit:GetMainTank())
	elseif(choice == 2) then
		Unit:FullCastSpellOnTarget(10277, Unit:GetMainTank())
	end
end

RegisterUnitEvent(2554, 1, "WitherbarkAxeThrower_OnEnterCombat")

--Witherbark Berserker
function WitherbarkBerserker_OnEnterCombat(Unit,Event)
local choice = math.random(1,2)
	if(choice == 1) then
		Unit:FullCastSpellOnTarget(4974, Unit:GetMainTank())
		Unit:RegisterEvent("Frenzy", 1000, 1)
	elseif(choice == 2) then
		Unit:RegisterEvent("Frenzy", 1000, 1)
	end
end

function Frenzy(Unit,Event)
	if(Unit:GetHealthPct() <= 290) then
		Unit:CastSpell(3019)
	end
end

function WitherbarkBerserker_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function WitherbarkBerserker_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2558, 1, "WitherbarkBerserker_OnEnterCombat")
RegisterUnitEvent(2558, 2, "WitherbarkBerserker_OnEnterCombat")
RegisterUnitEvent(2558, 4, "WitherbarkBerserker_OnDied")

--Witherbark Headhunter
function WitherbarkHeadhunter_OnEnterCombat(Unit,Event)
local choice = math.random(1,2)
	if (choice == 1) then
		Unit:FullCastSpellOnTarget(4974, Unit:GetMainTank())
		Unit:RegisterEvent("Execute", 1000, 1)
		Unit:RegisterEvent("Net", 8000, 0)
	elseif (choice == 2) then
		Unit:RegisterEvent("Execute", 1000, 1)
		Unit:RegisterEvent("Net", 8000, 0)
	end
end

function Execute(Unit,Event)
	if(Unit:GetMainTank():GetHealthPct() == 20) then
		Unit:FullCastSpellOnTarget(7160, Unit:GetMainTank())
	end
end

function Net(Unit,Event)
	Unit:FullCastSpellOnTarget(6533, Unit:GetMainTank())
end

function WitherbarkHeadhunter_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function WitherbarkHeadhunter_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2605, 1, "WitherbarkHeadhunter_OnEnterCombat")
RegisterUnitEvent(2605, 2, "WitherbarkHeadhunter_OnLeaveCombat")
RegisterUnitEvent(2605, 4, "WitherbarkHeadhunter_OnDied")

--Witherbark Shadow Hunter
function WitherbarkShadowHunter_OnEnterCombat(Unit,Event)
local choice = math.random(1,2)
	if(choice == 1) then
		Unit:FullCastSpellOnTarget(7646, Unit:GetMainTank())
		Unit:RegisterEvent("Pain", 1000, 1)
		Unit:RegisterEvent("Silence", 15000, 4)
	elseif(choice == 2) then
		Unit:RegisterEvent("Pain", 1000, 1)
		Unit:RegisterEvent("Silence", 15000, 4)
	end
end

function Pain(Unit,Event)
	if(Unit:GetHealthPct() <= 29) then
		Unit:FullCastSpellOnTarget(992, Unit:GetMainTank())
	end
end

function Silence(Unit,Event)
	Unit:FullCastSpellOnTarget(6726, Unit:GetMainTank())
end

function WitherbarkShadowHunter_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function WitherbarkShadowHunter_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2557, 1, "WitherbarkShadowHunter_OnEnterCombat")
RegisterUnitEvent(2557, 2, "WitherbarkShadowHunter_OnLeaveCombat")
RegisterUnitEvent(2557, 4, "WitherbarkShadowHunter_OnDied")

--Witherbark Shadowcaster
function WitherbarkShadowcaster_OnSpawn(Unit,Event)
	Unit:CastSpell(11939)
end

function WitherbarkShadowcaster_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Shadowbolt", 7000, 0)
end

function ShadowBolt(Unit,Event)
	if(Unit:GetMainTank() ~= nil) then
		return
	else
		Unit:FullCastSpellOnTarget(20816, Unit:GetMainTank())
	end
end

function WitherbarkShadowcaster_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function WitherbarkShadowcaster_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2553, 18, "WitherbarkShadowcaster_OnSpawn")
RegisterUnitEvent(2553, 1, "WitherbarkShadowcaster_OnEnterCombat")
RegisterUnitEvent(2553, 2, "WitherbarkShadowcaster_OnLeaveCombat")
RegisterUnitEvent(2553, 4, "WitherbarkShadowcaster_OnDied")

--Witherbark Troll
function WitherbarkTroll_OnEnterCombat(Unit, Event)
local choice = math.random(1,2)
	if(choice == 1) then
		Unit:FullCastSpellOnTarget(4974, Unit:GetMainTank())
	elseif(choice == 2) then
		return
	end
end

RegisterUnitEvent(4974, 1, "WitherbarkTroll_OnEnterCombat")

--Witherbark Witch Doctor
function WitherbarkWitchDoctor_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("HealingWard", 1000, 1)
	Unit:RegisterEvent("MagmaTotem", 8000, 0)
end

function HealingWard(Unit, Event)
	if(Unit:GetHealthPct() <= 29) then
		Unit:CastSpell(5605)
	end
end

function MagmaTotem(Unit, Event)
local X,Y,Z = Unit:GetX(),Unit:GetY(),Unit:GetZ()
local Totem = Unit:GetCreatureNearestCoords(X,Y,Z,8190)
	if(Totem ~= nil) then
		Unit:CastSpell(8190)
	else
		return
	end
end

function WitherbarkWitchDoctor_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WitherbarkWitchDoctor_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2605, 1, "WitherbarkWitchDoctor_OnEnterCombat")
RegisterUnitEvent(2605, 2, "WitherbarkWitchDoctor_OnLeaveCombat")
RegisterUnitEvent(2605, 4, "WitherbarkWitchDoctor_OnDied")