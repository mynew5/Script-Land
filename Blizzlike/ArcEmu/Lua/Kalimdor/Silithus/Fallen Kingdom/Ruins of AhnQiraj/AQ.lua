--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI, Project eXa, Ikillonyxia; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Anubisath Defender
function Defender_ExplodeTwo(pUnit, Event)
	pUnit:CastSpell(25699)
end

function Defender_Explode(pUnit, Event)
	if(pUnit:GetHealthPct() < 10) then
		pUnit:RemoveEvents()
		pUnit:FullCastSpell(25698)
		pUnit:StopMovement(7100)
		pUnit:RegisterEvent("Defender_ExplodeTwo", 7000, 1)
	end
end

function Defender_Enrage(pUnit, Event)
	if(pUnit:GetHealthPct() < 10) then
		pUnit:CastSpell(44779)
		pUnit:RemoveEvents()
	end
end

function Defender_Thunderclap(pUnit, Event)
	pUnit:CastSpell(2834)
	pUnit:RegisterEvent("Defender_Thunderclap2", math.random(45000,65000), 1)
end

function Defender_Thunderclap2(pUnit, Event)
	pUnit:CastSpell(2834)
	pUnit:RegisterEvent("Defender_Thunderclap", math.random(45000,65000), 1)
end

function Defender_ShadowStorm(pUnit, Event)
	pUnit:CastSpell(2148)
	pUnit:RegisterEvent("Defender_ShadowStorm2", math.random(45000,65000), 1)
end

function Defender_ShadowStorm2(pUnit, Event)
	pUnit:CastSpell(2148)
	pUnit:RegisterEvent("Defender_ShadowStorm", math.random(45000,65000), 1)
end

