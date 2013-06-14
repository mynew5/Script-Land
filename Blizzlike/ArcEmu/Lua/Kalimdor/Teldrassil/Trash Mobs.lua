--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Ancient Protector
function AncientProtector_OnCombat(Unit, Event)
	Unit:RegisterEvent("AncientProtector_EntanglingRoots", 10000, 0)
	Unit:RegisterEvent("AncientProtector_WarStomp", 6000, 0)
end

function AncientProtector_EntanglingRoots(Unit, Event) 
	Unit:FullCastSpellOnTarget(11922, Unit:GetRandomPlayer(0)) 
end

function AncientProtector_WarStomp(Unit, Event) 
	Unit:CastSpell(45) 
end

function AncientProtector_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AncientProtector_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2041, 1, "AncientProtector_OnCombat")
RegisterUnitEvent(2041, 2, "AncientProtector_OnLeaveCombat")
RegisterUnitEvent(2041, 4, "AncientProtector_OnDied")

--Bloodfeather Fury
function BloodfeatherFury_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodfeatherFury_Savagery", 8000, 0)
end

function BloodfeatherFury_Savagery(Unit, Event) 
	Unit:CastSpell(5515) 
end

function BloodfeatherFury_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodfeatherFury_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2019, 1, "BloodfeatherFury_OnCombat")
RegisterUnitEvent(2019, 2, "BloodfeatherFury_OnLeaveCombat")
RegisterUnitEvent(2019, 4, "BloodfeatherFury_OnDied")

--Bloodfeather Harpy
function BFH_OnCombat(Unit, Event)
	Unit:RegisterEvent("BFH_BLeech", 10000, 0)
end

function BFH_BLeech(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(6958, Unit:GetClosestPlayer())
	end
end

function BFH_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function BFH_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2015, 1, "BFH_OnCombat")
RegisterUnitEvent(2015, 2, "BFH_OnLeaveCombat")
RegisterUnitEvent(2015, 4, "BFH_OnDied")

--Bloodfeather Matriarch
function BFM_OnCombat(Unit, Event)
	Unit:RegisterEvent("BFM_LBot", 3000, 0)
	Unit:RegisterEvent("BFM_HWave", 18000, 1)
end

function BFM_LBot(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(9532, Unit:GetClosestPlayer())
	end
end

function BFM_HWave(Unit, Event)
	Unit:CastSpell(332)
end

function BFM_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function BFM_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2021, 1, "BFM_OnCombat")
RegisterUnitEvent(2021, 2, "BFM_OnLeaveCombat")
RegisterUnitEvent(2021, 4, "BFM_OnDied")

--Bloodfeather Sorceress
function BFS_OnCombat(Unit, Event)
	Unit:RegisterEvent("BFS_FBall", 3000, 0)
	Unit:RegisterEvent("BFS_FArmorThree", 10000, 1)
end

function BFS_FBall(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(20793, Unit:GetClosestPlayer())
	end
end

function BFS_FArmorThree(Unit, Event)
	Unit:CastSpell(12544)
end

function BFS_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function BFS_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2018, 1, "BFS_OnCombat")
RegisterUnitEvent(2018, 2, "BFS_OnLeaveCombat")
RegisterUnitEvent(2018, 4, "BFS_OnDied")

--Bloodfeather Wind Witch
function BloodfeatherWindWitch_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodfeatherWindWitch_GustofWind", 8000, 0)
end

function BloodfeatherWindWitch_GustofWind(Unit, Event) 
	Unit:FullCastSpellOnTarget(6982, Unit:GetMainTank()) 
end

function BloodfeatherWindWitch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodfeatherWindWitch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2020, 1, "BloodfeatherWindWitch_OnCombat")
RegisterUnitEvent(2020, 2, "BloodfeatherWindWitch_OnLeaveCombat")
RegisterUnitEvent(2020, 4, "BloodfeatherWindWitch_OnDied")

--Dark Sprite
function DPE_OnCombat(Unit, Event)
	Unit:RegisterEvent("DPE_DarV", 15000, 1)
end

function DPE_DarV(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(5514, Unit:GetClosestPlayer())
	end
end

function DPE_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function DPE_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2004, 1, "DPE_OnCombat")
RegisterUnitEvent(2004, 2, "DPE_OnLeaveCombat")
RegisterUnitEvent(2004, 4, "DPE_OnDied")

