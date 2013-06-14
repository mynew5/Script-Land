--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: LUA++; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BGeddon_OnCombat(Unit,event)
	Unit:CastSpell(19659)
	Unit:RegisterEvent("BGeddon_Inferno", math.random(30000,45000), 0)
	Unit:RegisterEvent("BGeddon_IgniteMana", math.random(22000,35000), 0)
	Unit:RegisterEvent("BGeddon_LivingBomb", math.random(46000,50000), 0)
	Unit:RegisterEvent("BGeddon_Amargeddon", 1000, 0)
end

function BGeddon_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

function BGeddon_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function BGeddon_Inferno(Unit)
	Unit:FullCastSpell(19695)
end

function BGeddon_IgniteMana(Unit)
	Unit:CastSpell(19659)
end

function BGeddon_LivingBombBoom(Unit,event)
	local args=getvars(Unit)
	if(args.livingbombtarget:HasAura(20475) == true) then
		Unit:SpawnCreature(70100, args.livingbombtarget:GetX(), args.livingbombtarget:GetY(), args.livingbombtarget:GetZ(), 90, 14, 0)
		args.livingbombtarget:Unroot()
	end
end

function BGeddon_LivingBomb(Unit)
	setvars(Unit, {livingbombtarget = Unit:GetRandomPlayer(0)})
	local args=getvars(Unit)
	if(args.livingbombtarget ~= nil) then
		Unit:FullCastSpellOnTarget(20475, args.livingbombtarget)
		args.livingbombtarget:Root()
		Unit:RegisterEvent("BGeddon_LivingBombBoom", 7900, 1)
	end
end

function BGeddon_Amargeddon(Unit,event)
	if(Unit:GetHealthPct() == 2) then
		Unit:StopMovement(8000)
		Unit:FullCastSpell(20478)
	end
end

function LivingBomb(Unit, Event)
	Unit:DisableRespawn(1)
	Unit:CastSpell(20476)
	Unit:Despawn(100, 0)
end

RegisterUnitEvent(70100, 18, "LivingBomb")
RegisterUnitEvent(12056, 1, "BGeddon_OnCombat")
RegisterUnitEvent(12056, 2, "BGeddon_OnWipe")
RegisterUnitEvent(12056, 4, "BGeddon_OnDied")