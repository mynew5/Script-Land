--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Gurubashi Axe Thrower
function AxeThrower_Throw(pUnit, Event)
	pUnit:FullCastSpellOnTarget(22887, pUnit:GetRandomPlayer(0))
end

function AxeThrower_AxeFlurry(pUnit, Event)
	pUnit:FullCastSpell(24018)
	pUnit:RegisterEvent("AxeThrower_AxeFlurry", math.random(14000, 20000), 1)
	pUnit:RegisterEvent("AxeThrower_Throw", 2000, 4)
end

function AxeThrower_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("AxeThrower_AxeFlurry", math.random(14000, 20000), 1)
end

RegisterUnitEvent(11350, 1, "AxeThrower_OnEnterCombat")

function AxeThrower_OnWipe(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(11350, 2, "AxeThrower_OnWipe")

--Gurubashi Bat Rider
function BatRider_Bite(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16128, pUnit:GetMainTank())
	pUnit:RegisterEvent("BatRider_Bite", math.random(13000, 20000), 1)
end

function BatRider_Explode(pUnit, Event)
	if pUnit:GetHealthPct() <= 40 then
		pUnit:CastSpell(24024)
		pUnit:Kill(pUnit)
		pUnit:RemoveEvents()
    end
end

function BatRider_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("BatRider_Bite", math.random(13000, 20000), 1)
	pUnit:RegisterEvent("BatRider_Explode", 1000, 0)
end

RegisterUnitEvent(14750, 1, "BatRider_OnEnterCombat")

function BatRider_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(14750, 2, "BatRider_OnWipe")

--Gurubashi Berserker
function Berserker_Enrage(pUnit, Event)
	if((pUnit:GetHealthPct() <= 50) and (enrage == nil)) then
		enrage=1;
		pUnit:CastSpell(8269)
    end
end

function Berserker_Thunderclap(pUnit, Event)
	pUnit:FullCastSpell(15588)
end

function Berserker_KnockAway(pUnit, Event)
    local maintank=pUnit:GetMainTank();
	pUnit:FullCastSpellOnTarget(11130, maintank)
    local threatcalc=pUnit:GetThreat(maintank) / (4);
    local playerthreat=threatcalc * (3);
    pUnit:ModThreat(maintank, playerthreat)
end

function Berserker_Fear(pUnit, Event)
    local tbl = pUnit:GetInRangePlayers()
    for k,v in pairs(tbl) do
		if pUnit:GetDistance(v) <= 10 then
			pUnit:FullCastSpell(30584)
			pUnit:ModThreat(v, 0)
			pUnit:ModThreat(pUnit:GetRandomPlayer(0), 100)
		end
    end
end

function Berserker_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Berserker_Enrage", 2000, 0)
	pUnit:RegisterEvent("Berserker_Thunderclap", 17000, 0)
	pUnit:RegisterEvent("Berserker_KnockAway", 21000, 0)
	pUnit:RegisterEvent("Berserker_Fear", 24000, 0)
end

RegisterUnitEvent(11352, 1, "Berserker_OnEnterCombat")

function Berserker_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11352, 2, "Berserker_OnWipe")

--Gurubashi Blooddrinker
function Blooddrinker_BloodLeech(pUnit, Event)
	pUnit:FullCastSpell(24437)
	pUnit:RegisterEvent("Blooddrinker_BloodLeech", math.random(16000, 19000), 1)
end

function Blooddrinker_DrainLife(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24435, pUnit:GetRandomPlayer(0))
end

function Blooddrinker_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Blooddrinker_BloodLeech", math.random(16000, 19000), 1)
	pUnit:RegisterEvent("Blooddrinker_DrainLife", 25000, 0)
end

RegisterUnitEvent(11353, 1, "Blooddrinker_BloodLeech")

--Gurubashi Headhunter
function Headhunter_Impale(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24049, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Headhunter_Impale", math.random(14000,17000), 1)
end

function Headhunter_MortalStrike(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15708, pUnit:GetMainTank())
	pUnit:RegisterEvent("Headhunter_MortalStrike", math.random(18000,22000), 1)
end

function Headhunter_WhirlingTrip(pUnit, Event)
	pUnit:FullCastSpell(24048)
	pUnit:RegisterEvent("Headhunter_WhirlingTrip", math.random(9000,14000), 1)
end

function Headhunter_OnEnterCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "My weapon be thirsty!")
	pUnit:RegisterEvent("Headhunter_Impale", math.random(14000,17000), 1)
	pUnit:RegisterEvent("Headhunter_MortalStrike", math.random(18000,22000), 1)
	pUnit:RegisterEvent("Headhunter_WhirlingTrip", math.random(9000,14000), 1)
end

RegisterUnitEvent(11351, 1, "Headhunter_OnEnterCombat")

function Headhunter_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11351, 2, "Headhunter_OnWipe")

--Hakkari Blood Priest

function BloodPriest_DrainLife(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24618, pUnit:GetRandomPlayer(0))
end

function BloodPriest_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("BloodPriest_DrainLife", 17000, 0)
end

RegisterUnitEvent(11340, 1, "BloodPriest_OnEnterCombat")

function BloodPriest_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11340, 2,  "BloodPriest_OnWipe")

--Hakkari Priest
function HakkariPriest_Heal(pUnit, Event)
    local tbl=pUnit:GetInRangeFriends();
    for k,v in pairs(tbl) do
		mobs={}
		table.insert(mobs, v)
		local mob=math.random(1, table.getn(mobs))
		pUnit:FullCastSpellOnTarget(22883, mobs[mob])
    end
end

function HakkariPriest_AntiMagicShield(pUnit, Event)
	pUnit:CastSpell(24021)
end

function HakkariPriest_Fear(pUnit, Event)
	pUnit:FullCastSpell(13704)