--Duskstalker
function Duskstalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("Duskstalker_TendonRip", 8000, 0)
end

function Duskstalker_TendonRip(Unit, Event) 
	Unit:FullCastSpellOnTarget(3604, Unit:GetMainTank()) 
end

function Duskstalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Duskstalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14430, 1, "Duskstalker_OnCombat")
RegisterUnitEvent(14430, 2, "Duskstalker_OnLeaveCombat")
RegisterUnitEvent(14430, 4, "Duskstalker_OnDied")

--Elder Timberling
function ElderTimberling_OnCombat(Unit, Event)
	Unit:RegisterEvent("ElderTimberling_HealingWave", 12000, 0)
	Unit:RegisterEvent("ElderTimberling_LightningShield", 4000, 0)
end

function ElderTimberling_HealingWave(Unit, Event) 
	Unit:CastSpell(332) 
end

function ElderTimberling_LightningShield(Unit, Event) 
	Unit:CastSpell(324) 
end

function ElderTimberling_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ElderTimberling_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2030, 1, "ElderTimberling_OnCombat")
RegisterUnitEvent(2030, 2, "ElderTimberling_OnLeaveCombat")
RegisterUnitEvent(2030, 4, "ElderTimberling_OnDied")

--Feral Nightsaber
function FNS_OnCombat(Unit, Event)
	Unit:RegisterEvent("FNS_Spellname", 9000, 0)
end

function FNS_Event(Unit, Event)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(12166, Unit:GetRandomPlayer(0))
	end
end

function FNS_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function FNS_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2034, 1, "FNS_OnCombat")
RegisterUnitEvent(2034, 2, "FNS_OnLeaveCombat")
RegisterUnitEvent(2034, 4, "FNS_OnDied")

--Fury Shelda
function FuryShelda_OnCombat(Unit, Event)
	Unit:RegisterEvent("FuryShelda_DeafeningScreech", 10000, 0)
end

function FuryShelda_DeafeningScreech(Unit, Event) 
	Unit:CastSpell(3589) 
end

function FuryShelda_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FuryShelda_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14431, 1, "FuryShelda_OnCombat")
RegisterUnitEvent(14431, 2, "FuryShelda_OnLeaveCombat")
RegisterUnitEvent(14431, 4, "FuryShelda_OnDied")

--Gnarlpine Augur
function GnarlpineAugur_OnCombat(Unit, Event)
	Unit:RegisterEvent("GnarlpineAugur_GnarlpineVengance", 8000, 0)
end

function GnarlpineAugur_GnarlpineVengance(Unit, Event) 
	Unit:CastSpell(5628) 
end

function GnarlpineAugur_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GnarlpineAugur_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2011, 1, "GnarlpineAugur_OnCombat")
RegisterUnitEvent(2011, 2, "GnarlpineAugur_OnLeaveCombat")
RegisterUnitEvent(2011, 4, "GnarlpineAugur_OnDied")

--Gnarlpine Avenger
function GnarlpineAvenger_OnCombat(Unit, Event)
	Unit:RegisterEvent("GnarlpineAvenger_GnarlpineVengance", 8000, 0)
end

function GnarlpineAvenger_GnarlpineVengance(Unit, Event) 
	Unit:CastSpell(5628) 
end

function GnarlpineAvenger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GnarlpineAvenger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2011, 1, "GnarlpineAvenger_OnCombat")
RegisterUnitEvent(2011, 2, "GnarlpineAvenger_OnLeaveCombat")
RegisterUnitEvent(2011, 4, "GnarlpineAvenger_OnDied")

--Gnarlpine Mystic
function GMT_OnCombat(Unit, Event)
	Unit:RegisterEvent("GMT_Wrathone", 5000, 0)
end

