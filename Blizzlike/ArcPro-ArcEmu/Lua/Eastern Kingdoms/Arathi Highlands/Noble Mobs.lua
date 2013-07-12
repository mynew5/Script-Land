--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, Ascendscripting
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Kor'gresh Coldrage
function KorgreshColdrage_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("FrostNova", 25000, 0)
	Unit:RegisterEvent("TrelanesFreezingTouch", 45000, 0)
end

function FrostNova(Unit, Event)
	Unit:FullCastSpellOnTarget(865, Unit:GetMainTank())
end

function TrelanesFreezingTouch(Unit, Event)
	Unit:FullCastSpellOnTarget(4320, Unit:GetMainTank())
end

function KorgreshColdrage_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function KorgreshColdrage_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2793, 1, "KorgreshColdrage_OnEnterCombat")
RegisterUnitEvent(2793, 2, "KorgreshColdrage_OnLeaveCombat")
RegisterUnitEvent(2793, 4, "KorgreshColdrage_OnDied")

--Kovork
function Kovork_OnEnterCombat(Unit,Event)
local choice = math.random(1,2)
	if (choice == 1) then
		Unit:CastSpell(8269)
	elseif (choice == 2) then
		return
	end
end

function Kovork_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Kovork_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2603, 1, "Kovork_OnEnterCombat")
RegisterUnitEvent(2603, 2, "Kovork_OnLeaveCombat")
RegisterUnitEvent(2603, 4, "Kovork_OnDied")

--Lord Falconcrest
function LordFalconcrest_OnEnterCombat(Unit,Event)
	Unit:SendChatMessage(21, 0, "I presume you come with good news?")
	Unit:CastSpell()
	Unit:RegisterEvent("Disarm", 23000, 0)
end

function Disarm(Unit,Event)
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank())
end

function LordFalconcrest_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function LordFalconcrest_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2597, 1, "LordFalconcrest_OnEnterCombat")
RegisterUnitEvent(2597, 2, "LordFalconcrest_OnLeaveCombat")
RegisterUnitEvent(2597, 4, "LordFalconcrest_OnDied")

--Molok the Crusher
function MoloktheCrusher_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Backhand", 16000, 0)
end

function Backhand(Unit, Event)
	Unit:FullCastSpellOnTarget(6253, Unit:GetMainTank())
end

function MoloktheCrusher_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function MoloktheCrusher_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2604, 1, "MoloktheCrusher_OnEnterCombat")
RegisterUnitEvent(2604, 2, "MoloktheCrusher_OnLeaveCombat")
RegisterUnitEvent(2604, 4, "MoloktheCrusher_OnDied")

--Nimar the Slayer
function NimarTheSlayer_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Cleave", 5000, 0)
	Unit:RegisterEvent("Whirlwind", 14000, 0)
end

function Cleave(Unit, Event)
	Unit:FullCastSpellOnTarget(845, Unit:GetMainTank())
end

function Whirlwind(Unit, Event)
	Unit:FullCastSpellOnTarget(15576, Unit:GetMainTank())
	Unit:CastSpellOnTarget(17207, Unit:GetMainTank())
end

function NimarTheSlayer_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function NimarTheSlayer_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2606, 1, "NimarTheSlayer_OnEnterCombat")
RegisterUnitEvent(2606, 2, "NimarTheSlayer_OnLeaveCombat")
RegisterUnitEvent(2606, 4, "NimarTheSlayer_OnDied")

--Otto
function Otto_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Pummel", 12000, 0)
	Unit:RegisterEvent("Backhand", 16000, 0)
end

function Pummel(Unit, Event)
	Unit:FullCastSpellOnTarget(12555, Unit:GetMainTank())
end

function Backhand(Unit, Event)
	Unit:FullCastSpellOnTarget(6253, Unit:GetMainTank())
end

function Otto_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Otto_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2599, 1, "Otto_OnEnterCombat")
RegisterUnitEvent(2599, 2, "Otto_OnLeaveCombat")
RegisterUnitEvent(2599, 4, "Otto_OnDied")

--Ruul Onestone
function RuulOnestone_OnEnterCombat(Unit, Event)
	Unit:CastSpell(6742)
	Unit:RegisterEvent("LightningBolt", 5000, 0)
end

function LightningBolt(Unit, Event)
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank())
end

function RuulOnestone_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function RuulOnestone_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2602, 1, "RuulOnestone_OnEnterCombat")
RegisterUnitEvent(2602, 2, "RuulOnestone_OnLeaveCombat")
RegisterUnitEvent(2602, 4, "RuulOnestone_OnDied")

--Singer
function Singer_OnEnterCombat(Unit, Event)
	Unit:CastSpell(13730)
	Unit:RegisterEvent("DominateMind", 34000, 0)
end

function DominateMind(Unit, Event)
	Unit:FullCastSpellOnTarget(14515, Unit:GetMainTank())
end

function Singer_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Singer_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2600, 1, "Singer_OnEnterCombat")
RegisterUnitEvent(2600, 2, "Singer_OnLeaveCombat")
RegisterUnitEvent(2600, 4, "Singer_OnDied")

--Zalas Witherbark
function ZalasWitherbark_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("ShadowboltVolley", 3000, 0)
end

function ShadowboltVolley(Unit, Event)
	if(Unit:GetClosestPlayer() ~= nil) then
		return
	else
		Unit:FullCastSpellOnTarget(9081, Unit:GetClosestPlayer())
	end
end

function ZalasWitherbark_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function ZalasWitherbark_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2605, 1, "ZalasWitherbark_OnEnterCombat")
RegisterUnitEvent(2605, 2, "ZalasWitherbark_OnLeaveCombat")
RegisterUnitEvent(2605, 4, "ZalasWitherbark_OnDied")