end

function HakkariPriest_OnEnterCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Your skull gonna decorate our ritual altars!")
	pUnit:RegisterEvent("HakkariPriest_Heal", 7000, 0)
	pUnit:RegisterEvent("HakkariPriest_AntiMagicShield", 18000, 0)
	pUnit:RegisterEvent("HakkariPriest_Fear", 22000, 0)
end

RegisterUnitEvent(11830, 1, "HakkariPriest_OnEnterCombat")

function HakkariPriest_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11830, 2, "HakkariPriest_OnWipe")

--Hakkari Shadowcaster
function Shadowcaster_ShadowBolt(pUnit, Event)
	if(math.random(1, 2) == 1) then
		pUnit:FullCastSpellOnTarget(15232, pUnit:GetRandomPlayer(0))
    else
		pUnit:FullCastSpell(20741)
    end
end

function Shadowcaster_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Shadowcaster_ShadowBolt", math.random(6000, 10000), 0)
end

RegisterUnitEvent(11338, 1, "Shadowcaster_OnEnterCombat")

function Shadowcaster_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11338, 2, "Shadowcaster_OnWipe")

--Hakkari Witch Doctor
function WitchDoctor_Hex(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24053, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("WitchDoctor_Hex", math.random(14000, 18000), 1)
end

function WitchDoctor_ShadowShock(pUnit, Event)
	pUnit:FullCastSpellOnTarget(17289, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("WitchDoctor_ShadowShock", math.random(10000, 13000), 1)
end

function WitchDoctor_Shrink(pUnit, Event)
	pUnit:FullCastSpell(24054)
end

function WitchDoctor_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("WitchDoctor_Hex", math.random(14000, 18000), 1)
	pUnit:RegisterEvent("WitchDoctor_ShadowShock", math.random(10000, 13000), 1)
	pUnit:RegisterEvent("WitchDoctor_Shrink", 21000, 0)
end

RegisterUnitEvent(11831, 1, "WitchDoctor_OnEnterCombat")

function WitchDoctor_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11831, 2, "WitchDoctor_OnWipe")

--Razzashi Adder
function Adder_VenomSpit(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24011, pUnit:GetMainTank())
	pUnit:RegisterEvent("Adder_VenomSpit", math.random(16000, 20000), 1)
end

function Adder_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Adder_VenomSpit", math.random(16000, 20000), 1)
end

RegisterUnitEvent(11372, 1, "Adder_OnEnterCombat")

function Adder_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11372, 2, "Adder_OnWipe")

--Razzashi Cobra
function Cobra_Poison(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24097, pUnit:GetMainTank())
	pUnit:RegisterEvent("Cobra_Poison", math.random(8000, 12000), 1)
end

function Cobra_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Cobra_Poison", math.random(8000, 12000), 1)
end

RegisterUnitEvent(11373, 1, "Cobra_OnEnterCombat")

function Cobra_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11373, 2, "Cobra_OnWipe")

--Mad Servant
function MadServant_Fireball(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24611, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("MadServant_Fireball", math.random(9000, 12000), 1)
end

function MadServant_Flamestrike(pUnit, Event)
    local player=pUnit:GetRandomPlayer(0);
	pUnit:CastSpellAoF(24612, player:GetX(), player:GetY(), player:GetZ())
	pUnit:RegisterEvent("MadServant_Flamestrike", math.random(14000, 16000), 1)
end

function MadServant_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("MadServant_Fireball", math.random(9000, 12000), 1)
	pUnit:RegisterEvent("MadServant_Flamestrike", math.random(14000, 16000), 1)
end

RegisterUnitEvent(15111, 1, "MadServant_OnEnterCombat")

function MadServant_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(15111, 2, "MadServant_OnWipe")

--Voodo Slave
function Slave_LightningBlast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(43996, pUnit:GetMainTank())
	pUnit:RegisterEvent("Slave_LightningBlast", math.random(6000, 8000), 1)
end

function Slave_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Slave_LightningBlast", math.random(6000, 8000), 1)
end

RegisterUnitEvent(14883, 1, "Slave_OnEnterCombat")

function Slave_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(14883, 2, "Slave_OnWipe")

--Soulflayer
function Soulflayer_SoulTap(pUnit, Event)
	pUnit:FullCastSpellOnTarget(24619, pUnit:GetRandomPlayer(7))
	pUnit:RegisterEvent("Soulflayer_SoulTap", math.random(18000, 22000), 1)
end

function Soulflayer_Fear(pUnit, Event)
	pUnit:FullCastSpellOnTarget(22678, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Soulflayer_Fear", math.random(12000, 15000), 1)
end

function Soulflayer_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("Soulflayer_SoulTap", math.random(18000, 22000), 1)
	pUnit:RegisterEvent("Soulflayer_Fear", math.random(12000, 15000), 1)
end

RegisterUnitEvent(11359, 1, "Soulflayer_OnEnterCombat")

function Soulflayer_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11359, 2, "Soulflayer_OnWipe")

--Son of Hakkar
function SonOfHakkar_Knockdown(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16790, pUnit:GetMainTank())
	pUnit:RegisterEvent("SonOfHakkar_Knockdown", math.random(8000, 10000), 1)
end

function SonOfHakkar_OnEnterCombat(pUnit, Event)
	pUnit:RegisterEvent("SonOfHakkar_Knockdown", math.random(8000, 10000), 1)
end

RegisterUnitEvent(11357, 1, "SonOfHakkar_OnEnterCombat")

function SonOfHakkar_OnWipe(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(11357, 2, "SonOfHakkar_OnWipe")

function SonOfHakkar_OnDie(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:CastSpell(24321)
end

RegisterUnitEvent(11357, 4, "SonOfHakkar_OnDie")