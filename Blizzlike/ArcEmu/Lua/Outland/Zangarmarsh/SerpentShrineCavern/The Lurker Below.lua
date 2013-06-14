--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: LUA++; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

r = 20

function OnCombat(Unit, Event)
    Lurker = Unit
    Lurker:RegisterEvent("Geyser", 12000, 0)
    Lurker:RegisterEvent("Whirl", 32000, 1)
    Lurker:RegisterEvent("WaterboltCheck", 5000, 0)
    Lurker:RegisterEvent("dummyspawn", 45000, 1)
    Lurker:RegisterEvent("Phase2", 120000, 1)
    Lurker:RegisterEvent("DidthatCheck", 5000, 0)
end
    
function OnLeaveCombat(Unit, Event)
    Lurker:RemoveEvents()
end
    
function OnKilledTarget(Unit, Event)
    Lurker:RemoveEvents()
end

function OnDied(Unit, Event)
    Lurker:RemoveEvents()
end

function dummyspawn(Unit, Event)
    if(Unit:GetMainTank() ~= nil) then
		Lurker:SpawnCreature(18729, Unit:GetMainTank():GetX(), Unit:GetMainTank():GetY(), Lurker:GetZ()-3, Lurker:GetO(), 936, 0)
		Lurker:RegisterEvent("TauntedByDummy", 90, 1)
    else
    end
end
    
function SpoutFire(Unit, Event)
    Lurker:FullCastSpell(37433)
    Lurker:RegisterEvent("SpoutFire", 2500, 1)
end
    
function TauntedByDummy(Unit, Event)
    Lurker:SetCombatMeleeCapable(1)
    Lurker:ChangeTarget(Dummy)
    Lurker:SetCombatTargetingCapable(1)
    Targeting = 1
end

function DummySpawn(Unit, Event)
    Dummy = Unit
    Dummy:SetNPCFlags(4)
    Dummy:SetCombatMeleeCapable(1)
    Dummy:SetCombatTargetingCapable(1)
    Targeting2 = 1
    Dummy:RegisterEvent("Dummytest", 100 , 1)
    Dummy:RegisterEvent("DummyImmune", 100, 1)
end

function DummyImmune(Unit, Event)
    Dummy:CastSpell(37588)
    Dummy:CastSpell(37905)
end
    
function Dummytest(Unit, Event)
    if(Targeting == 1) then
		print "Dummy Targeted"
    end
    if(Targeting2 == 1) then
		print "Lurker Targeted, Success"
		Dummy:RegisterEvent("DummyMove", 1000, 1)
    end
end

function DummyMove(Unit, Event)
    Lurker:RemoveEvents()
    Lurker:RegisterEvent("SpoutFire",2500, 1)
    Dummy:RegisterEvent("Move", 1, 1)
    Didthat = 1
end

function Move(Unit, Event)
    Dummy:CreateCustomWaypointMap()
    a = 0
    repeat
        a = a+0.1291543
        Dummy:CreateWaypoint(Lurker:GetX()+r*math.cos(a), Lurker:GetY()+r*math.sin(a), Lurker:GetZ()-3, Lurker:GetO(), 0, 256, 20216)
    until a >=6.457715
    Lurker:RegisterEvent("DidthatCheck", 5000, 0)
    Dummy:MoveToWaypoint(1)
    Dummy:RegisterEvent("Destroy", 25000, 1)
end

function DidthatCheck(Unit, Event)
    if(Didthat == 1) then
		Passed = 2
    end
    if(Passed == 2) then
		Normal = 1
    end
end
    
function Destroy(Unit, Event)
    Dummy:DestroyCustomWaypointMap()
    Dummy:Despawn(0, 0)
    Lurker:RemoveEvents()
    Lurker:SetCombatMeleeCapable(0)
    Lurker:GetMainTank()
    Lurker:RegisterEvent("DidthatCheck", 5000, 0)
    Lurker:RegisterEvent("Geyser", 12000, 0)
    Lurker:RegisterEvent("Whirl", 32000, 1)
    Lurker:RegisterEvent("WaterboltCheck", 5000, 0)
    Lurker:RegisterEvent("dummyspawn", 45000, 1)
    if(Didthat == 1) then
		Lurker:RegisterEvent("Phase2", 75000, 1)
		Didthat = 0
    elseif(Passed == 2) then
		Lurker:RegisterEvent("Phase2", 30000, 1)
		Passed = 0
    elseif(Normal == 1) then
		Lurker:RegisterEvent("Phase2", 120000, 1)
    end
end
    
RegisterUnitEvent(18729, 6, "DummySpawn")

function Geyser(Unit, Event)
    if(Lurker:GetRandomPlayer(0) ~= nil) then
		Lurker:FullCastSpellOnTarget(37478, Lurker:GetRandomPlayer(0))
    else
    end
end

function Whirl(Unit, Event)
    if(Lurker:GetMainTank() ~= nil) then
		Lurker:CastSpellOnTarget(37363, Lurker:GetMainTank())
    else
    end
end

function WaterboltCheck(Unit, Event)
    if(Lurker:GetMainTank()~= nil) then
		Lurker:RegisterEvent("MtInRangeCheck", 200, 1)
    else
    end
end
    