function Defender_Plague(pUnit, Event)
	pUnit:CastSpellOnTarget(22997, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Defender_Plague2", math.random(45000,65000), 1)
end

function Defender_Plague2(pUnit, Event)
	pUnit:CastSpellOnTarget(22997, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Defender_Plague", math.random(45000,65000), 1)
end

function Defender_OnCombat(pUnit, Event)
	GeneralTimer = math.random(45000, 65000)
	Flip1 = math.random(1,2)
	Flip2 = math.random(1,2)
	Flip3 = math.random(1,2)
	Flip4 = math.random(1,2)
	if(Flip1 == 1) then
		pUnit:RegisterEvent("Defender_Plague", GeneralTimer, 1)
	end
	if(Flip2 == 1) then
		pUnit:RegisterEvent("Defender_ShadowStorm", GeneralTimer, 1)
	else
		pUnit:RegisterEvent("Defender_Thunderclap", GeneralTimer, 1)
	end
	if(Flip3 == 1) then
		pUnit:RegisterEvent("Defender_Enrage", 1000, 0)
	else
		pUnit:RegisterEvent("Defender_Explode", 1000, 0)
	end
	if(Flip4 == 1) then
		pUnit:CastSpell(13022)
	else
		pUnit:CastSpell(19595)
	end
end

function Defender_OnLeaveCombat(pUnit)
	pUnit:RemoveEvents()
end

function Defender_OnDied(pUnit)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(15277, 1, "Defender_OnCombat")
RegisterUnitEvent(15277, 2, "Defender_OnLeaveCombat")
RegisterUnitEvent(15277, 4, "Defender_OnDied")

--Anubisath Sentinel
function Sentinel_OnCombat(Unit, Event)
local CoinFlip = math.random(1, 9)
	if(CoinFlip == 1) then
		Unit:CastSpell(28747)
		Mending = 1
	elseif(CoinFlip == 2) then
		Unit:CastSpell(21737)
		KnockAway = 1
	elseif(CoinFlip == 3) then
		Unit:CastSpell(25777)
		Thorns = 1
	elseif(CoinFlip == 4) then
		Unit:CastSpell(2834)
		ThunderClap = 1
	elseif(CoinFlip == 5) then
		Unit:CastSpell(13022)
		ReflectArcFire = 1
	elseif(CoinFlip == 6) then
		Unit:CastSpell(19595)
		ReflectShadFrost = 1
	elseif(CoinFlip == 7) then
		Unit:CastSpell(2148)
		ShadowStorm = 1
	elseif(CoinFlip == 8) then
		Unit:CastSpell(812)
		ManaBurn = 1
	elseif(CoinFlip == 9)then
		Unit:CastSpell(9347)
		MortalStrike = 1
	end
	Unit:RegisterEvent("DeathCheck", 1000, 0)
end

function DeathCheck(Unit, Event)
	if(Mending == 2) then
		Unit:CastSpell(28747)
		Mending = 1
		SetHp = Unit:GetHealth() + (Unit:GetMaxHealth() / 2)
		Unit:SetHealth(SetHp)
	elseif(KnockAway == 2) then
		Unit:CastSpell(21737)
		KnockAway = 1
		SetHp = Unit:GetHealth() + (Unit:GetMaxHealth() / 2)
		Unit:SetHealth(SetHp)
	elseif(Thorns == 2) then
		Unit:CastSpel(25777)
		Thorns = 1
		SetHp = Unit:GetHealth() + (Unit:GetMaxHealth() / 2)
		Unit:SetHealth(SetHp)
	elseif(ThunderClap == 2) then
		Unit:CastSpell(2834)
		ThunderClap = 1
		SetHp = Unit:GetHealth() + (Unit:GetMaxHealth() / 2)
		Unit:SetHealth(SetHp)
	elseif(ReflectArcFire == 2) then
		Unit:CastSpell(13022)
		ReflectArcFire = 1
		SetHp = Unit:GetHealth() + (Unit:GetMaxHealth() / 2)
		Unit:SetHealth(SetHp)
	elseif(ReflectShadFrost == 2) then
		Unit:CastSpell(19595)
		ReflectShadFrost = 1
		SetHp = Unit:GetHealth() + (Unit:GetMaxHealth() / 2)
		Unit:SetHealth(SetHp)
	elseif(ShadowStorm == 2) then
		Unit:CastSpell(2148)
		ShadowStorm = 1
		SetHp = Unit:GetHealth() + (Unit:GetMaxHealth() / 2)
		Unit:SetHealth(SetHp)
	elseif(ManaBurn == 2) then
		Unit:CastSpell(812)
		ManaBurn = 1
		SetHp = Unit:GetHealth() + (Unit:GetMaxHealth() / 2)
		Unit:SetHealth(SetHp)
	elseif(MortalStrike == 2) then
		Unit:CastSpell(9347)
		MortalStrike = 1
		SetHp = Unit:GetHealth() + (Unit:GetMaxHealth() / 2)
		Unit:SetHealth(SetHp)
	end
end

function Sentinel_OnDeath(Unit, Event)
	if(Mending == 1) then
		Mending = 2
	elseif(KnockAway == 1) then
		KnockAway = 2
	elseif(Thorns == 1) then
		Thorns = 2
	elseif(ThunderClap == 1) then
		ThunderClap = 2
	elseif(ReflectArcFire == 1) then
		ReflectArcFire = 2
	elseif(ReflectShadFrost == 1) then
		ReflectShadFrost = 2
	elseif(ShadowStorm == 1) then
		ShadowStorm = 2
	elseif(ManaBurn == 1) then
		ManaBurn = 2
	elseif(MortalStrike == 1) then
		MortalStrike = 2
	end
	Unit:RemoveEvents()
end

function Sentinel_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15264, 1, "Sentinel_OnCombat")
RegisterUnitEvent(15264, 2, "Sentinel_OnLeaveCombat")
RegisterUnitEvent(15264, 4, "Sentinel_OnDeath")

--Anubisath Warder
function Warder_Root(Unit, Event)
	Unit:CastSpell(20699)
	Unit:RegisterEvent("Warder_Root2", math.random(15000,30000), 1)
end

function Warder_Root2(Unit, Event)
	Unit:CastSpell(20699)
	Unit:RegisterEvent("Warder_Root", math.random(15000,30000), 1)
end

function Warder_Fear(Unit, Event)
	Unit:CastSpell(30584)
	Unit:RegisterEvent("Warder_Fear2", math.random(15000,30000), 1)
end

function Warder_Fear2(Unit, Event)
	Unit:CastSpell(30584)
	Unit:RegisterEvent("Warder_Fear", math.random(15000,30000), 1)
end

function Warder_Cloud(Unit, Event)
	Unit:FullCastSpell(26072)
	Unit:RegisterEvent("Warder_Cloud2", math.random(12000,25000), 1)
end

function Warder_Cloud2(Unit, Event)
	Unit:FullCastSpell(26072)
	Unit:RegisterEvent("Warder_Cloud", math.random(12000,25000), 1)
end

function Warder_Silence(Unit, Event)
	Unit:FullCastSpell(12528)
	Unit:RegisterEvent("Warder_Silence2", math.random(12000,25000), 1)
end

function Warder_Silence2(Unit, Event)
	Unit:FullCastSpell(12528)
	Unit:RegisterEvent("Warder_Silence", math.random(12000,25000), 1)
end

function Warder_Nova(Unit, Event)
	Unit:CastSpell(18432)
	Unit:RegisterEvent("Warder_Nova2", math.random(25000,45000), 1)
end

function Warder_Nova2(Unit, Event)
	Unit:CastSpell(18432)
	Unit:RegisterEvent("Warder_Nova", math.random(25000,45000), 1)
end

function Warder_OnCombat(Unit, Event)
local RootOrFear = math.random(1,2)
local DustOrSilence = math.random(1,2)
	if(RootOrFear == 1) then
		Unit:CastSpell(20699)
		Unit:RegisterEvent("Warder_Root", math.random(15000,30000), 1)
	else
		Unit:CastSpell(30584)
		Unit:RegisterEvent("Warder_Fear", math.random(15000,30000), 1)
	end
	if(DustOrSilence == 1) then
		Unit:FullCastSpell(26072)
		Unit:RegisterEvent("Warder_Cloud", math.random(12000,25000), 1)
	else
		Unit:FullCastSpell(12528)
		Unit:RegisterEvent("Warder_Silence", math.random(12000,25000), 1)
	end
	Unit:RegisterEvent("Warder_Nova", math.random(25000,45000), 1)
end

function Warder_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Warder_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15311, 1, "Warder_OnCombat")
RegisterUnitEvent(15311, 2, "Warder_OnLeaveCombat")
RegisterUnitEvent(15311, 4, "Warder_OnDied")

