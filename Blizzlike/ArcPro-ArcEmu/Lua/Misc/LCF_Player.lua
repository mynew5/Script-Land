--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Ascent, ArcEmu
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

local PLAYER = LCF.PlayerMethods
assert(PLAYER)

function PLAYER:GetStrength()
	return self:GetUInt32Value(LCF.UNIT_FIELD_STAT0)
end
function PLAYER:GetAgility()
	return self:GetUInt32Value(LCF.UNIT_FIELD_STAT1)
end
function PLAYER:GetStamina()
	return self:GetUInt32Value(LCF.UNIT_FIELD_STAT2)
end
function PLAYER:GetIntellect()
	return self:GetUInt32Value(LCF.UNIT_FIELD_STAT3)
end
function PLAYER:GetSpirit()
	return self:GetUInt32Value(LCF.UNIT_FIELD_STAT4)
end
function PLAYER:IsAlliance()
	return self:GetTeam() == 0
end
function PLAYER:IsHorde()
	return self:GetTeam() ~= 0
end 
function PLAYER:IsHeroic()
	local dung = self:GetDungeonDifficulty()
	if(self:IsInDungeon() ) then
		return dung == 1
	elseif(self:IsInRaid() ) then
		return (dung == 3 or dung == 4)
	end
	return false
end
function PLAYER:SpawnLocalCreature(crc_entry,faction,duration)
	local x,y,z,o = self:GetLocation()
	return self:SpawnCreature(crc_entry,x,y,z,o,faction,duration)
end
function PLAYER:SpawnLocalGameObject(go_entry,duration)
	local x,y,z,o = self:GetLocation()
	return self:SpawnGameObject(go_entry,x,y,z,o,duration)
end
function PLAYER:MoveToUnit(target)
	local x,y,z = target:GetLocation()
	self:MoveTo(x,y,z,self:GetO())
end
function PLAYER:RegisterLuaEvent(func,delay,repeats,...)
	self:CreateLuaEvent(LCF:CreateClosure(func,self,unpack(arg)),delay,repeats)
end
function PLAYER:RemoveLuaEvent(func)
	LCF:RemoveLuaEvent(tostring(self),func)
end
function PLAYER:IsCasting()
	return player:GetCurrentSpell() ~= nil
end
function PLAYER:GetLocalCreature(entry)
	local x,y,z = self:GetLocation()
	local crc = self:GetCreatureNearestCoords(x,y,z,entry)
	return crc
end
function PLAYER:GetLocalGameObject(entry)
	local x,y,z = self:GetLocation()
	local go = self:GetGameObjectNearestCoords(x,y,z,entry)
	return go
end