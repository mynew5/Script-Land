--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DragonDev; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local BOSSID = 10184
local Args = {} 
local Phase1 = {} 
local Phase2 = {}
local Phase3 = {} 

Args.Chat = { a1 = 13, 0, "How fortuitous, useally I must leave my lair to feed!", 
k1 = 13, 0, "Learn your place mortal",}

Args.Spell = { FB = 68970, CL = 68868, 
WB = 18500, TS = 68867, 
F = 18392, BR = 18431, 
EU = 17731, }

Args.Chords = { m1 = -86.190872, -215.007156, -82.450699,
s1 = -30.812, -166.395, -89.000, 5.160,
s2 = -30.233, -264.158, 89.896, 1.129,
s3 = -35.813, -169.427, -90.000, 5.384,
s4 = -30.812, -166.395, -89.000, 5.160,
s5 = -30.233, -264.158, 89.896, 1.129,
s6 = -35.813, -169.427, -90.000, 5.384, 
s7 = -30.812, -166.395, -89.000, 5.160, 
s8 = -30.233, -264.158, 89.896, 1.129,
s9 = -35.813, -169.427, -90.000, 5.384,
s10 = -36.104, -260.961, -90.600, 1.111, 
s11 = -34.643, -164.080, -90.000, 5.364, 
s12 = -35.377, -267.320, -91.000, 1.111, 
s14 = -36.104, -260.961, -90.600, 1.111,
s15 = -34.643, -164.080, -90.000, 5.364, 
s16 = -35.377, -267.320, -91.000, 1.111,
s17 = -36.104, -260.961, -90.600, 1.111,
s18 = -34.643, -164.080, -90.000, 5.364,
s19 = -35.377, -267.320, -91.000, 1.111,}

Layer = {} 
Layer.Ony = {}
Layer.Ony.Spell = {}  

function Layer.Ony.Combat(Unit, Event)
	if(Layer[Unit:GetInstanceID() ].Onyisdead == true) then 
		Unit:Despawn(10, 0) 
		return;
	elseif(Layer[Unit:GetInstanceID() ].Onyisdead == false and Layer[Unit:GetInstanceID() ] == true) then 
		Unit:RegisterEvent("Layer.Ony.Phase1", 1000, 0)
	end
end 

function Layer.Ony.Phase1(Unit, Event) 
	Unit:SendChatMessage(Args.Chat.a1)
	Unit:RemoveEvents()
	Unit:RegisterEvent("Layer.Ony.Spell.FB", 30000, 0)
	Unit:RegisterEvent("Layer.Ony.Spell.CL", 18000, 0)
	Unit:RegisterEvent("Layer.Ony.Spell.WB", 60000, 0)
	Unit:RegisterEvent("Layer.Ony.Spell.TS", 45000, 0) 
	Unit:RegisterEvent("Layer.Ony.Phase2", 1000, 0)
end

function Layer.Ony.Phase2(Unit, Event) 
	if(Unit:GetHealthPct() <= 65) then 
		Unit:RemoveEvents() 
		Unit:RegisterEvent("Layer.Ony.Pre_Fly", 3000, 1) 
		Unit:RegisterEvent("Layer.Ony.Spell.F", 8000, 0)
		Unit:RegisterEvent("Layer.Ony.Spawn_Whelp", 12000, 1)
		Unit:RegisterEvent("Layer.Ony.Spawn_Guard", 35000, 0) 
		Unit:RegisterEvent("Layer.Ony.Phase3", 1000, 0)
	end
end

function Layer.Ony.Phase3(Unit, Event) 
	if(Unit:GetHealthPct() <= 35) then
		Unit:MoveTo(Unit:GetLocation()-5) 
		Unit:Land() 
		Unit:RemoveEvents()
		Unit:RegisterEvent("Layer.Ony.Spell.FB", 30000, 0)
		Unit:RegisterEvent("Layer.Ony.Spell.CL", 18000, 0)
		Unit:RegisterEvent("Layer.Ony.Spell.WB", 60000, 0)
		Unit:RegisterEvent("Layer.Ony.Spell.TS", 45000, 0)
		Unit:RegisterEvent("Layer.Ony.Spell.BR", 25000, 0) 
		Unit:RegisterEvent("Layer.Ony.Spell.EU", 20000, 0) 
	end