--Obsidian Nullifier=
function Nullifier_ShockBlast(pUnit, Event)
	if (pUnit:GetManaPct() > 99) then
		pUnit:CastSpell(26458)
		pUnit:SetMana(0)
	end
end

function Nullifier_Siphon(pUnit, Event)
	if(pUnit:GetManaPct() > 89) then
		pUnit:FullCastSpell(27287)
		pUnit:SetMana(pUnit:GetMana() + pUnit:GetMana())
	else
		pUnit:FullCastSpell(27287)
		pUnit:SetMana(pUnit:GetMana() + pUnit:GetMaxHealth() /(10))
	end
end

function Nullifier_OnCombat(Unit, Event) --There isnt a :SetManaPct() function.
	Unit:SetMana(0)
	Unit:SetMaxMana(50000)
	Unit:RegisterEvent("Nullifier_Siphon",2000,0)
	Unit:RegisterEvent("Nullifier_ShockBlast",1000,0)
end

function Nullifier_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Nullifier_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(15312, 1, "Nullifier_OnCombat")
RegisterUnitEvent(15312, 2, "Nullifier_OnLeaveCombat")
RegisterUnitEvent(15312, 4, "Nullifier_OnDied")

--Obsidian Eradicator
function Eradicator_Siphon(pUnit, Event)
	if(pUnit:GetManaPct() > 89) then
		pUnit:FullCastSpell(27287)
		pUnit:SetMana(pUnit:GetMana() + pUnit:GetMana())
	else
		pUnit:FullCastSpell(27287)
		pUnit:SetMana(pUnit:GetMana() + pUnit:GetMaxHealth() /(10))
	end
