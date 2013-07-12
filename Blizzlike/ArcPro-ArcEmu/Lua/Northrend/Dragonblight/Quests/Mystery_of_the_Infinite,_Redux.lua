local PastYou = nil
local Magus = nil
local Eradicator = nil
local Render = nil
local Breaker = nil
local Destroyer = nil
local HourGlass = nil
local Nozdormu = nil

function HourGlass_OnSpawn(pUnit, event)
HourGlass = pUnit
local player = HourGlass:GetClosestPlayer()
	if (player:GetTeam() == 0) then
		player:SpawnCreature(32331, player:GetX()+1, player:GetY()-1, player:GetZ(), math.random(1, 12), 1, 0)
	elseif (player:GetTeam() == 1) then
		player:SpawnCreature(32331, player:GetX()+1, player:GetY()-1, player:GetZ(), math.random(1, 12), 2, 0)
	end
end

RegisterUnitEvent(32327, 18, "HourGlass_OnSpawn")

function PastYou_OnSpawn(pUnit, event)
	PastYou = pUnit
	PastYou:SetModel(5345)
	PastYou:RegisterEvent(PastYou_Me_Spawn, 3000, 1)
end

RegisterUnitEvent(32331, 18, "PastYou_OnSpawn")

function Magus_OnSpawn(pUnit, event)
	Magus = pUnit
end

RegisterUnitEvent(27898, 18, "Magus_OnSpawn")

function Eradicator_OnSpawn(pUnit, event)
	Eradicator = pUnit
end

RegisterUnitEvent(32185, 18, "Eradicator_OnSpawn")

function Render_OnSpawn(pUnit, event)
	Render = pUnit
end

RegisterUnitEvent(27900, 18, "Render_OnSpawn")

function Breaker_OnSpawn(pUnit, event)
	Breaker = pUnit
end

RegisterUnitEvent(32186, 18, "Breaker_OnSpawn")

function Destroyer_OnSpawn(pUnit, event)
	Destroyer = pUnit
end

RegisterUnitEvent(27897, 18, "Destroyer_OnSpawn")

function PastYou_Me_Spawn(pUnit, event)
PastYou:SendChatMessage(15, 0, "Whoa! You're me, but from the future! Hey, my equipment got an upgrade! Cool!")
PastYou:RegisterEvent(HereComesTheMobs, 7000, 1)
end

function HereComesTheMobs(pUnit, event)
	PastYou:SendChatMessage(15, 0, "Here come the Infinites! I've got to keep the hourglass safe. Can you help?")
	PastYou:SpawnCreature(27898, PastYou:GetX()+3, PastYou:GetY()-1, PastYou:GetZ(), math.random(1, 12), 14, 0)
	PastYou:SpawnCreature(27898, PastYou:GetX()-3, PastYou:GetY()-2, PastYou:GetZ(), math.random(1, 12), 14, 0)
	PastYou:SpawnCreature(27896, PastYou:GetX()+2, PastYou:GetY()+3, PastYou:GetZ(), math.random(1, 12), 14, 0)
	PastYou:RegisterEvent(NextPhaseForNabs, 30000, 1)
end

function PastYou_OnCombat(pUnit, event)
	PastYou:RegisterEvent(Blood_Plague, math.random(10000, 17110), 0)
	PastYou:RegisterEvent(Earth_Shock, math.random(15000, 25400), 0)
	PastYou:RegisterEvent(Hammer_of_Justice, 30000, 0)
	PastYou:RegisterEvent(Hemorrhage, 7500, 0)
	PastYou:RegisterEvent(Plague_Strike, math.random(20000, 24000), 0)
	PastYou:RegisterEvent(Whirlwind, math.random(27000, 30000), 0)
	PastYou:RegisterEvent(Wing_Clip, math.random(20000, 22000), 0)
	PastYou:RegisterEvent(SayAfterCombatIsTriggered, 5000, 1)
end

RegisterUnitEvent(32331, 1, "PastYou_OnCombat")

function Magus_OnCombat(pUnit, event)
	Magus:RegisterEvent(Shadow_Blast, math.random(5000, 7000), 0)
	Magus:RegisterEvent(Shadow_Bolt, 5500, 0)
end

RegisterUnitEvent(27898, 1, "Magus_OnCombat")

function Eradicator_OnCombat(pUnit, event)
	Eradicator:RegisterEvent(Hasten, 25000, 0)
	Eradicator:RegisterEvent(Temporal_Vortex, math.random(15000, 19990), 0)
	Eradicator:RegisterEvent(Wing_Buffet, math.random(14000, 22000), 0)