function MtInRangeCheck(Unit, Event)
    if((tank:GetX() > Lurker:GetX() + 30) and (tank:GetY() > Lurker:GetY() - 50)) then
		Lurker:RegisterEvent("Waterbolt", 100, 1)
    elseif((tank:GetX() <= Lurker:GetX() + 30) and (tank:GetY() <= Lurker:GetY() - 50)) then
		Lurker:RemoveEvents()
		Lurker:RegisterEvent("Geyser", 15000, 0)
		Lurker:RegisterEvent("WaterboltCheck", 5000, 0)
		Lurker:RegisterEvent("SpoutStart", 45000, 0)
		Lurker:RegisterEvent("Phase2", 120000, 0)
		Lurker:RegisterEvent("Whirl", 30000, 1)
		Lurker:RegisterEvent("DidthatCheck", 5000, 0)
    end
end

function Waterbolt (Unit, Event)
    if(Lurker:GetRandomPlayer(0) ~= nil) then
		Lurker:StopMovement(1)
		Lurker:FullCastSpellOnTarget(37138, Lurker:GetRandomPlayer(0))
    else
    end
    Lurker:RegisterEvent("WaterboltCheck", 2000, 1)
end

function Phase2(Unit, Event)
    Lurker:RemoveEvents()
    Lurker:SetCombatCapable(1)
    Lurker:SetNPCFlags(4)
    Lurker:Emote(374)
    Lurker:RegisterEvent("Submerge", 3000, 1)
    Lurker:RegisterEvent("Addspawn", 5000, 1)
end
    
function Submerge(Unit, Event)
    Lurker:MoveTo(Lurker:GetX(), Lurker:GetY(), Lurker:GetZ()-50, Lurker:GetO())
    Lurker:RegisterEvent("ReEmerge", 60000, 1)
end
    
function ReEmerge(Unit, Event)
    Lurker:RemoveEvents()
    Lurker:MoveTo(Lurker:GetX(), Lurker:GetY(), Lurker:GetZ()+50, Lurker:GetO())
    Lurker:RegisterEvent("Resume", 5000, 1)
end

function Resume(Unit, Event)
    Lurker:RemoveEvents()
    Lurker:SetCombatMeleeCapable(1)
    Lurker:GetMainTank()
    Lurker:RegisterEvent("Geyser", 12000, 0)
    Lurker:RegisterEvent("Whirl", 32000, 0)
    Lurker:RegisterEvent("WaterboltCheck", 5000, 0)
    Lurker:RegisterEvent("dummyspawn", 45000, 0)
    Lurker:RegisterEvent("Phase2", 120000, 0)
end
    
function Addspawn(Unit, Event)
	Lurker:SpawnCreature(21865, 58.503925, -470.745422, -19.793449, 2.003222, 1620, 0)
	Lurker:SpawnCreature(21865, 65.434769, -462.348175, -19.793442, 2.036211, 1620, 0)
	Lurker:SpawnCreature(21865, 14.190825, -465.010651, -19.793459, 1.046609, 1620, 0)
	Lurker:SpawnCreature(21865, 5.582020, -459.623169, -19.793459, 0.863040, 1620, 0)
	Lurker:SpawnCreature(21865, 68.046989, -371.959717, -19.812212, 3.936874, 1620, 0)
	Lurker:SpawnCreature(21865, 78.378624, -376.773041, -19.763062, 4.109663, 1620, 0)
	Lurker:SpawnCreature(21873, 52.806099, -403.037048, -18.976122, 3.775870, 1620, 0)
	Lurker:SpawnCreature(21873, 53.753056, -435.293640, -18.579000, 2.291469, 1620, 0)
	Lurker:SpawnCreature(21873, 21.132940, -436.494507, -19.311489, 0.958648, 1620, 0)
end

function Ambusher(Unit, Event)
local Ambusher = Unit
    if(Ambusher:GetRandomPlayer(0) ~= nil) then
		Ambusher:RegisterEvent("MultiShot", 1000, 1)
    else
    end
end

function MultiShot(Unit)
    if(math.random() < 0.3) then
		Ambusher:FullCastSpellOnTarget(30990, Ambusher:GetRandomPlayer(2))
		Ambusher:RegisterEvent("MultiShot", 5000, 1)
    end
end

function Guardian(Unit, Event)
local Guardian = Unit
    Guardian:RegisterEvent("ArcinSmash", 5000, 0)
    Guardian:RegisterEvent("Hamstring", 7000, 0)
end

function ArcinSmash(Unit, Event)
    if(math.random() < 0.3) then
		Guardian:FullCastSpellOnTarget(39144, Guardian:GetMainTank())
    end
end

function Hamstring(Unit, Event)
    if(math.random() < 0.3) then
		Guardian:FullCastSpellOnTarget(29667, Guardian:GetMainTank())
    end
end

RegisterUnitEvent(21865, 1, "Ambusher")
RegisterUnitEvent(21873, 1, "Guardian")
RegisterUnitEvent(21217, 1, "OnCombat")
RegisterUnitEvent(21217, 2, "OnLeaveCombat")
RegisterUnitEvent(21217, 3, "OnKilledTarget")
RegisterUnitEvent(21217, 4, "OnDied")