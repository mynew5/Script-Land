local self = getfenv(1)

NPC_SNIVEL_A_AUCTION = 38338
NPC_SNIVEL_A_BANK = 38334
NPC_SNIVEL_A_BARBER = 38339
NPC_SNIVEL_H_AUCTION = 38335
NPC_SNIVEL_H_BANK = 38337
NPC_SNIVEL_H_BARBER = 38336

SPELL_SNIVEL_INVISIBILITY = 71776
SPELL_SEE_SNIVEL_INVISIBILITY = 71777
SPELL_SNIVELS_ROCKET = 71715
SPELL_DAZE = 71750

function Snivels_OnLoad(pUnit)
pUnit:CastSpell(SPELL_SNIVEL_INVISIBILITY)
local petowner = pUnit:GetPetOwner()
if(petowner and petowner:IsPlayer())then
if(petowner:HasAura(SPELL_SEE_SNIVEL_INVISIBILITY) == false)then
	petowner:CastSpell(SPELL_SEE_SNIVEL_INVISIBILITY)
end
	if(pUnit:GetEntry() == NPC_SNIVEL_A_AUCTION or pUnit:GetEntry() == NPC_SNIVEL_H_AUCTION)then
		if(pUnit:GetEntry() == NPC_SNIVEL_A_AUCTION)then
			pUnit:TeleportCreature(-8816.089,662.68,95.43)
		elseif(pUnit:GetEntry() == NPC_SNIVEL_H_AUCTION)then
			pUnit:TeleportCreature(1684.98,-4459.57,19.09)
		end
		pUnit:SendChatMessage(12, 0, "That's right, I'd like to list some of these 'fireworks'.")
	elseif(pUnit:GetEntry() == NPC_SNIVEL_A_BANK or pUnit:GetEntry() == NPC_SNIVEL_H_BANK)then
		if(pUnit:GetEntry() == NPC_SNIVEL_A_BANK)then
			pUnit:TeleportCreature(-8919.15,621.38,99.53)
		elseif(pUnit:GetEntry() == NPC_SNIVEL_H_BANK)then
			pUnit:TeleportCreature(1628.71,-4381.23,12.11)
		end
		pUnit:SendChatMessage(12, 0, "What are you staring at? Haven't you ever seen a genius before?")
	elseif(pUnit:GetEntry() == NPC_SNIVEL_A_BARBER or pUnit:GetEntry() == NPC_SNIVEL_H_BARBER)then
		if(pUnit:GetEntry() == NPC_SNIVEL_A_BARBER)then
			pUnit:TeleportCreature(-8745.12,655.48,105.1)
		elseif(pUnit:GetEntry() == NPC_SNIVEL_H_BARBER)then
			pUnit:TeleportCreature(1761.5,-4348.5,-7.79)
		end
		pUnit:SendChatMessage(12, 0, "Thanks for the great cut and shave, buddy.")
	end
pUnit:Despawn(10000,0)
pUnit:RegisterAIUpdateEvent(1000)
self[tostring(pUnit)] = {
	SnivelTimer = 0
}
end
end

function Snivel_AIUpdate(pUnit)
if(pUnit == nil)then
	pUnit:RemoveAIUpdateEvent()
end
local vars = self[tostring(pUnit)]
vars.SnivelTimer = vars.SnivelTimer + 1
if(vars.SnivelTimer == 3)then
	if(pUnit:GetEntry() == NPC_SNIVEL_A_AUCTION or pUnit:GetEntry() == NPC_SNIVEL_H_AUCTION)then
		pUnit:SendChatMessage(12, 0, "Those'll net me a nice profit when I return from the South Seas.")
	elseif(pUnit:GetEntry() == NPC_SNIVEL_A_BANK or pUnit:GetEntry() == NPC_SNIVEL_H_BANK)then
		pUnit:SendChatMessage(12, 0, "This'll teach you to mind your own business!")
		local petowner = pUnit:GetPetOwner()
		if(petowner ~= nil)then
			pUnit:FullCastSpellOnTarget(SPELL_SNIVELS_ROCKET,petowner)
		end
	elseif(pUnit:GetEntry() == NPC_SNIVEL_A_BARBER or pUnit:GetEntry() == NPC_SNIVEL_H_BARBER)then
		pUnit:SendChatMessage(12, 0, "Here's a little somethin' extra since I'll be away.")
	end
