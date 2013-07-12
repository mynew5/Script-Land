--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
 
function Razorscale_OnCombat(pUnit, Event)
	Razorscale:RemoveEvents()
	TurretA = 0
	TurretB = 0
	Razorscale:ModifyWalkSpeed(0)
	Razorscale:RegisterEvent("Razorscale_guards1", 3000, 1)
	Razorscale:RegisterEvent("Razorscale_guards2", 3000, 1)
	Razorscale:RegisterEvent("Razorscale_Fireball", 18000, 0)
	Razorscale:RegisterEvent("Razorscale_kecy1", 2000, 1)
	Razorscale:RegisterEvent("Razorscale_kecy2", 7000, 1)
	Razorscale:RegisterEvent("Razorscale_guards1", 30000, 2)
	Razorscale:RegisterEvent("Razorscale_guards2", 30500, 2)
	Razorscale:RegisterEvent("Razorscale_DevouringFlame", 10000, 0)
	Razorscale:RegisterEvent("Razorscale_Phase2", 1000, 0)
	Razorscale:RegisterEvent("Razorscale_Enrage", 600000, 1)
	Razorscale:RegisterEvent("Razorscale_Turrets", 5000, 0)
	Razorscale:RegisterEvent("Razorscale_Phase2", 1000, 0)
	Razorscale:SetCombatCapable(1)
