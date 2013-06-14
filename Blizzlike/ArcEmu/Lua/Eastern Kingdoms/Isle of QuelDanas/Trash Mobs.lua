--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Yerney; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Darkspine Myrmidon
function DSM_OnCombat(Unit, Event)
	Unit:RegisterEvent("DSM_Shout", 8000, 1)
	Unit:RegisterEvent("DSM_Sunder", 14000, 1)
end

function DSM_Shout(Unit, Event)
	Unit:FullCastSpell(13730)
end

function DSM_Sunder(Unit, Event)
	Unit:FullCastSpellOnTarget(11971, Unit:GetClosestPlayer())
end

function DSM_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function DSM_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25060, 1, "DSM_OnCombat")
RegisterUnitEvent(25060, 2, "DSM_LeaveCombat")
RegisterUnitEvent(25060, 4, "DSM_Dead")

--Darkspine Siren
function DSS_OnCombat(Unit, Event)
	Unit:CastSpell(12544)
	Unit:RegisterEvent("DSS_Scr", 12000, 1)
	Unit:RegisterEvent("DSS_FrNo", 24000, 1)
	Unit:RegisterEvent("DSS_FrB", 7000, 0)
end

function DSS_Scr(Unit, Event)
	Unit:FullCastSpell(3589)
end

function DSS_FrNo(Unit, Event)
	Unit:FullCastSpell(38033)
end

function DSS_FrB(Unit, Event)
	Unit:FullCastSpellOnTarget(9672, Unit:GetClosestPlayer())
end

function DSS_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function DSS_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25073, 1, "DSS_OnCombat")
RegisterUnitEvent(25073, 2, "DSS_LeaveCombat")
RegisterUnitEvent(25073, 4, "DSS_Dead")

--DawnBlade Blood Knight
function DBBK_OnCombat(Unit, Event)
	Unit:FullCastSpellOnTarget(45105, Unit:GetClosestPlayer())
	Unit:RegisterEvent("DBBK_Heal", 26000, 1)
	Unit:RegisterEvent("DBBK_SoW", 8000, 4)
	Unit:RegisterEvent("DBBK_JoW", 13000, 4)
end

function DBBK_Heal(Unit, Event)
	Unit:CastSpell(13952)
end

function DBBK_SoW(Unit, Event)
	Unit:CastSpellOnTarget(45095, Unit:GetClosestPlayer())
end

function DBBK_JoW(Unit, Event)
	Unit:CastSpellOnTarget(45337, Unit:GetClosestPlayer())
end

function DBBK_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function DBBK_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(24976, 1, "DBBK_OnCombat")
RegisterUnitEvent(24976, 2, "DBBK_LeaveCombat")
RegisterUnitEvent(24976, 4, "DBBK_Dead")
--[[
--DawnBlade MarksMan
function DBM_OnCombat(Unit, Event)
	Unit:RegisterEvent("DBM_Shoot", 4000, 0)
	Unit:RegisterEvent("DBM_Flame", 8000, 0)
	Unit:RegisterEvent("DBM_Immo", 16000, 0)
end

function DBM_Shoot(Unit, Event)
	Unit:FullCastSpellOnTarget(6660, Unit:GetClosestPlayer())
end

function DBM_Flame(Unit, Event)
	Unit:CastSpellOnTarget(45101, Unit:GetClosestPlayer())
end

function DBM_Immo(Unit, Event)
	Unit:CastSpellOnTarget(37847, Unit:GetClosestPlayer())
end

function DBM_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function DBM_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(24979, 1, "DBM_OnCombat")
RegisterUnitEvent(24979, 2, "DBM_LeaveCombat")
RegisterUnitEvent(24979, 4, "DBM_Dead")
--]]
--DawnBlade Reservist
function DBR_OnCombat(Unit, Event)
	Unit:RegisterEvent("DBR_Strike", 9000, 0)
end

function DBR_Strike(Unit, Event)
	Unit:CastSpellOnTarget(32915, Unit:GetClosestPlayer())
end

