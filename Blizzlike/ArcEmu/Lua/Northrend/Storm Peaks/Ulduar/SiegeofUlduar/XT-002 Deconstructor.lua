--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function decon_OnCombat3(pUnit, Event)
	if(pUnit:GetHealthPct() <= 25) then
		pUnit:RegisterEvent("decon_Phase2b", 1000, 0)
	else
		pUnit:RegisterEvent("decon_GBomb", 25000, 0)
		pUnit:RegisterEvent("decon_SLight", 35000, 0)
		pUnit:RegisterEvent("decon_Buffchk", 60000, 0)
		pUnit:RegisterEvent("decon_TTantrum", 300000, 0)
	end
end

function decon_OnCombat3(pUnit, Event)
	if(pUnit:GetHealthPct() <= 10) then
		pUnit:RegisterEvent("decon_Phase3", 1000, 0)
	else
		pUnit:RegisterEvent("decon_GBomb", 25000, 0)
		pUnit:RegisterEvent("decon_SLight", 35000, 0)
		pUnit:RegisterEvent("decon_Buffchk", 60000, 0)
		pUnit:RegisterEvent("decon_TTantrum", 300000, 0)
	end
end

function decon_LeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function decon_PlayerDeath(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "I... I think I broke it.")
	pUnit:PlaySoundToSet(15728)
end

