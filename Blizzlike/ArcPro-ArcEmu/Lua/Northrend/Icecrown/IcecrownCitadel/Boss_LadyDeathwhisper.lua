--[[Made by Domicroat of ac-web.org ]]

function Ladydeathwhisper_OnCombat (pUnit, Event)
	pUnit:SendChatMessage(14, 0, "What is this Disturbance!You dare trespass on this hallow ground!This shall be your final resting place!")
	pUnit:Root()
	pUnit:FullCastSpell(70842)
	pUnit:RegisterEvent("Ladydeathwhisper_Shadowbolt", 3000, 0)
	pUnit:RegisterEvent("Ladydeathwhisper_Deathdecay", 15000, 0)
	pUnit:RegisterEvent("Ladydeathwhisper_Adds", 60000, 0)
	pUnit:RegisterEvent("Ladydeathwhisper_Changeover", 1000, 0)
end

function Ladydeathwhisper_Shadowbolt (pUnit, Event)
	pUnit:FullCastSpellOnTarget(71254, pUnit:GetRandomPlayer(0))
end

function Ladydeathwhisper_Deathdecay(pUnit, Event)
	local plr = pUnit:GetRandomPlayer(0)
	local x,y,z = plr:GetX(),plr:GetY(),plr:GetZ()
	pUnit:CastSpellAoF(x,y,z, 71001)
end

function Ladydeathwhisper_Adds (pUnit, Event)
local Addsspawn = math.random (1, 2)
	if(Addsspawn == 1) then
		pUnit:SpawnCreature(37890,-578.671448,2159.502441,50.848782,o,14,80000)
		pUnit:SpawnCreature(37890,-619.650757,2156.278076,50.847198,o,14,80000)
		pUnit:SpawnCreature(37949,-598.325012,2157.934570,50.848740,o,14,80000)
		pUnit:SendChatMessage(42, 0, "Two Cult Fanatics and a Cult Adherent join the fight!")
	elseif(Addsspawn == 2) then
		pUnit:SpawnCreature(37949,-578.049744,2264.405518,50.848717,o,14,80000)
		pUnit:SpawnCreature(37890,-598.825073,2264.582764,50.848755,o,14,80000)
		pUnit:SpawnCreature(37949,-619.350220,2263.978516,50.848755,o,14,80000)
		pUnit:SendChatMessage(42, 0, "Two Cult Adherents and a Cult Fanatic join the fight!")
	end
end

function Ladydeathwhisper_Changeover(pUnit, Event)
	if(pUnit:GetHealthPct() < 5) then
		pUnit:SendChatMessage(42, 0, "The Mana Barrier fades!")
		pUnit:SendChatMessage(14, 0, "This charade has gone on long enough! I see I must take matters into my own hands!")
		pUnit:RemoveEvents()
		pUnit:RemoveAllAuras()
		pUnit:SetHealthPct(100)
		pUnit:SetMana(0)
		pUnit:Unroot()
		pUnit:RegisterEvent("Ladydeathwhisper_Deathdecay2", 10000, 0)
		pUnit:RegisterEvent("Ladydeathwhisper_Frostbolt", 15000, 0)
		pUnit:RegisterEvent("Ladydeathwhisper_Agrocurse", 25000, 0)
	end
end

function Ladydeathwhisper_Deathdecay2(pUnit, Event)
local plr = pUnit:GetRandomPlayer(0)
	local x,y,z = plr:GetX(),plr:GetY(),plr:GetZ()
	pUnit:CastSpellAoF(x,y,z,71001)
end

function Ladydeathwhisper_Frostbolt (pUnit, Event)
	pUnit:FullCastSpellOnTarget(71420,pUnit:GetMainTank())
end	

function Ladydeathwhisper_Agrocurse(pUnit, Event)
	pUnit:FullCastSpellOnTarget(71204,pUnit:GetMainTank())
end 

function Ladydeathwhisper_OnKillPlr (pUnit, Event)
local chance = math.random(1,2)
	if(chance == 1) then
		pUnit:SendChatMessage(14, 0, "Embrace the darkness! Darkness eternal !")
		pUnit:PlaySoundToSet(16942)
	else
		pUnit:SendChatMessage(14, 0, "Do you yet grasp the futility of your actions!")
	end
end

function Ladydeathwhisper_OnDeath (pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:RemoveAllAuras()
	pUnit:SendChatMessage(14, 0, "All part of the masters plan...your end will come soon...")
end

function Ladydeathwhisper_OnLeaveCombat (pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:RemoveAllAuras()
	pUnit:SetMana(3346800)
end

RegisterUnitEvent(36855, 1, "Ladydeathwhisper_OnCombat")
RegisterUnitEvent(36855, 2, "Ladydeathwhisper_OnLeaveCombat")
RegisterUnitEvent(36855, 3, "Ladydeathwhisper_OnKillPlr")
RegisterUnitEvent(36855, 4, "Ladydeathwhisper_OnDeath")