function GMT_Wrathone(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(9739, Unit:GetClosestPlayer())
	end
end

function GMT_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function GMT_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(7235, 1, "GMT_OnCombat")
RegisterUnitEvent(7235, 2, "GMT_OnLeaveCombat")
RegisterUnitEvent(7235, 4, "GMT_OnDied")

--Gnarlpine Pathfinder
function GP_OnCombat(Unit, Event)
	Unit:RegisterEvent("GP_Wrathtwo", 5000, 0)
	Unit:RegisterEvent("GP_GVVV", 15000, 0)
end

function GP_Wrathtwo(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(9739, Unit:GetClosestPlayer())
	end
end

function GP_GVVV(Unit, Event)
	Unit:CastSpell(5628)
end

function GP_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function GP_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2012, 1, "GP_OnCombat")
RegisterUnitEvent(2012, 2, "GP_OnLeaveCombat")
RegisterUnitEvent(2012, 4, "GP_OnDied")

--Gnarlpine Totemic
function GnarlpineTotemic_OnCombat(Unit, Event)
	Unit:RegisterEvent("GnarlpineTotemic_GnarlpineVengeance", 10000, 0)
	Unit:RegisterEvent("GnarlpineTotemic_HealingWard", 12000, 0)
end

function GnarlpineTotemic_GnarlpineVengeance(Unit, Event) 
	Unit:CastSpell(5628) 
end

function GnarlpineTotemic_HealingWard(Unit, Event) 
	Unit:CastSpell(5605) 
end

function GnarlpineTotemic_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GnarlpineTotemic_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2014, 1, "GnarlpineTotemic_OnCombat")
RegisterUnitEvent(2014, 2, "GnarlpineTotemic_OnLeaveCombat")
RegisterUnitEvent(2014, 4, "GnarlpineTotemic_OnDied")

--Gnarlpine Warrior
function GWR_OnCombat(Unit, Event)
	Unit:RegisterEvent("GWR_Strike", 3000, 0)
end

function GWR_Strike(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(11976, Unit:GetClosestPlayer())
	end
end

function GWR_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function GWR_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2008, 1, "GWR_OnCombat")
RegisterUnitEvent(2008, 2, "GWR_OnLeaveCombat")
RegisterUnitEvent(2008, 4, "GWR_OnDied")

--Rascal Sprite
function RS_OnCombat(Unit, Event)
	Unit:RegisterEvent("RS_FF", 30000, 0)
end

function RS_FF(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(6950, Unit:GetClosestPlayer())
	end
end

function RS_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function RS_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2002, 1, "RS_OnCombat")
RegisterUnitEvent(2002, 2, "RS_OnLeaveCombat")
RegisterUnitEvent(2002, 4, "RS_OnDied")

--Shadow Sprite
function SS_OnCombat(Unit, Event)
	Unit:RegisterEvent("SS_ShB", 3000, 0)
end

function SS_ShB(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(9613, Unit:GetClosestPlayer())
	end
end

function SS_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function SS_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2003, 1, "SS_OnCombat")
RegisterUnitEvent(2003, 2, "SS_OnLeaveCombat")
RegisterUnitEvent(2003, 4, "SS_OnDied")

--Timberling Bark Ripper
function TBR_OnCombat(Unit, Event)
	Unit:RegisterEvent("TBR_PieA", 20000, 0)
end

function TBR_PieA(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(6016, Unit:GetClosestPlayer())
	end
end

function TBR_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function TBR_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2025, 1, "TBR_OnCombat")
RegisterUnitEvent(2025, 2, "TBR_OnLeaveCombat")
RegisterUnitEvent(2025, 4, "TBR_OnDied")

--Timberling Mire Beast
function TMB_OnCombat(Unit, Event)
	Unit:RegisterEvent("TMB_MM", 10000, 1)
end

function TMB_MM(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(5567, Unit:GetClosestPlayer())
	end
end

function TMB_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function TMB_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2029, 1, "TMB_OnCombat")
RegisterUnitEvent(2029, 2, "TMB_OnLeaveCombat")
RegisterUnitEvent(2029, 4, "TMB_OnDied")

--Vicious Grell
function VG_OnCombat(Unit, Event)
	Unit:RegisterEvent("VG_Sav", 15000, 0)
end

function VG_Sav(Unit, Event)
	Unit:CastSpell(5515)
end

function VG_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function VG_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2005, 1, "VG_OnCombat")
RegisterUnitEvent(2005, 2, "VG_OnLeaveCombat")
RegisterUnitEvent(2005, 4, "VG_OnDied")

--Webwood Silkspinner
function WS_OnCombat(Unit, Event)
	Unit:RegisterEvent("WS_Web", 4000, 0)
end

function WS_Web(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(12023, Unit:GetClosestPlayer())
	end
end

function WS_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function WS_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2000, 1, "WS_OnCombat")
RegisterUnitEvent(2000, 2, "WS_OnLeaveCombat")
RegisterUnitEvent(2000, 4, "WS_OnDied")