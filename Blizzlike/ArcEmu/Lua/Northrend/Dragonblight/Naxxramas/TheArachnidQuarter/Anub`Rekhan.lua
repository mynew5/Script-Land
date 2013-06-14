--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function anubrekhan_OnSpawn(pUnit, Event)
	pUnit:RegisterEvent("anubrekhan_OnSpawn_Go", 1000, 1)
end

function anubrekhan_OnSpawn_Go(pUnit, Event)
	if(anub ~= nil) then
		pUnit:RemoveFromWorld()
	end
	anub = pUnit
end

function anubrekhan_OnLeaveCombat(pUnit, Event)
	pUnit:RegisterEvent("Wipe_Check", 1000, 1)
end

function Wipe_Check(pUnit, Event)
	if(Players_Wiped == 1) then
		Players_Wiped = 0
		anub:SetHealthPct(10)
	else
		pUnit:RemoveEvents()
	end
end

function anubrekhan_OnCombat(pUnit, Event)
	anub=pUnit
	anub:SendChatMessage(14, 1, "Yes, run! It makes the blood pump faster!")
	anub:SetCombatCapable(0)
	anub:RegisterEvent("Impale", 15000, 1)
end


function Impale(pUnit, Event)
	if(anub:GetRandomPlayer(0)~=nil) then
		anub:ChannelSpell(28783, anub:GetRandomPlayer(0))
		pUnit:RegisterEvent("LocustSwarm", 10000, 1)
		pUnit:RegisterEvent("SpawnAdds", 60000, 1)
	end
end

function LocustSwarm(pUnit, Event)
	local plr = anub:GetRandomPlayer(0)
	local x = plr:GetX()
	local y = plr:GetY()
	local z = plr:GetZ()
	anub:CastSpellAoF(x, y, z,28785)
	anub:CastSpellOnTarget(54022)
	anub:RegisterEvent("Impale", 14000, 1)
end

function SpawnAdds(pUnit, Event)
	anub:SpawnCreature(16573, 3327.025635, -3475.478027, 287.076355, 3.156691, 14, 600000)
end

function anubrekhan_OnDeath(pUnit, Event)
	local door = pUnit:GetGameObjectNearestCoords(3143.83, -3572.39, 287.081, 181195)
	if(door ~= nil) then
		door:Activate()
	end
end

RegisterUnitEvent(40430, 4, "anubrekhan_OnDeath")
RegisterUnitEvent(40430, 1, "anubrekhan_OnCombat")
RegisterUnitEvent(40430, 18, "anubrekhan_OnSpawn")
RegisterUnitEvent(40430, 2, "anubrekhan_OnLeaveCombat")