end
 
 
function Razorscale_guards1(pUnit, Event)
local Choice = math.random(1,2)
	ExpeditionTrapper:SetFaction(1801)
	lol1 = 0
	lol2 = 0
	lol3 = 0
	if(Choice == 1) then
		lol1 = 1
	elseif(Choice == 1) then
		lol2 = 1
	elseif(Choice == 1) then
		lol3 = 1
	end
	if(lol1 == 1) then
		ExpeditionTrapper:SpawnGameObject(194316, ExpeditionTrapper:GetX()+2, ExpeditionTrapper:GetY()-4, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 600)
		ExpeditionTrapper:SpawnCreature(33453, ExpeditionTrapper:GetX()+2, ExpeditionTrapper:GetY()-3, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
		ExpeditionTrapper:SpawnCreature(33388, ExpeditionTrapper:GetX()+3, ExpeditionTrapper:GetY()-6, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
		ExpeditionTrapper:SpawnCreature(33388, ExpeditionTrapper:GetX()+1, ExpeditionTrapper:GetY()-5, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
	elseif(lol2 == 1) then
		ExpeditionTrapper:SpawnGameObject(194316, ExpeditionTrapper:GetX()-2, ExpeditionTrapper:GetY()-7, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 600)
		ExpeditionTrapper:SpawnCreature(33453, ExpeditionTrapper:GetX()+3, ExpeditionTrapper:GetY()-6, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
		ExpeditionTrapper:SpawnCreature(33388, ExpeditionTrapper:GetX()+1, ExpeditionTrapper:GetY()-5, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
	elseif(lol3 == 1) then
		ExpeditionTrapper:SpawnGameObject(194316, ExpeditionTrapper:GetX()+4, ExpeditionTrapper:GetY()-2, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 600)
		ExpeditionTrapper:SpawnCreature(33453, ExpeditionTrapper:GetX()+2, ExpeditionTrapper:GetY()-3, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
		ExpeditionTrapper:SpawnCreature(33388, ExpeditionTrapper:GetX()+3, ExpeditionTrapper:GetY()-6, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
		ExpeditionTrapper:SpawnCreature(33388, ExpeditionTrapper:GetX()+1, ExpeditionTrapper:GetY()-5, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
	end
end
 
 
function Razorscale_guards2(pUnit, Event)
local Choice = math.random(1,2)
	lol1 = 0
	lol2 = 0
	if(Choice == 1) then
		lol1 = 1
	elseif(Choice == 1) then
		lol2 = 1
	end
	if(lol1 == 1) then
		ExpeditionTrapper:SpawnGameObject(194316, ExpeditionTrapper:GetX()+50, ExpeditionTrapper:GetZ()+1, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 600)
		ExpeditionTrapper:SpawnCreature(33453, ExpeditionTrapper:GetX()+52, ExpeditionTrapper:GetZ()+2, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
		ExpeditionTrapper:SpawnCreature(33388, ExpeditionTrapper:GetX()+51, ExpeditionTrapper:GetZ()+3, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
		ExpeditionTrapper:SpawnGameObject(194316, ExpeditionTrapper:GetX()+52, ExpeditionTrapper:GetZ()+3, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 600)
		ExpeditionTrapper:SpawnCreature(33846, ExpeditionTrapper:GetX()+53, ExpeditionTrapper:GetZ()+4, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
	elseif(lol2 == 1) then
		ExpeditionTrapper:SpawnGameObject(194316, ExpeditionTrapper:GetX()+53, ExpeditionTrapper:GetZ()+3, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 600)
		ExpeditionTrapper:SpawnCreature(33453, ExpeditionTrapper:GetX()+52, ExpeditionTrapper:GetZ()+5, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
		ExpeditionTrapper:SpawnCreature(33388, ExpeditionTrapper:GetX()+51, ExpeditionTrapper:GetZ()+1, ExpeditionTrapper:GetZ(), ExpeditionTrapper:GetO(), 14, 6000000)
	end
end
 
function Razorscale_kecy1(pUnit, Event)
	ExpeditionCommander:SendChatMessage(14, 0, "Be on the lookout! Mole machines will be surfacing soon with those nasty Iron dwarves aboard!")
--	ExpeditionCommander::PlaySoundToSet()
end
 
function Razorscale_kecy2(pUnit, Event)
	ExpeditionCommander:SendChatMessage(14, 0, "Ready to move out, keep those dwarves off of our backs!")
--	ExpeditionCommander:PlaySoundToSet()
end
 
 
function Razorscale_Turrets(pUnit, Event)
	if((TurretA) and (TurretB == 1)) then
		Razorscale:RemoveEvents()
		Razorscale:RegisterEvent("Razorscale_land", 100, 1)
		ExpeditionCommander:SendChatMessage(14, 0, "Move! Quickly! She won’t remain grounded for long.")
		ExpeditionCommander:PlaySoundToSet(15648)
		Razorscale:SetCombatCapable(1)
		Razorscale:RegisterEvent("FlameBreath", 28000, 1)
		Razorscale:RegisterEvent("Razorscale_fly", 30000, 1)
		Razorscale:RegisterEvent("Razorscale_WingBuffet", 31000, 1)
	end
end
 
 
function Razorscale_WingBuffet(pUnit, Event)
	Razorscale:FullCastSpell(62666)
	pUnit:SpawnCreature(33287, pUnit:GetX()-5, pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 35, 6000000)
	Razorscale:SetCombatTargetingCapable(0)
	Razorscale:RemoveEvents()
	Razorscale:RegisterEvent("Razorscale_OnCombat", 1000, 1)
end
 
function Razorscale_Phase2(pUnit, Event)
	if(Razorscale:GetHealthPct() <= 50) then
		Razorscale:RemoveEvents()
		Engineer:RemoveFromWorld()
		Razorscale:ModifyWalkSpeed(4)
		ExpeditionCommander:SendChatMessage(42, 0, "Enrage in 3min!")
		Razorscale:RegisterEvent("Razorscale_Enrage", 180000, 1)
		Razorscale:RegisterEvent("Razorscale_land", 100, 1)
		Razorscale:RegisterEvent("FuseArmor", 10000, 0)
		Razorscale:RegisterEvent("FlameBreath", 20000, 0)
		Razorscale:RegisterEvent("Razorscale_movenormal", 3000, 3)
	end
end
 
function Razorscale_movenormal(pUnit, Event)
	Razorscale:SetCombatCapable(0)
end
 
function FuseArmor(pUnit, Event)
	Razorscale:FullCastSpellOnTarget(64771, pUnit:GetMainTank())
end
 
function FlameBreath(pUnit, Event)
	ExpeditionCommander:SendChatMessage(14, 0, "Razorscale takes a deep breath...")
--	ExpeditionCommander:PlaySoundToSet()
	Razorscale:FullCastSpell(63317, pUnit:GetMainTank())
	Player:FullCastSpellOnTarget(63308, pUnit:GetMainTank())
end
 
function Razorscale_Enrage(pUnit, Event)
	Razorscale:FullCastSpell(47008, Razorscale)
end
 
function Razorscale_fly(pUnit, Event)
	Razorscale:ModifyWalkSpeed(11)
	Razorscale:MoveTo(Razorscale:GetO(),Razorscale:GetY(), Razorscale:GetZ()+44,Razorscale:GetO())
end
 
function Razorscale_position(pUnit, Event)
local Choice = math.random(1,4)
	Razorscale:ModifyWalkSpeed(12)
--	{602.0, -248.1, 391.2},
--	{624.4, -232-4, 391.1},
--	{643.3, -256.4, 391.4},
--	{626.6, -271.5, 391.4},
	if(Choice == 1) then
		Razorscale:MoveTo(pUnit:GetX()-3, pUnit:GetY()+6, 61, pUnit:GetO())
	elseif(Choice == 2) then
		Razorscale:MoveTo(pUnit:GetX()+4, pUnit:GetY()-4, 61, pUnit:GetO())
	elseif(Choice == 3) then
		Razorscale:MoveTo(pUnit:GetX()+3, pUnit:GetY()-6, 61, pUnit:GetO())
	elseif(Choice == 4) then
		Razorscale:MoveTo(pUnit:GetX()-4, pUnit:GetY()+4, 61, pUnit:GetO())
	end
end

function Razorscale_land(pUnit, Event)
	Razorscale:ModifyWalkSpeed(11)
	Razorscale:SetCombatCapable(1)
	Razorscale:MoveTo(Engineer:GetO(),Engineer:GetY()-15, Engineer:GetZ(),Engineer:GetO())
end

function Razorscale_DevouringFlame(pUnit, Event)
	Player:FullCastSpellOnTarget(63308, pUnit:GetRandomPlayer(0))
end

function Razorscale_Fireball(pUnit, Event)
	Razorscale:FullCastSpellOnTarget(62796, pUnit:GetRandomPlayer(0))
end

function Razorscale_OnSpawn(pUnit, Event)
	pUnit:ModifyWalkSpeed(11)
--	Razorscale:RegisterEvent("Razorscale_position", 1000, 1)
end

function Razorscale_OnDied(pUnit, Event)
	Razorscale:RemoveEvents()
end

function Razorscale_OnLeaveCombat(pUnit, Event)
	Razorscale:RemoveFromWorld()
end

--Dark Rune Watcher
function DarkRuneWatcher_OnCombat(pUnit, Event)
DarkRuneWatcher = pUnit
	DarkRuneWatcher:RegisterEvent("DarkRuneWatcher_ChainLightning", 4500, 0)
	DarkRuneWatcher:RegisterEvent("DarkRuneWatcher_LightningBolt", 10000, 0)
end

function DarkRuneWatcher_LightningBolt(pUnit, Event)
	DarkRuneWatcher:FullCastSpell(63809, pUnit:GetMainTank())
end

function DarkRuneWatcher_ChainLightning(pUnit, Event)
	DarkRuneWatcher:FullCastSpellOnTarget(64758, pUnit:GetMainTank())
end

function DarkRuneWatcher_OnSpawn(pUnit, Event)
	DarkRuneWatcher = pUnit
end

function DarkRuneWatcher_OnDied(pUnit, Event)
	DarkRuneWatcher:Despawn(1, 0)
--	pUnit:RemoveFromWorld()
--	DarkRuneWatcher:RemoveEvents()
end

function DarkRuneWatcher_OnLeaveCombat(pUnit, Event)
	DarkRuneWatcher:RemoveEvents()
end

RegisterUnitEvent(33453, 18, "DarkRuneWatcher_OnSpawn")
RegisterUnitEvent(33453, 1, "DarkRuneWatcher_OnCombat")
RegisterUnitEvent(33453, 2, "DarkRuneWatcher_OnLeaveCombat")
RegisterUnitEvent(33453, 4, "DarkRuneWatcher_OnDied")

--Dark Rune Sentinel
function DarkRuneSentinel_OnCombat(pUnit, Event)
	DarkRuneSentinel = pUnit
	DarkRuneSentinel:RegisterEvent("DarkRuneSentinel_BattleShout", 3300, 0)
	DarkRuneSentinel:RegisterEvent("DarkRuneSentinel_HeroicStrike", 5000, 0)
	DarkRuneSentinel:RegisterEvent("DarkRuneSentinel_Whirlwind", 10000, 0)
end

function DarkRuneSentinel_HeroicStrike(pUnit, Event)
	DarkRuneSentinel:CastSpellOnTarget(45026, pUnit:GetMainTank())
end

function DarkRuneSentinel_BattleShout(pUnit, Event)
	DarkRuneSentinel:CastSpell(46763, DarkRuneSentinel)
end

function DarkRuneSentinel_Whirlwind(pUnit, Event)
-- 	DarkRuneSentinel:FullCastSpell(63807, DarkRuneSentinel)
	DarkRuneSentinel:FullCastSpellOnTarget(55266, DarkRuneSentinel)
end

function DarkRuneSentinel_OnSpawn(pUnit, Event)
	DarkRuneSentinel = pUnit
end

function DarkRuneSentinel_OnDied(pUnit, Event)
--	pUnit:RemoveFromWorld()
	DarkRuneSentinel:Despawn(1, 0)
	DarkRuneSentinel:RemoveEvents()
end

function DarkRuneSentinel_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(33846, 18, "DarkRuneSentinel_OnSpawn")
RegisterUnitEvent(33846, 1, "DarkRuneSentinel_OnCombat")
RegisterUnitEvent(33846, 2, "DarkRuneSentinel_OnLeaveCombat")
RegisterUnitEvent(33846, 4, "DarkRuneSentinel_OnDied")

--Dark Rune Guardian
function DarkRuneGuardian_OnCombat(pUnit, Event)
	DarkRuneGuardian = pUnit
--	DarkRuneGuardian:RegisterEvent("DarkRuneGuardian_Stormstrike", 4000, 0)
end

function DarkRuneGuardian_Stormstrike(pUnit, Event)
	DarkRuneGuardian:CastSpellOnTarget(64757, pUnit:GetMainTank())
end

function DarkRuneGuardian_OnSpawn(pUnit, Event)
	DarkRuneGuardian = pUnit
end

function DarkRuneGuardian_OnDied(pUnit, Event)
--	pUnit:RemoveFromWorld()
	DarkRuneGuardian:Despawn(1, 0)
	DarkRuneGuardian:RemoveEvents()
end

function DarkRuneGuardian_OnLeaveCombat(pUnit, Event)
	DarkRuneGuardian:RemoveEvents()
end

RegisterUnitEvent(33388, 18, "DarkRuneGuardian_OnSpawn")
RegisterUnitEvent(33388, 1, "DarkRuneGuardian_OnCombat")
RegisterUnitEvent(33388, 2, "DarkRuneGuardian_OnLeaveCombat")
RegisterUnitEvent(33388, 4, "DarkRuneGuardian_OnDied")
RegisterUnitEvent(33186, 18, "Razorscale_OnSpawn")
RegisterUnitEvent(33186, 1, "Razorscale_OnCombat")
RegisterUnitEvent(33186, 2, "Razorscale_OnLeaveCombat")
RegisterUnitEvent(33186, 4, "Razorscale_OnDied")

--Expedition Trapper
local guard = 0

function ExpeditionTrapper_OnSpawn(pUnit, Event)
	ExpeditionTrapper = pUnit
	pUnit:EquipWeapons(42294, 0, 0)
--	pUnit:SendChatMessage(14, 0, "Ready")
	ExpeditionTrapper:ModifyWalkSpeed(14)
	if(guard == 0) then
		ExpeditionTrapper:RegisterEvent("ExpeditionTrapper_1guard", 3000, 1)
		ExpeditionTrapper:RegisterEvent("ExpeditionTrapper_Faction", 17000, 1)
		guard = 1
	else
		guard = 0
		ExpeditionTrapper:RegisterEvent("ExpeditionTrapper_2guard", 2000, 1)
	end
end

function ExpeditionTrapper_Faction(pUnit, Event)
	pUnit:SetFaction(1801)
	Razorscale:RegisterEvent("Razorscale_OnCombat", 30000, 1)
end

function ExpeditionTrapper_1guard(pUnit, Event)
	ExpeditionTrapper:MoveTo(ExpeditionCommander:GetX()+20,ExpeditionCommander:GetY()-84,ExpeditionCommander:GetZ(), ExpeditionCommander:GetO())
	pUnit:SpawnCreature(33259, ExpeditionCommander:GetX(), ExpeditionCommander:GetY()-5, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
end

function ExpeditionTrapper_2guard(pUnit, Event)
	ExpeditionTrapper:MoveTo(ExpeditionCommander:GetX()-20, ExpeditionCommander:GetY()-84, ExpeditionCommander:GetZ(), ExpeditionCommander)
	guard = 0
	Razorscale:RegisterEvent("Razorscale_fly", 100, 1)
	Razorscale:SetFaction(14)
end

function ExpeditionTrapper_OnCombat(pUnit, Event)
	ExpeditionTrapper:ModifyWalkSpeed(2)
end

function ExpeditionTrapper_OnDied(pUnit, Event)
	pUnit:Despawn(1, 2000)
	ExpeditionTrapper:RemoveEvents()
end

function ExpeditionTrapper_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(33259, 18, "ExpeditionTrapper_OnSpawn")
RegisterUnitEvent(33259, 1, "ExpeditionTrapper_OnCombat")
RegisterUnitEvent(33259, 2, "ExpeditionTrapper_OnLeaveCombat")

function message(pUnit, Event)
	ExpeditionCommander:SendChatMessage(12, 0, "Welcome, champions! All of our attempts at grounding her have failed. We could use a hand in bring her down with these harpoon guns.")
	ExpeditionCommander:PlaySoundToSet(15647)
end

local Guardsnpc = 0
 
function ExpeditionCommander_OnSpawn(pUnit, Event)
	ExpeditionCommander = pUnit
	TurretA = 0
	TurretB = 0
	ExpeditionCommander:RegisterEvent("message", 1000, 1)
--	ExpeditionCommander:RegisterEvent("ExpeditionCommander_Guards", 1000, 1)
	ExpeditionCommander:EquipWeapons(51389, 0, 0)
end
 
function ExpeditionCommander_Guards(pUnit, Event)
	if(Guardsnpc == 0) then
		pUnit:SpawnCreature(33816, ExpeditionCommander:GetX()-10, ExpeditionCommander:GetY()+10, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		pUnit:SpawnCreature(33816, ExpeditionCommander:GetX()-8, ExpeditionCommander:GetY()+10, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		pUnit:SpawnCreature(34144, ExpeditionCommander:GetX()-5, ExpeditionCommander:GetY()+10, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		pUnit:SpawnCreature(34144, ExpeditionCommander:GetX()-2, ExpeditionCommander:GetY()+10, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		pUnit:SpawnCreature(33816, ExpeditionCommander:GetX(), ExpeditionCommander:GetY()+10, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		pUnit:SpawnCreature(33816, ExpeditionCommander:GetX()+2, ExpeditionCommander:GetY()+10, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		pUnit:SpawnCreature(34144, ExpeditionCommander:GetX()+5, ExpeditionCommander:GetY()+10, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		pUnit:SpawnCreature(34144, ExpeditionCommander:GetX()+8, ExpeditionCommander:GetY()+10, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		pUnit:SpawnCreature(34144, ExpeditionCommander:GetX()+10, ExpeditionCommander:GetY()+10, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		Guardsnpc = 1
	end
end
 
function ExpeditionCommander_OnCombat(pUnit, Event, player)
	ExpeditionCommander:RegisterEvent("message", 3000, 1)
	ExpeditionCommander:RemoveEvents()
	if(Engineer == nil) then
	else
		Engineer:RemoveFromWorld()
	end
	pUnit:StopMovement(6000)
	ExpeditionCommander = pUnit
	pUnit:GossipCreateMenu(100, player, 0)
	pUnit:GossipMenuAddItem(9, "...text....Pull Razorscale?", 422, 0)
	pUnit:GossipMenuAddItem(9, "...", 423, 0)
	pUnit:GossipSendMenu(player)
end
 
function ExpeditionCommander_Submenus(pUnit, Event, player, id, intid, code)
	if(intid == 422) then
--		pUnit:SetNPCFlags(2)
		pUnit:SendChatMessage(42, 0, "Razorscale pull")
		ExpeditionCommander:SpawnCreature(33816, ExpeditionCommander:GetX()+2, ExpeditionCommander:GetY()+10, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 400000)
		ExpeditionCommander:SpawnCreature(33816, ExpeditionCommander:GetX()-2, ExpeditionCommander:GetY()+10, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 400000)
		pUnit:SpawnCreature(33186, ExpeditionCommander:GetX(), ExpeditionCommander:GetY()-50, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		pUnit:SpawnCreature(33259, ExpeditionCommander:GetX(), ExpeditionCommander:GetY()-5, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		pUnit:SpawnCreature(33287, ExpeditionCommander:GetX(), ExpeditionCommander:GetY()-5, ExpeditionCommander:GetZ(), ExpeditionCommander:GetO(), 35, 6000000)
		player:GossipComplete()
	elseif(intid == 423) then
		ExpeditionTrapper:RemoveFromWorld()
		ExpeditionTrapper:RemoveFromWorld()
		DarkRuneGuardian:RemoveFromWorld()
		DarkRuneSentinel:RemoveFromWorld()
		DarkRuneWatcher:RemoveFromWorld()
		Razorscale:RemoveFromWorld()
		Razorscale:RemoveEvents()
		player:GossipComplete()
	end
end

RegisterUnitEvent(33210, 18, "ExpeditionCommander_OnSpawn")
RegisterUnitGossipEvent(33210, 1, "ExpeditionCommander_OnCombat")
RegisterUnitGossipEvent(33210, 2, "ExpeditionCommander_Submenus")

local Turret1 = 0

function Turret1_OnSpawn(pUnit, Event)
	pUnit:RemoveEvents()
	Turret1 = pUnit
	TurretA = 0
	Turret1:SetMaxHealth(300000)
	Turret1:SetHealth(300000)
	Turret1:SetFaction(14)
	Turret1:SetScale(1)
	Turret1:SetCombatTargetingCapable(1)
	Turret1:SetCombatCapable(1)
end

function Turret1_OnCombat(pUnit, Event)
	pUnit:RemoveEvents()
	Turret1 = pUnit
	TurretA = 1
	Turret1:SetFaction(35)
	Turret1:SendChatMessage(42, 0, "Turret 1 shoot!")
	Turret1:RegisterEvent("Turret1_shoot", 3000, 0)
	Turret1:RegisterEvent("Turret1_end", 100000, 1)
end

function Turret1_shoot(pUnit, Event)
	if(Razorscale == nil) then
		pUnit:SendChatMessage(42, 0, "No target!")
	else
		Turret1:CastSpellOnTarget(67372, Razorscale) --visual effect
	end
end

function Turret1_end(pUnit, Event)
	TurretA = 0
	pUnit:RemoveEvents()
	pUnit:RemoveFromWorld()
end

function Turret1_OnDied(pUnit, Event)
	TurretA = 0
	pUnit:RemoveEvents()
end

RegisterUnitEvent(1000008, 18, "Turret1_OnSpawn")
RegisterUnitEvent(1000008, 1, "Turret1_OnCombat")
RegisterUnitEvent(1000008, 4, "Turret1_OnDied")

local Turret2 = 0

function Turret2_OnSpawn(pUnit, Event)
	pUnit:RemoveEvents()
	Turret2 = pUnit
	TurretB = 0
	Turret2:SetMaxHealth(300000)
	Turret2:SetHealth(300000)
	Turret2:SetFaction(14)
	Turret2:SetScale(1)
	Turret2:SetCombatTargetingCapable(1)
	Turret2:SetCombatCapable(1)
end

function Turret2_OnCombat(pUnit, Event)
	pUnit:RemoveEvents()
	Turret2 = pUnit
	Turret2:SetFaction(35)
	TurretB = 1
	Turret2:SendChatMessage(42, 0, "Turret 2 shoot!")
	Turret2:RegisterEvent("Turret2_shoot", 3000, 0)
	Turret2:RegisterEvent("Turret2_end", 90000, 1)
end

function Turret2_shoot(pUnit, Event)
	if(Razorscale == nil) then
--		pUnit:SendChatMessage(42, 0, "No target!")
	else
		Turret2:CastSpellOnTarget(67372, Razorscale)
	end
end

function Turret2_end(pUnit, Event)
	TurretB = 0
	pUnit:RemoveEvents()
	pUnit:RemoveFromWorld()
end

function Turret2_OnDied(pUnit, Event)
	TurretB = 0
	Turret2:SendChatMessage(42, 0, "Fires out! Let's rebuild those turrets!")
	pUnit:RemoveEvents()
end

RegisterUnitEvent(1000009, 18, "Turret2_OnSpawn")
RegisterUnitEvent(1000009, 1, "Turret2_OnCombat")
RegisterUnitEvent(1000009, 4, "Turret2_OnDied")

local stupid = 0
 
function Engineer_OnSpawn(pUnit, Event)
		Engineer = pUnit
		Engineer:SendChatMessage(14, 0, "Give us a moment to prepare to build the turrets.")
		Engineer:Despawn(100000, 0)
		--Engineer:SetFaction(1801)
		Engineer:SetCombatCapable(1)
		Engineer:EquipWeapons(2525, 0, 0)
	if(stupid == 0) then
		Engineer:MoveTo(pUnit:GetX()+2, pUnit:GetY()-20, pUnit:GetZ(), pUnit:GetO())
		Engineer:RegisterEvent("Engineer_first", 10000, 1)
		Engineer:RegisterEvent("Engineer_repair", 58000, 1)
		stupid = 1
	else
		stupid = 0
		Engineer:RegisterEvent("Engineer_second", 2000, 1)
		Engineer:RegisterEvent("Engineer_repair2", 69000, 1)
	end
	Engineer:RegisterEvent("Engineer_Emote", 3000, 0)
end
 
function Engineer_first(pUnit, Event)
	Engineer:SpawnCreature(33287, pUnit:GetX()-5, pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 35, 6000000)
end
 
function Engineer_second(pUnit, Event)
	pUnit:MoveTo(pUnit:GetX()+4, pUnit:GetY(), pUnit:GetZ(), pUnit:GetO())
	stupid = 0
end
 
function Engineer_repair(pUnit, Event)
	Engineer:SpawnCreature(1000008, Engineer:GetX(), Engineer:GetY(), Engineer:GetZ(), Engineer:GetO(), 14, 6000000)
	Engineer:SendChatMessage(42, 0, "Turret 1 repaired...shoot Razorscale!")
end

function Engineer_repair2(pUnit, Event)
	Engineer:SpawnCreature(1000009, Engineer:GetX(), Engineer:GetY(), Engineer:GetZ(), Engineer:GetO(), 14, 6000000)
	Engineer:SendChatMessage(42, 0, "Turret 2 repaired...shoot Razorscale!")
end

function Engineer_Emote(pUnit, Event)
	pUnit:Emote(28, 4000)
end

function Engineer_OnDied(pUnit, Event)
--	ExpeditionCommander:SendChatMessage(42, 0, "No no no! We failed this fight...No more engineer there.")
	Razorscale:RegisterEvent("Razorscale_Enrage", 1000, 1)
	Player = pUnit:GetMainTank()
	Razorscale:MoveTo(Player:GetO(), Player:GetY()-15, Player:GetZ(), Player:GetO())
	pUnit:RemoveEvents()
end

function Engineer_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(33287, 18, "Engineer_OnSpawn")
RegisterUnitEvent(33287, 2, "Engineer_OnLeaveCombat")
RegisterUnitEvent(33287, 4, "Engineer_OnDied")

function DvouringFlameminion_OnSpawn(pUnit, Event)
	DvouringFlameminion = pUnit
	DvouringFlameminion:SetMaxHealth(100000)
	DvouringFlameminion:SetHealth(100000)
	pUnit:SetCombatCapable(1)
	pUnit:SetFaction(14)
	pUnit:FullCastSpellOnTarget(64709, DvouringFlameminion)
end

function DvouringFlameminion_OnCombat(pUnit, Event)
	pUnit:FullCastSpellOnTarget(64709, DvouringFlameminion)
end
 
RegisterUnitEvent(34188, 18, "DvouringFlameminion_OnSpawn")
RegisterUnitEvent(34188, 1, "DvouringFlameminion_OnCombat")

function Defender_OnSpawn(pUnit, Event)
	Defender = pUnit
	Defender:EquipWeapons(9679, 0, 0)
	Defender:MoveTo(pUnit:GetX()+4, pUnit:GetY(), pUnit:GetZ(), pUnit:GetO())
	--Defender:SetFaction(1801)
end
 
RegisterUnitEvent(33816, 18, "Defender_OnSpawn")