end

function Eradicator_ShockBlast(pUnit, Event)
	if(pUnit:GetManaPct() > 99) then
		pUnit:CastSpell(26458)
		pUnit:SetMana(0)
	end
end

function Eradicator_OnCombat(Unit, Event) --There isnt a :SetManaPct() function.
	Unit:SetMana(0)
	Unit:SetMaxMana(24000)
	Unit:RegisterEvent("Eradicator_Siphon",2000,0)
	Unit:RegisterEvent("Eradicator_ShockBlast",1000,0)
end

function Eradicator_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Eradicator_OnDied(Unit, Event)
	Unit:SpawnGameObject(181068, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 300000)
end

RegisterUnitEvent(15262,1,"Eradicator_OnCombat")
RegisterUnitEvent(15262,2,"Eradicator_OnLeaveCombat")
RegisterUnitEvent(15262,4,"Eradicator_OnDied")

--Qiraji Champion
function Champion_Cleave(pUnit, Event)
    pUnit:FullCastSpellOnTarget(31043, pUnit:GetMainTank())
end

function Champion_Fear(pUnit, Event)
    pUnit:FullCastSpell(19134)
end

function Champion_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("Champion_Cleave", 15000, 0)
    pUnit:RegisterEvent("Champion_Fear", 27000, 0)
end

function Champion_OnWipe(pUnit, Event)
    pUnit:RemoveEvents()
end

function Champion_OnDie(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15252, 4, "Champion_OnDie")
RegisterUnitEvent(15252, 2, "Champion_OnWipe")
RegisterUnitEvent(15252, 1, "Champion_OnEnterCombat")

--Qiraji Brainwasher
function Brainwasher_MindFlay(pUnit, Event)
    pUnit:FullCastSpellOnTarget(26044, pUnit:GetRandomPlayer(0))
end

function Brainwasher_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("Brainwasher_MindFlay", 32000, 0)
end

function Brainwasher_OnWipe(pUnit, Event)
    pUnit:RemoveEvents()
end

function Brainwasher_OnDie(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15247, 4, "Brainwasher_OnDie")
RegisterUnitEvent(15247, 2, "Brainwasher_OnWipe")
RegisterUnitEvent(15247, 1, "Brainwasher_OnEnterCombat")

--Qiraji Mindslayer
function Mindslayer_CleaveRepeat(pUnit, Event)
    pUnit:FullCastSpellOnTarget(31043, pUnit:GetMainTank())
    pUnit:RegisterEvent("Mindslayer_Cleave", math.random(15000,18000), 1)
end

function Mindslayer_Cleave(pUnit, Event)
    pUnit:FullCastSpellOnTarget(31043, pUnit:GetMainTank())
    pUnit:RegisterEvent("Mindslayer_CleaveRepeat", math.random(15000,18000), 1)
end

function Mindslayer_MindFlay(pUnit, Event)
    pUnit:FullCastSpellOnTarget(26044, pUnit:GetRandomPlayer(0))
end

function Mindslayer_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("Mindslayer_Cleave", math.random(15000,18000), 1)
    pUnit:RegisterEvent("Mindslayer_MindFlay", 32000, 0)
end

function Mindslayer_OnWipe(pUnit, Event)
    pUnit:RemoveEvents()
end

function Mindslayer_OnDie(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15246, 4, "Mindslayer_OnDie")
RegisterUnitEvent(15246, 2, "Mindslayer_OnWipe")
RegisterUnitEvent(15246, 1, "Mindslayer_OnEnterCombat")

