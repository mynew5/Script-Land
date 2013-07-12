--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local mod = getfenv(1)
local self = getfenv(1)
WorldDBQuery("DELETE FROM ai_agents WHERE `entry` = \"18341\";")

function OnCombat(Unit, Event, _, mAggro)
	self[tostring(Unit)] = {
		void_blast = math.random(5,10),
		dark_shell = math.random(20,25),
		isHeroic = (mAggro:IsPlayer() and mAggro:IsHeroic() )
	}
	for _,v in pairs(Unit:GetInRangeFriends()) do
		if((v:GetDistanceYards(Unit) < 50) and (string.find(v:GetName(), "Ethereal") ~= nil)) then
			v:AttackReaction(mAggro, 1, 0)
		end
	end
	local say_text = math.random(1,3)
	if(say_text == 1) then
		Unit:PlaySoundToSet(10561)
		Unit:SendChatMessage(14, 0, "I will feed on your soul.")
	elseif(say_text == 2) then
		Unit:PlaySoundToSet(10562)
		Unit:SendChatMessage(14, 0, "So... full of life!")
	else
		Unit:PlaySoundToSet(10563)
		Unit:SendChatMessage(14, 0, "Do not... resist.")
	end
	Unit:RegisterAIUpdateEvent(1000)
end

function OnWipe(Unit, Event)
	Unit:RemoveAIUpdateEvent()
	self[tostring(Unit)] = nil
end

function OnTargetKill(Unit, Event)
	local say_text = math.random(1,2)
	if(say_text) then
		Unit:SendChatMessage(14, 0, "Yes! I am... empowered!")
		Unit:PlaySoundToSet(10564)
	else
		Unit:SendChatMessage(14, 0, "More... I must have more!")
		Unit:PlaySoundToSet(10565)
	end
end

function OnDeath(Unit, Event)
	Unit:SendChatMessage(14, 0, "To the void... once... more..")
	Unit:PlaySoundToSet(10566)
end

function AIUpdate(Unit, Event)
	if(Unit:IsCasting() ) then
		return
	end
	if( Unit:GetNextTarget() == nil) then
		Unit:WipeThreatList()
	end
	local ref = self[tostring(Unit)]
	ref.void_blast = ref.void_blast -1
	ref.dark_shell = ref.dark_shell - 1
	if(ref.dark_shell <= 0) then
		Unit:SendChatMessage(16, 0, Unit:GetName().." casts dark shell!")
		if(ref.isHeroic) then
			Unit:FullCastSpell(38759)
		else
			Unit:FullCastSpell(32358)
		end
		ref.dark_shell = math.random(20,30)+11
	elseif(ref.void_blast <= 0) then
		for i = 1,5 do
			Unit:RegisterLuaEvent(VoidBlast_Protocol, i*1000, 1)
		end
		ref.void_blast = math.random(10,20)
		ref.dark_shell = ref.dark_shell+5
	end
end

function VoidBlast_Protocol(Unit, Event)
	if(self[tostring(Unit)].isHeroic) then
		Unit:FullCastSpellOnTarget(38760, Unit:GetRandomEnemy())
	else
		Unit:FullCastSpellOnTarget(32325, Unit:GetRandomEnemy())
	end
end

RegisterUnitEvent(18341, 1, "OnCombat")
RegisterUnitEvent(18341, 2, "OnWipe")
RegisterUnitEvent(18341, 3, "OnTargetKill")
RegisterUnitEvent(18341, 4, "OnDeath")
RegisterUnitEvent(18341, 21, "AIUpdate")