function decon_Death(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(33293, 1, "decon_OnCombat3")
RegisterUnitEvent(33293, 2, "decon_LeaveCombat")
RegisterUnitEvent(33293, 3, "decon_PlayerDeath")
RegisterUnitEvent(33293, 4, "decon_Death")

function decon_GBomb(pUnit, Event)
	pUnit:SendChatMessage(42, 0, "XT-002 Deconstructor Casts Gravity Bomb")
	pUnit:CastSpellOnTarget(63024, pUnit:GetRandomPlayer(0))
end

function decon_SLight(pUnit, Event)
	pUnit:SendChatMessage(42, 0, "XT-002 Deconstructor Casts Searing Light")
	pUnit:CastSpellOnTarget(63018, pUnit:GetRandomPlayer(0))
end

function decon_TTantrum(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "NO! NO! NO! NO! NO!")
	decon:PlaySoundToSet(15727)
	pUnit:SendChatMessage(42, 0, "XT-002 Deconstructor Casts Tympanic Tantrum")
	pUnit:CastSpellOnTarget(62776, pUnit:GetRandomPlayer(0))
end

function decon_Hrtbreak(pUnit, Event)
	pUnit:CastSpell(65737)
end

function decon_Buffchk(pUnit, Event)
	pUnit:RemoveAura(65737)
end

function decon_Phase2(pUnit, Event)
	pUnit:SendChatMessage(42, 0, "Heart of Deconstructor arises!")
	pUnit:SendChatMessage(14, 0, "So tired. I will rest for just a moment!")
	pUnit:PlaySoundToSet(15725)
	pUnit:RemoveEvents()
	pUnit:SpawnCreature(33995, pUnit:GetX(), pUnit:GetY()+5, pUnit:GetZ()+15, pUnit:GetO(), 22, 6000000)
	pUnit:SetCombatCapable(1)
	pUnit:RegisterEvent("deconhrt_OnCombat", 60000, 1)
end

function decon_Phase2a(pUnit, Event)
	pUnit:SendChatMessage(42, 0, "Heart of Deconstructor arises!")
	pUnit:SendChatMessage(14, 0, "So tired. I will rest for just a moment!")
	pUnit:PlaySoundToSet(15725)
	pUnit:RemoveEvents()
	pUnit:SpawnCreature(33995, pUnit:GetX(), pUnit:GetY()+5, pUnit:GetZ()+15, pUnit:GetO(), 22, 6000000)
	pUnit:SetCombatCapable(1)
	pUnit:RegisterEvent("deconhrt_OnCombat2", 60000, 1)
end

function decon_Phase2b(pUnit, Event)
	pUnit:SendChatMessage(42, 0, "Heart of Deconstructor arises!")
	pUnit:SendChatMessage(14, 0, "So tired. I will rest for just a moment!")
	pUnit:PlaySoundToSet(15725)
	pUnit:RemoveEvents()
	pUnit:SpawnCreature(33995, pUnit:GetX(), pUnit:GetY()+5, pUnit:GetZ()+15, pUnit:GetO(), 22, 6000000)
	pUnit:SetCombatCapable(1)
	pUnit:RegisterEvent("deconhrt_OnCombat3", 60000, 1)
end

function decon_phase3(pUnit, Event)
	pUnit:SendChatMessage(42, 0, "Deconstructor Enrages!")
	pUnit:SendChatMessage(14, 0, "I'm tired of these toys. I don't want to play anymore!")
	pUnit:PlaySoundToSet(15730)
	pUnit:CastSpell(27680)
	pUnit:RegisterEvent("decon_hlthchk", 1000, 0)
end

function decon_hlthchk(pUnit, Event)
	if(pUnit:GetHealthPct() < 1) then
		pUnit:SendChatMessage(12, 0, "You are bad... Toys... Very... Baaaaad!")
		pUnit:PlaySoundToSet(15731)
		pUnit:RemoveEvents()
	end
end

function deconhrt_Register(pUnit, Event)
	deconhrt = pUnit
end

function deconhrt_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("deconhrt_Spawn", 1000, 1)
	pUnit:RegisterEvent("deconhrt_Close", 180000, 1)
end

function deconhrt_OnCombat2(pUnit, Event)
	pUnit:RegisterEvent("deconhrt_Spawn", 1000, 1)
	pUnit:RegisterEvent("deconhrt_Close2", 180000, 1)
end

function deconhrt_OnCombat2(pUnit, Event)
	pUnit:RegisterEvent("deconhrt_Spawn", 1000, 1)
	pUnit:RegisterEvent("deconhrt_Close3", 180000, 1)
end

function deconhrt_Close(pUnit, Event)
	pUnitespawn(1000, 0)
	pUnit:SendChatMessage(42, 0, "Heart of Deconstructor returns!")
	pUnit:SendChatMessage(14, 0, "I'm ready to play!")
	pUnit:PlaySoundToSet(15726)
	pUnit:SetCombatCapable(0)
	pUnit:RegisterEvent("decon_Hrtbreak", 1000, 1)
	pUnit:RegisterEvent("decon_OnCombat2", 6000, 1)
end

function deconhrt_Close2(pUnit, Event)
	pUnitespawn(1000, 0)
	pUnit:SendChatMessage(42, 0, "Heart of Deconstructor returns!")
	pUnit:SendChatMessage(14, 0, "I'm ready to play!")
	pUnit:PlaySoundToSet(15726)
	pUnit:SetCombatCapable(0)
	pUnit:RegisterEvent("decon_Hrtbreak", 1000, 1)
	pUnit:RegisterEvent("decon_OnCombat3", 6000, 1)
end

function deconhrt_Close3(pUnit, Event)
	pUnitespawn(1000, 0)
	pUnit:SendChatMessage(42, 0, "Heart of Deconstructor returns!")
	pUnit:SendChatMessage(14, 0, "I'm ready to play!")
	pUnit:PlaySoundToSet(15726)
	pUnit:SetCombatCapable(0)
	pUnit:RegisterEvent("decon_Hrtbreak", 1000, 1)
	pUnit:RegisterEvent("decon_OnCombat4", 6000, 1)
end

function deconhrt_Spawn(pUnit, Event)
	pUnit:SendChatMessage(42, 0, "Deconstructor bring out his toys!")
	pUnit:SendChatMessage(14, 0, "Time for a new game! My old toys will fight my new toys!")
	pUnit:PlaySoundToSet(15732)
	pUnit:SpawnCreature(33888, deconhrt:GetX(), deconhrt:GetY()+10, deconhrt:GetZ(), deconhrt:GetO(), 22, 6000000)
	pUnit:SpawnCreature(33888, deconhrt:GetX()+10, deconhrt:GetY(), deconhrt:GetZ(), deconhrt:GetO(), 22, 6000000)
	pUnit:SpawnCreature(33888, deconhrt:GetX(), deconhrt:GetY()-10, deconhrt:GetZ(), deconhrt:GetO(), 22, 6000000)
	pUnit:SpawnCreature(33887, deconhrt:GetX()+10, deconhrt:GetY(), deconhrt:GetZ(), deconhrt:GetO(), 22, 6000000)
	pUnit:SpawnCreature(33887, deconhrt:GetX(), deconhrt:GetY()+10, deconhrt:GetZ(), deconhrt:GetO(), 22, 6000000)
	pUnit:SpawnCreature(33887, deconhrt:GetX()+10, deconhrt:GetY(), deconhrt:GetZ(), deconhrt:GetO(), 22, 6000000)
	pUnit:SpawnCreature(33886, deconhrt:GetX(), deconhrt:GetY()+5, deconhrt:GetZ(), deconhrt:GetO(), 22, 6000000)
	pUnit:SpawnCreature(33886, deconhrt:GetX()+5, deconhrt:GetY(), deconhrt:GetZ(), deconhrt:GetO(), 22, 6000000)
	pUnit:SpawnCreature(33886, deconhrt:GetX(), deconhrt:GetY()-5, deconhrt:GetZ(), deconhrt:GetO(), 22, 6000000)
end

function pumeller_Register(pUnit, Event)
	pumeller = pUnit
end

function pumeller_OnCombat(pUnit, Event)
	pUnit:GetClosestPlayer(0)
end

RegisterUnitEvent(33888, 1, "pumeller_OnCombat")

function scrapbot_Register(pUnit, Event)
	scrapbot = pUnit
end

function scrapbot_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("scrapbot_Heals", 6000, 0)
	pUnit:RegisterEvent("scrapbot_Kill", 360000, 0)
end

RegisterUnitEvent(33887, 1, "scrapbot_OnCombat")

function scrapbot_Heals(pUnit, Event)
	pUnit:CastSpellOnTarget(49, decon)
end

function scrapbot_Kill(pUnit, Event)
	pUnitespawn(1000, 0)
end

function boombot_Register(pUnit, Event)
	boombot = pUnit
end

function boombot_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("boombot_Explode", 1000, 0)
end

RegisterUnitEvent(33886, 1, "boombot_OnCombat")

function boombot_Explode(pUnit, Event)
	if(pUnit:GetHealthPct() <= 50) then
		pUnit:CastSpellOnTarget(26059, boombot:GetRandomPlayer(0))
	else
	end
end