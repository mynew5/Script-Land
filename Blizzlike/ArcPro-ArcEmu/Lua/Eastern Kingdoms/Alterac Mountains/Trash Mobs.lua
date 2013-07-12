--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: LASP, DarkRavenMixage
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Argus Shadow Mage
function argusshadowmage_shadowbolt(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(20816, pUnit:GetClosestPlayer())
	end
end

function argusshadowmage_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("argusshadowmage_shadowbolt", math.random(4000,7000), 0)
end

function argusshadowmage_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2318, 1, "argusshadowmage_OnCombat")
RegisterUnitEvent(2318, 2, "argusshadowmage_OnLeaveCombat")

--Crushridge Enforcer
function crushridgeenforcerhead_crack(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(9791, pUnit:GetClosestPlayer())
	end
end

function crushridgeenforcer_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("crushridgeenforcerhead_crack", 20000, 0)
end

function crushridgeenforcer_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2256, 1, "crushridgeenforcer_OnCombat")
RegisterUnitEvent(2256, 2, "crushridgeenforcer_OnLeaveCombat")

--Crushridge Mage
function crushridgemage_frostbolt(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(9672, pUnit:GetClosestPlayer())
	end
end

function crushridgemage_bloodlust(pUnit, Event)
	pUnit:CastSpell(6742)
end

function crushridgemage_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("crushridgemage_frostbolt", 4000, 0)
	pUnit:RegisterEvent("crushridgemage_bloodlust", 16000, 1)
end

function crushridgemage_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2255, 1, "crushridgemage_OnCombat")
RegisterUnitEvent(2255, 2, "crushridgemage_OnLeaveCombat")

--Crushridge Mauler
function crushridgemauler_backhand(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(6253, pUnit:GetClosestPlayer())
	end
end

function crushridgemauler_strike(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(11976, pUnit:GetClosestPlayer())
	end
end

function crushridgemauler_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("crushridgemauler_backhand", 15000, 0)
	pUnit:RegisterEvent("crushridgemauler_strike", 8000, 6)
end

function crushridgemauler_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2254, 1, "crushridgemauler_OnCombat")
RegisterUnitEvent(2254, 2, "crushridgemauler_OnLeaveCombat")

--Crushridge Plunderer
function crushridgeplunderer_Cleave(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(15496, pUnit:GetClosestPlayer())
	end
end

function crushridgeplunderer_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("crushridgeplunderer_Cleave", math.random(7500,20000), 0)
end

function crushridgeplunderer_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2416, 1, "crushridgeplunderer_OnCombat")
RegisterUnitEvent(2416, 2, "crushridgeplunderer_OnLeaveCombat")

--Crushridge Warmonger
function crushridgewarmonger_enrage(pUnit, Event)
	pUnit:CastSpell(8269)
end

function crushridgewarmonger_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("crushridgewarmonger_enrage", 30000, 0)
end

function crushridgewarmonger_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2287, 1, "crushridgewarmonger_OnCombat")
RegisterUnitEvent(2287, 2, "crushridgewarmonger_OnLeaveCombat")

--Drunken Footpad
function drunkenfootpad_strike(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(13584, pUnit:GetClosestPlayer())
	end
end

function drunkenfootpad_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("drunkenfootpad_strike", 20000, 0)
end

function drunkenfootpad_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2440, 1, "drunkenfootpad_OnCombat")
RegisterUnitEvent(2440, 2, "drunkenfootpad_OnLeaveCombat")

--Giant Moss Creeper
function giantmosscreeper_poison(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(3396, pUnit:GetClosestPlayer())
	end
end

function giantmosscreeper_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("giantmosscreeper_poison", 20000, 0)
end

function giantmosscreeper_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2349, 1, "giantmosscreeper_OnCombat")
RegisterUnitEvent(2349, 2, "giantmosscreeper_OnLeaveCombat")

--Giant Yeti
function giantyetifrost_breath(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(3131, pUnit:GetClosestPlayer())
	end
end

function giantyeti_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("giantyetifrost_breath", 14000, 5)
end

function giantyeti_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2251, 1, "giantyeti_OnCombat")
RegisterUnitEvent(2251, 2, "giantyeti_OnLeaveCombat")

--Mountain Yeti
function mountainyetifrost_breath(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(3131, pUnit:GetClosestPlayer())
	end
end

function mountainyeti_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("mountainyetifrost_breath", 15000, 6)
end

function mountainyeti_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2250, 1, "mountainyeti_OnCombat")
RegisterUnitEvent(2250, 2, "mountainyeti_OnLeaveCombat")