--::BOSSESS:--

--Twin Emperors by Project eXa

--::Emperor Vek'nilash: Swings a big sword, immune to all magical damage (except holy)::--
--Uppercut(18072) - Knocks back a single random target in melee range. 
--Unbalancing Strike(26613) - Inflicts 350% weapon damage and leaves the target unbalanced, reducing their defense skill by 100 for 6 sec. 
--Mutate Bug - Mutates a bug every 10-15 sec or so making it grow to a gigantic size and attack the raid. 

--::Emperor Vek'lor: Caster, immune to all physical damage, has a mana bar.::--
--Shadow Bolt - Spams on his aggro target, hits for 3000-4000. Partially resistible. 
--Blizzard - Slows and damages everyone within its area of effect. 1500 damage/tick. 
--Arcane Burst - 4000-4950 arcane damage AoE counterattack whenever a player is within melee range.
--Explode Bug - Every 7-10 secs Emperor Vek'lor forces a nearby bug to explode, blowing it up

--::Both Emperors::-- 
--Heal Brother - Whenever the twins get within 60 yards of one another, they will spam heal each other.
--Twin Teleport - the two twins will switch places. The twins will be rooted for 2 seconds. There is a complete aggro wipe.
--Berserk(45078) - After 15 minutes, the Emperors will go berserk dramatically increasing damage and wiping the raid.
--Combined Health - The Emperors share health. Damage to one emperor hurts the other emperor as well.

--===SPELLS===--
--[[Emperor Vek'nilash yells: Oh so much pain...
Emperor Vek'nilash yells: The feast of souls begins now...
Emperor Vek'nilash yells: Vek'lor, I feel your pain!
Emperor Vek'nilash yells: Where are your manners, brother. Let us properly welcome our guests.
Emperor Vek'nilash yells: Your fate is sealed!

Emperor Vek'lor yells: Come, little ones.
Emperor Vek'lor yells: My brother, no!
Emperor Vek'lor yells: Only flesh and bone. Mortals are such easy prey...
Emperor Vek'lor yells: There will be pain...
Emperor Vek'lor yells: You will not escape death!]]--

function Brothers_Berserk(Unit, Event)
	Unit:CastSpell(45078)
end

function Veknilash_Uppercut(pUnit, Event)
	pUnit:CastSpellOnTarget(18072, pUnit:GetRandomPlayer(1))
end

function Veknilash_Unbalancing(pUnit, Event)
	pUnit:CastSpellOnTarget(26613, pUnit:GetMainTank())
end

function Veknilash_OnCombat(Unit, Event)
local Veknilash = Unit
	Unit:SetMaxHealth(2000000)
	NNewHp=2000000
	Veknilash:RegisterEvent("SharedHealth",1500,0)
	Veknilash:RegisterEvent("Brothers_Berserk",900000,0)
end

function Veklor_OnCombat(Unit, Event)
local Veklor = Unit
	Unit:SetMaxHealth(20000000)
	LNewHp=2000000
	Veklor:RegisterEvent("SharedHealth",1000,0)
	Veklor:RegisterEvent("Brothers_Berserk",900000,0)
end

function SharedHealth(Unit, Event)
	NilashHealth = Veknilash:GetHealth()
	LorHealth = Veklor:GetHealth()
	Veklor:SendChatMessage(11, 0, LorHealth)
	NDmgTaken = NNewHp - NilashHealth
	LDmgTaken = LNewHp - LorHealth
	Veklor:SendChatMessage(11,0,NDmgTaken)
	NNewHp = NilashHealth - LDmgTaken
	LNewHp = LorHealth - NDmgTaken
	Veklinash:SendChatMessage(11,0,NNewHp)
	Veknilash:SetHealth(NNewHp)
	Veklor:SetHealth(LNewHp)
end

RegisterUnitEvent(15275, 1, "Veknilash_OnCombat")
RegisterUnitEvent(15276, 1, "Veklor_OnCombat")