end

RegisterUnitEvent(32185, 1, "Eradicator_OnCombat")

function Render_OnCombat(pUnit, event)
	Render:RegisterEvent(Time_Lapse, 16000, 0)
end

RegisterUnitEvent(27900, 1, "Render_OnCombat")

function Breaker_OnCombat(pUnit, event)
	Breaker:RegisterEvent(Enrage, math.random(10000, 18500), 0)
	Breaker:RegisterEvent(Time_Stop, 16000, 0)
end

RegisterUnitEvent(32186, 1, "Breaker_OnCombat")

function BloodPlague(pUnit, event)
	PastYou:FullCastSpellOnTarget(58844, PastYou:GetRandomEnemy())
end

function Earth_Shock(pUnit, event)
	PastYou:FullCastSpellOnTarget(47071, PastYou:GetRandomEnemy())
end

function Hammer_of_Justice(pUnit, event)
	PastYou:FullCastSpellOnTarget(37369, PastYou:GetRandomEnemy())
end

function Hemorrhage(pUnit, event)
	PastYou:FullCastSpellOnTarget(45897, PastYou:GetClosestEnemy())
end

function Plague_Strike(pUnit, event)
	PastYou:FullCastSpellOnTarget(58843, PastYou:GetRandomEnemy())
end

function Whirlwind(pUnit, event)
	PastYou:FullCastSpell(17207)
end

function Wing_Clip(pUnit, event)
	PastYou:FullCastSpellOnTarget(40652, PastYou:GetClosestEnemy())
end

function Shadow_Blast(pUnit, event)
	Magus:FullCastSpellOnTarget(38085, Magus:GetMainTank())
end

function Shadow_Bolt(pUnit, event)
	Magus:FullCastSpellOnTarget(9613, Magus:GetMainTank())
end

function Hasten(pUnit, event)
	Eradicator:FullCastSpell(31458)
end

function Temporal_Vortex(pUnit, event)
	Eradicator:ChannelSpell(52657, Eradicator:GetMainTank())
end

function Wing_Buffet(pUnit, event)
	Eradicator:FullCastSpell(31475)
end

function Time_Lapse(pUnit, event)
	Render:FullCastSpellOnTarget(51020, Render:GetMainTank())
end

function Enrage(pUnit, event)
	Breaker:FullCastSpell(60075)
end

function Time_Stop(pUnit, event)
	Breaker:FullCastSpell(60074)
end

function NextPhaseForNabs(pUnit, event)
	PastYou:SpawnCreature(27898, PastYou:GetX()+3, PastYou:GetY()-1, PastYou:GetZ(), math.random(1, 12), 14, 0)
	PastYou:SpawnCreature(27898, PastYou:GetX()-3, PastYou:GetY()-2, PastYou:GetZ(), math.random(1, 12), 14, 0)
	PastYou:SpawnCreature(27896, PastYou:GetX()+1, PastYou:GetY()+1, PastYou:GetZ(), math.random(1, 12), 14, 0)
	PastYou:SpawnCreature(32185, PastYou:GetX()+1, PastYou:GetY(), PastYou:GetZ(), math.random(1, 12), 14, 0)
	PastYou:RegisterEvent(NextPhaseForMoreNabs, 30000, 1)
end

function NextPhaseForMoreNabs(pUnit, event)
	PastYou:SpawnCreature(27897, PastYou:GetX()+6, PastYou:GetY()-1, PastYou:GetZ(), math.random(1, 12), 14, 0)
	PastYou:SpawnCreature(32186, PastYou:GetX()-2, PastYou:GetY()-6, PastYou:GetZ(), math.random(1, 12), 14, 0)
	PastYou:RegisterEvent(FUCKTHISSHIT, 10000, 1)
end

function FUCKTHISSHIT(pUnit, event)
	PastYou:SpawnCreature(27925, 4112.990234, -417.622009, 191.050995, 1.727880, 35, 30000)
	PastYou:SendChatMessage(15, 0, "What the heck? Nozdormu is up there!")
	PastYou:RegisterEvent(OneFinalMessageByYou, 8000, 1)
	PastYou:RegisterEvent(BuggyShitAsCrap, 5000, 1)
end

function BuggyShitAsCrap(pUnit, event)
	PastYou:RemoveEvents()
	PastYou:SendChatMessage(15, 0, "I feel like I'm being pulled away through time. Thanks for the help...")
end