function DBR_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function DBR_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25087, 1, "DBR_OnCombat")
RegisterUnitEvent(25087, 2, "DBR_LeaveCombat")
RegisterUnitEvent(25087, 4, "DBR_Dead")

--DawnBlade Summoner
function DBS_OnCombat(Unit, Event)
	Unit:CastSpell(44977)
	Unit:RegisterEvent("DBS_Flame",18000, 0)
	Unit:RegisterEvent("DBS_Immo", 16000, 0)
end

function DBS_Flame(Unit, Event)
	Unit:FullCastSpellOnTarget(32707, Unit:GetClosestPlayer())
end

function DBS_Immo(Unit, Event)
	Unit:FullCastSpellOnTarget(11962, Unit:GetClosestPlayer())
end

function DBS_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function DBS_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(24978, 1, "DBS_OnCombat")
RegisterUnitEvent(24978, 2, "DBS_LeaveCombat")
RegisterUnitEvent(24978, 4, "DBS_Dead")

--Emissary of Hate
function EoH_OnCombat(Unit, Event)
	Unit:RegisterEvent("EoH_Rend", 12000, 0)
end

function EoH_Rend(Unit, Event)
	Unit:FullCastSpellOnTarget(12054, Unit:GetClosestPlayer())
end

function EoH_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function EoH_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25003, 1, "EoH_OnCombat")
RegisterUnitEvent(25003, 2, "EoH_LeaveCombat")
RegisterUnitEvent(25003, 4, "EoH_Dead")

--unleashed Hellion
function UH_OnCombat(Unit, Event)
	Unit:RegisterEvent("UH_Strike", 12000, 0)
end

function UH_Strike(Unit, Event)
	Unit:CastSpell(11876)
end

function UH_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function UH_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25002, 1, "UH_OnCombat")
RegisterUnitEvent(25002, 2, "UH_LeaveCombat")
RegisterUnitEvent(25002, 4, "UH_Dead")

--Wretched Devourer
function WD_OnCombat(Unit, Event)
	Unit:RegisterEvent("WD_Nether", 12000, 0)
end

function WD_Nether(Unit, Event)
	Unit:FullCastSpellOnTarget(35334, Unit:GetClosestPlayer())
end

function WD_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WD_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(24960, 1, "WD_OnCombat")
RegisterUnitEvent(24960, 2, "WD_LeaveCombat")
RegisterUnitEvent(24960, 4, "WD_Dead")

--Wretched Fiend
function WF_OnCombat(Unit, Event)
	Unit:RegisterEvent("WF_Sunder", 14000, 1)
end

function WF_Sunder(Unit, Event)
	Unit:FullCastSpellOnTarget(11971, Unit:GetClosestPlayer())
end

function WF_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WF_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(24966, 1, "WF_OnCombat")
RegisterUnitEvent(24966, 2, "WF_LeaveCombat")
RegisterUnitEvent(24966, 4, "WF_Dead")

--Erractic Sentry
function SelfRepair(Unit, Event)
    Unit:CastSpell(44994)
end

function SetHP(Unit, Event)
    Unit:SetHealthPct(80)
	Unit:RegisterEvent("RepairEffect", 1200, 1)
end

function RepairEffect(Unit, Event)
	Unit:CastSpell(45000)
	if(Unit:GetHealthPct() < 100) then
		Unit:RegisterEvent("SelfRepair", 1200, 1)
	end
end

function ErraticSentryCapacitorOverload(Unit, Event)
	Unit:RegisterEvent("SetHP", math.random(16000,36000), 0)
end

function ErraticSentryCapacitorOverload_OnEnterCombat(Unit, Event)
	Unit:RemoveEvents()	
end

function ErraticSentryCapacitorOverload_OnLeaveCombat(Unit, Event)
	Unit:RegisterEvent("SetHP", math.random(16000,36000), 0)	
end

RegisterUnitEvent(24972, 6, "ErraticSentryCapacitorOverload")
RegisterUnitEvent(24972, 1, "ErraticSentryCapacitorOverload_OnEnterCombat")
RegisterUnitEvent(24972, 2, "ErraticSentryCapacitorOverload_OnLeaveCombat")