end

function Layer.Ony.Spell.EU(Unit, Event) 
	Unit:CastSpell(Args.Spell.EU) 
end

function Layer.Ony.Spell.BR(Unit, Event)
	Unit:CastSpell(Args.Spell.BR) 
end

function Layer.Ony.Spawn_Guard(Unit, Event)
	Unit:SpawnCreature(36561, Unit:GetRandomPlayer(0):GetLocation(), 14, 0)
	Unit:SpawnCreature(36561, Unit:GetRandomPlayer(0):GetLocation(), 14, 0)
end

function Layer.Ony.Spawn_Whelp(Unit, Event) 
	Unit:SpawnCreature(11262, Args.Chords.s1, 14, 0) 
	Unit:SpawnCreature(11262, Args.Chords.s2, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s3, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s4, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s5, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s6, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s7, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s8, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s9, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s10, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s11, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s12, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s14, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s15, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s16, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s17, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s18, 14, 0)
	Unit:SpawnCreature(11262, Args.Chords.s19, 14, 0)
	Unit:RegisterEvent("Layer.Ony.Spawn_Whelp", 90000, 0)
end

function Layer.Ony.Spell.F(Unit, Event) 
	Unit:FullCastSpellOnTarget(Args.Spell.F, Unit:GetRandomPlayer(0))
end

function Layer.Ony.Pre_Fly(Unit, Event) 
	Unit:SetCombatCapable(false) 
	Unit:RemoveAllAuras() 
	Unit:MoveTo(Args.Chords.m1) 
	Unit:RegisterEvent("Layer.Ony.Fly_Vis", 16000, 1) 
end

function Layer.Ony.Fly_Vis(Unit, Event) 
	Unit:SetFlying() 
	Unit:RegisterEvent("Layer.Ony.Fly", 3000, 1) 
end

function Layer.Ony.Fly(Unit, Event)
	Unit:MoveTo(Unit:GetLocation()+5)
end

function Layer.Ony.Spell.TS(Unit, Event) 
	Unit:FullCastSpellOnTarget(Args.Spell.TS, Unit:GetClosestPlayer())
end

function Layer.Ony.Spell.WB(Unit, Event) 
	Unit:FullCastSpellOnTarget(Args.Spell.WB, Unit:GetMainTank()) 
end

function Layer.Ony.Spell.CL(Unit, Event) 
	Unit:FullCastSpellOnTarget(Args.Spell.CL, Unit:GetClosestPlayer()) 
end

function Layer.Ony.Spell.FB(Unit, Event) 
	Untit:CastSpell(Args.Spell.FB) 
end

RegisterUnitEvent(BOSSID, 1, "Layer.Ony.Combat")

function Layer.Ony.KilledTarget(Unit, Event) 
	Unit:SendChatMessage(Args.Chat.k1) 
end

RegisterUnitEvent(BOSSID, 3, "Layer.Ony.KilledTarget") 

function Layer.Ony.Death(Unit, Event)
	Unit:RemoveEvents()
	Layer[Unit:GetInstanceID()] = {} 
	Layer[Unit:GetInstanceID()].Onyisdead = true
end

RegisterUnitEvent(BOSSID, 4, "Layer.Ony.Death")

Whelp = {} 
function Whelp.Define(Unit, Event)
	Unit:RegisterEvent("Whelp.Move", 1000, 1)
end

RegisterUnitEvent(11262, 18, "Whelp.Define") 

function Whelp.Move(Unit, Event)
	Unit:MoveTo(Unit:GetClosestPlayer():GetLocation()) 
end