function OneFinalMessageByYou(pUnit, event)
local CreaturesAllAround = PastYou:GetInRangeUnits()
	for k, Creatures in pairs (CreaturesAllAround) do
		Creatures:Despawn(1000, 0)
		PastYou:Despawn(6500, 0)
	end
end

function SayAfterCombatIsTriggered(pUnit, event)
local chance = math.random(1, 2)
	if(chance == 1) then
		PastYou:SendChatMessage(15, 0, "This equipment looks cool and all, but couldn't we have done a little better? Are you even raiding?")
		PastYou:RegisterEvent(Chance1_SecondMsg, 8000, 1)
	else
		PastYou:SendChatMessage(15, 0, "I just want you to know that if we get through this alive, I'm making sure that we turn out better than you. No offense.")
		PastYou:RegisterEvent(Chance2_SecondMsg, 10000, 1)
	end
end

function Chance1_SecondMsg(pUnit, event)
	PastYou:SendChatMessage(15, 0, "Wait a minute! If you're here, then that means that in the not-so-distant future I'm going to be you helping me? Are we stuck in a time loop?!")
	PastYou:RegisterEvent(Chance1_ThirdMsg, 10500, 1)
end

function Chance2_SecondMsg(pUnit, event)
	PastYou:SendChatMessage(15, 0, "Looks like I'm an underachiever.")
	PastYou:RegisterEvent(Chance2_ThirdMsg, 8000, 1)
end

function Chance1_ThirdMsg(pUnit, event)
	PastYou:SendChatMessage(15, 0, "Chromie said that if I don't do this just right, I might wink out of existence. If I go, then you go!")
end

function Chance2_ThirdMsg(pUnit, event)
	PastYou:SendChatMessage(15, 0, "I think I'm going to turn to drinking after this.")
end

function PastYou_OnLeaveCombat(pUnit, event)
	PastYou:Despawn(1000, 0)
end

RegisterUnitEvent(32331, 3, "PastYou_OnLeaveCombat")

function PastYou_OnDeath(pUnit, event)
	PastYou:Despawn(1000, 0)
end

RegisterUnitEvent(32331, 4, "PastYou_OnDeath")

function Magus_OnLeaveCombat(pUnit, event)
	Magus:Despawn(1000, 0)
end

RegisterUnitEvent(27898, 3, "Magus_OnLeaveCombat")

function Magus_OnDeath(pUnit, event)
	Magus:Despawn(1000, 0)
end

RegisterUnitEvent(27898, 4, "Magus_OnDeath")

function Eradicator_OnLeaveCombat(pUnit, event)
	Eradicator:Despawn(1000, 0)
end

RegisterUnitEvent(32185, 3, "Eradicator_OnLeaveCombat")

function Eradicator_OnDeath(pUnit, event)
	Eradicator:Despawn(1000, 0)
end

RegisterUnitEvent(32185, 4, "Eradicator_OnDeath")

function Render_OnLeaveCombat(pUnit, event)
	Render:Despawn(1000, 0)
end

RegisterUnitEvent(27900, 3, "Render_OnLeaveCombat")

function Render_OnDeath(pUnit, event)
	Render:Despawn(1000, 0)
end

RegisterUnitEvent(27900, 4, "Render_OnDeath")

function Breaker_OnLeaveCombat(pUnit, event)
	Render:Despawn(1000, 0)
end

RegisterUnitEvent(27900, 3, "Breaker_OnLeaveCombat")

function Breaker_OnDeath(pUnit, event)
	Render:Despawn(1000, 0)
end

RegisterUnitEvent(27900, 3, "Breaker_OnDeath")

function Destroyer_OnLeaveCombat(pUnit, event)
	Destroyer:Despawn(1000, 0)
end

RegisterUnitEvent(27897, 3, "Destroyer_OnLeaveCombat")

function Destroyer_OnDeath(pUnit, event)
	Destroyer:Despawn(1000, 0)
end

RegisterUnitEvent(27897, 3, "Destroyer_OnDeath")

function HourGlass_OnDeath(pUnit, event)
	HourGlass:Despawn(1, 0)
end

RegisterUnitEvent(32327, 4, "HourGlass_OnDeath")

function Nozdormu_OnSpawn(pUnit, event)
	Nozdormu = pUnit
	Nozdormu:SetFlying()
	Nozdormu:EnableMoveFly()
	Nozdormu:MoveTo(Nozdormu:GetX()+1, Nozdormu:GetY(), Nozdormu:GetZ(), Nozdormu:GetO())
end

RegisterUnitEvent(27925, 18, "Nozdormu_OnSpawn")