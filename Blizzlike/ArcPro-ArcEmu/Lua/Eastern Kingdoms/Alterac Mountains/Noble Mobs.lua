--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Ascendscripting, ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Baron Vardus
function Vardus_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("frostbolt", math.random(4000,7000), 0)
end

function frostbolt(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(20822, pUnit:GetClosestPlayer())
	end
end

function Vardus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Vardus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2306, 1, "Vardus_OnCombat")
RegisterUnitEvent(2306, 2, "Vardus_OnLeaveCombat")
RegisterUnitEvent(2306, 4, "Vardus_OnDied")

--Archmage Absuren Runeweaver
function Runeweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("Runeweaver_AoE", 6000, 0)
end

function Runeweaver_AoE(pUnit, Event) 
	pUnit:CastSpell(3659) 
end

function Runeweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Runeweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2543, 1, "Runeweaver_OnCombat")
RegisterUnitEvent(2543, 2, "Runeweaver_OnLeaveCombat")
RegisterUnitEvent(2543, 4, "Runeweaver_OnDied")

--Bath'rah the Windwatcher
function Windwatcher_OnCombat(Unit, Event)
	Unit:RegisterEvent("Windwatcher_Cyclone", 15000, 0)
	Unit:RegisterEvent("Windwatcher_Totem", 10000, 0)
end

function Windwatcher_Totem(pUnit, Event)
    pUnit:CastSpell(25000)
    pUnit:SpawnCreature(15363, pUnit:GetX()-1, pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 14, pUnit:GetO())
end

function Windwatcher_Cyclone(pUnit, Event) 
	pUnit:CastSpell(8606) 
end

function Windwatcher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Windwatcher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6176, 1, "Windwatcher_OnCombat")
RegisterUnitEvent(6176, 2, "Windwatcher_OnLeaveCombat")
RegisterUnitEvent(6176, 4, "Windwatcher_OnDied")

--Borhuin
function borhuin_disarm(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(8379, pUnit:GetClosestPlayer())
	end
end

function borhuin_net(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(6533, pUnit:GetClosestPlayer())
	end
end

function borhuin_pummel(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(12555, pUnit:GetClosestPlayer())
	end
end

function borhuin_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("borhuin_disarm", 20000, 0)
	pUnit:RegisterEvent("borhuin_net", 38000, 0)
	pUnit:RegisterEvent("borhuin_pummel", 25000, 2)
end

function borhuin_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2431, 1, "borhuin_OnCombat")
RegisterUnitEvent(2431, 2, "borhuin_OnLeaveCombat")

--Cyclonian
function Cyclonian_gustofwind(pUnit, Event)
	pUnit:CastSpell(6982)
end

function Cyclonian_whirlwind(pUnit, Event)
	pUnit:CastSpell(15576)
end

function Cyclonianknock_away(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(18670, pUnit:GetClosestPlayer())
	end
end

function Cyclonian_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Cyclonian_gustofwind", 20000, 0)
	pUnit:RegisterEvent("Cyclonian_whirlwind", 30000, 0)
	pUnit:RegisterEvent("Cyclonianknock_away", 15000, 0)
end

function Cyclonian_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6239, 1, "Cyclonian_OnCombat")
RegisterUnitEvent(6239, 2, "Cyclonian_OnLeaveCombat")

--Glommus
function glommus_knockdown(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(11428, pUnit:GetClosestPlayer())
	end
end

function glommus_battle(pUnit, Event)
	pUnit:CastSpell(9128)
end

function glommus_demoralizing(pUnit, Event)
	pUnit:CastSpell(13730)
end

function glommus_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("glommus_battle", 2000, 1)
	pUnit:RegisterEvent("glommus_demoralizing", 3500, 1)
	pUnit:RegisterEvent("glommus_knockdown", 15000, 0)
end

function glommus_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2422, 1, "glommus_OnCombat")
RegisterUnitEvent(2422, 2, "glommus_OnLeaveCombat")

--Grelborg
function grelborg_rof(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(11990, pUnit:GetClosestPlayer())
	end
end

function grelborg_flameward(pUnit, Event)
	pUnit:CastSpell(4979)
end

function grelborg_bloodlust(pUnit, Event)
	pUnit:CastSpell(6742)
end

function grelborg_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("grelborg_rof", 25000, 0)
	pUnit:RegisterEvent("grelborg_flameward", 10000, 0)
	pUnit:RegisterEvent("grelborg_bloodlust", 20000, 1)
end

function grelborg_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2417, 1, "grelborg_OnCombat")
RegisterUnitEvent(2417, 2, "grelborg_OnLeaveCombat")

--Lo'Grosh
function logrosh_bloodlust(pUnit, Event)
	pUnit:CastSpell(6742)
end

function logrosh_fireshield(pUnit, Event)
	pUnit:CastSpell(2601)
end

function logrosh_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("logrosh_bloodlust", 30000, 0)
	pUnit:RegisterEvent("logrosh_fireshield", 2000, 1)
end

function logrosh_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2453, 1, "logrosh_OnCombat")
RegisterUnitEvent(2453, 2, "logrosh_OnLeaveCombat")

--Lord Alyden Perenolde
function perenolde_pws(pUnit, Event)
	pUnit:CastSpell(11974)
end

function perenolde_renew(pUnit, Event)
	pUnit:CastSpell(8362)
end

function perenolde_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("perenolde_pws", 2000, 1)
	pUnit:RegisterEvent("perenolde_renew", 20000, 1)
end

function perenolde_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2423, 1, "perenolde_OnCombat")
RegisterUnitEvent(2423, 2, "perenolde_OnLeaveCombat")

--Skhowl
function skhowl_demo(pUnit, Event)
	pUnit:CastSpell(15971)
end

function skhowl_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("skhowl_demo", 20000, 0)
end

function skhowl_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2452, 1, "skhowl_OnCombat")
RegisterUnitEvent(2452, 2, "skhowl_OnLeaveCombat")

--Targ
function targ_cleave(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(15496, pUnit:GetClosestPlayer())
	end
end

function targ_thunderclap(pUnit, Event)
	pUnit:CastSpell(8147)
end

function targ_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("targ_cleave", 25000, 0)
	pUnit:RegisterEvent("targ_thunderclap", 10000, 0)
end

function targ_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2420, 1, "targ_OnCombat")
RegisterUnitEvent(2420, 2, "targ_OnLeaveCombat")