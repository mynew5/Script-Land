--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[Shade of Aran yells: At last the nightmare is over...
Shade of Aran yells: Back to the cold dark with you!
Shade of Aran yells: Burn, you hellish fiends!
Shade of Aran yells: I am not some simple jester! I am Nielas Aran!
Shade of Aran yells: I want this nightmare to be over!
Shade of Aran yells: I'll freeze you all!
Shade of Aran yells: I'll not be tortured again!
Shade of Aran yells: I'll show you: this beaten dog still has some teeth!
Shade of Aran yells: Please, no more! My son... he's gone mad!
Shade of Aran yells: Torment me no more!
Shade of Aran yells: Who are you? What do you want? Stay away from me!
Shade of Aran yells: Yes, yes my son is quite powerful... but I have powers of my own!
Shade of Aran says: I'm not finished yet! No, I have a few more tricks up my sleeve...]]

function Aran_Water_Elementals(Unit, event, miscUnit, misc)
	if((Unit:GetHealthPct() < 40) and (Didthat == 0)) then
		Unit:SpawnCreature(21160, -11167.2, -1914.13, 232.009, 0, 18, 96000000);
		Unit:SpawnCreature(21160, -11163.2, -1910.13, 232.009, 0, 18, 96000000);
		Unit:SpawnCreature(21160, -11165.2, -1916.13, 232.009, 0, 18, 96000000);
		Unit:SpawnCreature(21160, -11162.2, -1911.13, 232.009, 0, 18, 96000000);
		Didthat = 1
	else
	end
end

function Aran_Polymorph(Unit, event, miscUnit, misc)
	if((Unit:GetManaPct() < 20) and (Didthat == 1)) then
		Unit:FullCastSpellOnTarget(23603,Unit:GetClosestPlayer())
		Unit:FullCastSpell(32453)
		Didthat = 2
	else
	end
end

function Aran_Fireball(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(20678, Unit:GetClosestPlayer())
end

function Aran_Conterspell(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29961, Unit:GetClosestPlayer())
end

function Aran_Conflagration(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(23023, Unit:GetClosestPlayer())
end

function Aran_FrostBolt(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(41486, Unit:GetClosestPlayer())
end

function Aran_Chains_Ice(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29991, Unit:GetClosestPlayer())
end

function Aran_Arcane_Missiles(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29955, Unit:GetClosestPlayer())
end

function Aran_Flame_Wreath(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30004, Unit:GetRandomPlayer())
end

function Aran_Circular_Blizzard(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29952, Unit:GetClosestPlayer())
end

function Aran_Magnetic_Pull(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29979, Unit:GetClosestPlayer())
end

function Aran_Arcane_Explosion(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29973, Unit:GetClosestPlayer())
end

function Aran(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Aran_Water_Elementals", 1000, 1)
	Unit:RegisterEvent("Aran_Polymorph", 1000, 1)
	Unit:RegisterEvent("Aran_Fireball", 9000, 0)
	Unit:RegisterEvent("Aran_Conterspell", 13000, 0)
	Unit:RegisterEvent("Aran_Conflagration", 15000, 0)
	Unit:RegisterEvent("Aran_FrostBolt", 17000, 0)
	Unit:RegisterEvent("Aran_Chains_Ice", 20000, 0)
	Unit:RegisterEvent("Aran_Arcane_Missiles", 25000, 0)
	Unit:RegisterEvent("Aran_Flame_Wreath", 30000, 0)
	Unit:RegisterEvent("Aran_Circular_Blizzard", 60000, 0)
	Unit:RegisterEvent("Aran_Magnetic_Pull", 90000, 0)
	Unit:RegisterEvent("Aran_Arcane_Explosion", 91000, 0)
end

function Aran_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Aran_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(16524, 2, "Aran_OnLeaveCombat")
RegisterUnitEvent(16524, 4, "Aran_OnDeath")
RegisterUnitEvent(16524, 1, "Aran")