elseif(vars.SnivelTimer == 6)then
	if(pUnit:GetEntry() == NPC_SNIVEL_A_AUCTION or pUnit:GetEntry() == NPC_SNIVEL_H_AUCTION)then
		pUnit:SendChatMessage(12, 0, "You... Don't think I don't see you. Leave me alone!.")
		--[[ local petowner = pUnit:GetPetOwner()
		if(petowner ~= nil)then
			pUnit:FullCastSpellOnTarget(SPELL_DAZE,petowner) -- This spell makes players fall under the ground. Enable at your risk.
		end ]]--
	elseif(pUnit:GetEntry() == NPC_SNIVEL_A_BANK or pUnit:GetEntry() == NPC_SNIVEL_H_BANK)then
		local petowner = pUnit:GetPetOwner()
		if(petowner ~= nil)then
			if(petowner:HasAura(SPELL_SEE_SNIVEL_INVISIBILITY))then
				petowner:RemoveAura(SPELL_SEE_SNIVEL_INVISIBILITY)
			end
		end
		pUnit:Despawn(1,0)
		pUnit:RemoveAIUpdateEvent()
	elseif(pUnit:GetEntry() == NPC_SNIVEL_A_BARBER or pUnit:GetEntry() == NPC_SNIVEL_H_BARBER)then
		pUnit:SendChatMessage(12, 0, "On second thought, keep the whole bag. I have to, uh, get going.")
	end
elseif(vars.SnivelTimer == 9)then
	if(pUnit:GetEntry() == NPC_SNIVEL_A_AUCTION or pUnit:GetEntry() == NPC_SNIVEL_H_AUCTION)then
		local petowner = pUnit:GetPetOwner()
		if(petowner ~= nil)then
			if(petowner:HasAura(SPELL_SEE_SNIVEL_INVISIBILITY))then
				petowner:RemoveAura(SPELL_SEE_SNIVEL_INVISIBILITY)
			end
		end
		pUnit:Despawn(1,0)
		pUnit:RemoveAIUpdateEvent()
	elseif(pUnit:GetEntry() == NPC_SNIVEL_A_BANK or pUnit:GetEntry() == NPC_SNIVEL_H_BANK)then
		pUnit:Despawn(1,0)
	elseif(pUnit:GetEntry() == NPC_SNIVEL_A_BARBER or pUnit:GetEntry() == NPC_SNIVEL_H_BARBER)then
		pUnit:SendChatMessage(12, 0, "Did you really think you could corner me this easily?")
	end
elseif(vars.SnivelTimer == 10)then
	if(pUnit:GetEntry() == NPC_SNIVEL_A_BARBER or pUnit:GetEntry() == NPC_SNIVEL_H_BARBER)then
		local petowner = pUnit:GetPetOwner()
		if(petowner ~= nil)then
			if(petowner:HasAura(SPELL_SEE_SNIVEL_INVISIBILITY))then
				petowner:RemoveAura(SPELL_SEE_SNIVEL_INVISIBILITY)
			end
		end
		pUnit:Despawn(1,0)
		pUnit:RemoveAIUpdateEvent()
	end
end
end

RegisterUnitEvent(NPC_SNIVEL_A_AUCTION,18,Snivels_OnLoad)
RegisterUnitEvent(NPC_SNIVEL_A_BANK,18,Snivels_OnLoad)
RegisterUnitEvent(NPC_SNIVEL_A_BARBER,18,Snivels_OnLoad)
RegisterUnitEvent(NPC_SNIVEL_H_AUCTION,18,Snivels_OnLoad)
RegisterUnitEvent(NPC_SNIVEL_H_BANK,18,Snivels_OnLoad)
RegisterUnitEvent(NPC_SNIVEL_H_BARBER,18,Snivels_OnLoad)
RegisterUnitEvent(NPC_SNIVEL_A_AUCTION,21,Snivel_AIUpdate)
RegisterUnitEvent(NPC_SNIVEL_A_BANK,21,Snivel_AIUpdate)
RegisterUnitEvent(NPC_SNIVEL_A_BARBER,21,Snivel_AIUpdate)
RegisterUnitEvent(NPC_SNIVEL_H_AUCTION,21,Snivel_AIUpdate)
RegisterUnitEvent(NPC_SNIVEL_H_BANK,21,Snivel_AIUpdate)
RegisterUnitEvent(NPC_SNIVEL_H_BARBER,21,Snivel_AIUpdate)