--Muckrake
function muckrake_disarm(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(8379, pUnit:GetClosestPlayer())
	end
end

function muckrake_pummel(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(12555, pUnit:GetClosestPlayer())
	end
end

function muckrake_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("muckrake_disarm", 15000, 4)
	pUnit:RegisterEvent("muckrake_pummel", 30000, 0)
end

function muckrake_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2421, 1, "muckrake_OnCombat")
RegisterUnitEvent(2421, 2, "muckrake_OnLeaveCombat")

--NarillaSanz
function narillasanz_fb(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(9573, pUnit:GetClosestPlayer())
	end
end

function narillasanz_renew(pUnit, Event)
	pUnit:CastSpell(8362)
end

function narillasanz_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("narillasanz_fb", 15000, 0)
	pUnit:RegisterEvent("narillasanz_renew", 30000, 1)
end

function narillasanz_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2447, 1, "narillasanz_OnCombat")
RegisterUnitEvent(2447, 2, "narillasanz_OnLeaveCombat")

--Stone Fury
function stonefury_gt(pUnit, Event)
	pUnit:CastSpell(6524)
end

function stonefury_trample(pUnit, Event)
	pUnit:CastSpell(5568)
end

function stonefury_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("stonefury_gt", 20000, 1)
	pUnit:RegisterEvent("stonefury_trample", 30000, 0)
end

function stonefury_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2258, 1, "stonefury_OnCombat")
RegisterUnitEvent(2258, 2, "stonefury_OnLeaveCombat")

--Syndicate Assassin
function syndicateassassin_poison(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(744, pUnit:GetClosestPlayer())
	end
end

function syndicateassassin_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("syndicateassassin_poison", 20000, 0)
end

function syndicateassassin_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2246, 1, "syndicateassassin_OnCombat")
RegisterUnitEvent(2246, 2, "syndicateassassin_OnLeaveCombat")

--Syndicate Enforcer
function syndicateenforcer_whirlwind(pUnit, Event)
	pUnit:CastSpell(15576)
end

function syndicateenforcer_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("syndicateenforcer_whirlwind", 20000, 0)
end

function syndicateenforcer_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2247, 1, "syndicateenforcer_OnCombat")
RegisterUnitEvent(2247, 2, "syndicateenforcer_OnLeaveCombat")

--Syndicate Footpad
function syndicatefootpad_bs(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(7159, pUnit:GetClosestPlayer())
	end
end

function syndicatefootpad_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("syndicatefootpad_bs", 20000, 0)
end

function syndicatefootpad_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2240, 1, "syndicatefootpad_OnCombat")
RegisterUnitEvent(2240, 2, "syndicatefootpad_OnLeaveCombat")

--Syndicate Saboteur
function syndicatesaboteur_shot(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(6660, pUnit:GetClosestPlayer())
	end
end

function syndicatesaboteur_fshot(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(6980, pUnit:GetClosestPlayer())
	end
end

function syndicatesaboteur_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("syndicate_saboteur_shot", 10000, 0)
	pUnit:RegisterEvent("syndicate_saboteur_fshot", 20000, 0)
end

function syndicatesaboteur_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2245, 1, "syndicatesaboteur_OnCombat")
RegisterUnitEvent(2245, 2, "syndicatesaboteur_OnLeaveCombat")

--Syndicate Sentry
function syndicatesentry_sb(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(11972, pUnit:GetClosestPlayer())
	end
end

function syndicatesentry_sw(pUnit, Event)
	pUnit:CastSpell(15062)
end

function syndicatesentry_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("syndicatesentry_sb", 15000, 0)
	pUnit:RegisterEvent("syndicatesentry_sw", 20000, 1)
end

function syndicatesentry_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2243, 1, "syndicatesentry_OnCombat")
RegisterUnitEvent(2243, 2, "syndicatesentry_OnLeaveCombat")

--Syndicate Spy
function syndicatespy_bs(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(7159, pUnit:GetClosestPlayer())
	end
end

function syndicatespy_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("syndicatespy_bs", 20000, 0)
end

function syndicatespy_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2242, 1, "syndicatespy_OnCombat")
RegisterUnitEvent(2242, 2, "syndicatespy_OnLeaveCombat")

--Syndicate Thief
function syndicatethief_disarm(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(6713, pUnit:GetClosestPlayer())
	end
end

function syndicatethief_poison(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(744, pUnit:GetClosestPlayer())
	end
end

function syndicatethief_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("syndicatethief_poison", 30000, 1)
	pUnit:RegisterEvent("syndicatethief_disarm", 15000, 0)
end

function syndicatethief_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2241, 1, "syndicatethief_OnCombat")
RegisterUnitEvent(2241, 2, "syndicatethief_OnLeaveCombat")

-- Syndicate Wizard

function syndicatewizard_fireball(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(20815, pUnit:GetClosestPlayer())
	end
end

function syndicatewizard_frostarmor(pUnit, Event)
	pUnit:CastSpell(12544)
end

function syndicatewizard_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("syndicatewizard_fireball", 5000, 0)
	pUnit:RegisterEvent("syndicatewizard_frostarmor", 2000, 1)
end

function syndicatewizard_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2319, 1, "syndicatewizard_OnCombat")
RegisterUnitEvent(2319, 2, "syndicatewizard_OnLeaveCombat")