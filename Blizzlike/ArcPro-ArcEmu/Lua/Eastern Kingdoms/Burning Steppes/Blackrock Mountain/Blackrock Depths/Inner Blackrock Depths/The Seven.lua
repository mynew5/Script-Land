--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]
--TODO: have a timer for a wave of each seven.

--Hate'rel
function HREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(14, 0, "The death of our flesh marked the birth of our spirit and our sacred task.")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function HREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("HREL_ShadowShield", 7000, 0)
	pUnit:RegisterEvent("HREL_Strike", 14000, 0)
	pUnit:RegisterEvent("HREL_ShadowBolt", 21000, 0)
	pUnit:RegisterEvent("HREL_Flurry", 28000, 0)
end

function HREL_ShadowShield(pUnit, Event)
	pUnit:CastSpell(12040)
end

function HREL_Strike(pUnit, Event)
	pUnit:CastSpellOnTarget(15580)
end

function HREL_ShadowBolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15232)
end

function HREL_Flurry(pUnit, Event)
	pUnit:CastSpell(17687)
end

function HREL_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function HREL_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9034, 1, "HREL_OnCombat")
RegisterUnitEvent(9034, 2, "HREL_OnLeaveCombat")
RegisterUnitEvent(9034, 4, "HREL_OnDeath")
RegisterUnitGossipEvent(9034, 1, "HREL_OnGossipTalk")

--Anger'rel
function AREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(12, 0, "Our leader, Doom'rel, has ears for the challenge.")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function AREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("AREL_SunderArmor", 7000, 0)
	pUnit:RegisterEvent("AREL_ShieldBlock", 14000, 0)
	pUnit:RegisterEvent("AREL_Enrage", 21000, 0)
	pUnit:RegisterEvent("AREL_ShieldWall", 28000, 0)
	pUnit:RegisterEvent("AREL_Strike", 35000, 0)
end

function AREL_SunderArmor(pUnit, Event)
	pUnit:CastSpellOnTarget(11971)
end

function AREL_ShieldBlock(pUnit, Event)
	pUnit:CastSpell(12169)
end

function AREL_Enrage(pUnit, Event)
	pUnit:CastSpell(15061)
end

function AREL_ShieldWall(pUnit, Event)
	pUnit:CastSpell(15062)
end

function AREL_Strike(pUnit, Event)
	pUnit:CastSpellOnTarget(15580)
end

function AREL_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function AREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9035, 1, "AREL_OnCombat")
RegisterUnitEvent(9035, 2, "AREL_OnLeaveCombat")
RegisterUnitEvent(9035, 4, "AREL_OnDeath")
RegisterUnitGossipEvent(9035, 1, "AREL_OnGossipTalk")

--Vile'rel
function VREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(12, 0, "Our leader, Doom'rel, has ears for the challenge.")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function VREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("VREL_Heal", 7000, 0)
	pUnit:RegisterEvent("VREL_PowerWShield", 14000, 0)
	pUnit:RegisterEvent("VREL_PrayerOfHealing", 21000, 0)
	pUnit:RegisterEvent("VREL_MindBlast", 28000, 0)
end

function VREL_Heal(pUnit, Event)
	pUnit:FullCastSpell(15586)
end

function VREL_PowerWShield(pUnit, Event)
	pUnit:CastSpell(11974)
end

function VREL_PrayerOfHealing(pUnit, Event)
	pUnit:FullCastSpell(15585)
end

function VREL_MindBlast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15587)
end

function VREL_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function VREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9036, 1, "VREL_OnCombat")
RegisterUnitEvent(9036, 2, "VREL_OnLeaveCombat")
RegisterUnitEvent(9036, 4, "VREL_OnDeath")
RegisterUnitGossipEvent(9036, 1, "VREL_OnGossipTalk")

--Gloom'rel
function GREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(12, 0, "I am forever denied the touch of stone. I will never again know the glory of shaped iron...")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function GREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("GREL_Rechlessness", 7000, 0)
	pUnit:RegisterEvent("GREL_Cleave", 14000, 0)
	pUnit:RegisterEvent("GREL_Hamstring", 21000, 0)
	pUnit:RegisterEvent("GREL_MortalStrike", 28000, 0)
end

function GREL_Rechlessness(pUnit, Event)
	pUnit:CastSpell(13847)
end

function GREL_Cleave(pUnit, Event)
	pUnit:CastSpell(40504)
end

function GREL_Hamstring(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9080)
end

function GREL_MortalStrike(pUnit, Event)
	pUnit:CastSpellOnTarget(13737)
end

function GREL_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function GREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9037, 1, "VREL_OnCombat")
RegisterUnitEvent(9037, 2, "VREL_OnLeaveCombat")
RegisterUnitEvent(9037, 4, "VREL_OnDeath")
RegisterUnitGossipEvent(9037, 1, "VREL_OnGossipTalk")

--Seeth'rel
function SREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(14, 0, "You may not pass. You are not our kin, nor have you issued the challenge.")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function SREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("SREL_FrostArmor", 7000, 0)
	pUnit:RegisterEvent("SREL_ConeOfCold", 14000, 0)
	pUnit:RegisterEvent("SREL_FrostWard", 21000, 0)
	pUnit:RegisterEvent("SREL_Blizzard", 28000, 0)
	pUnit:RegisterEvent("SREL_FrostNova", 35000, 0)
	pUnit:RegisterEvent("SREL_Frostbolt", 42000, 0)
	pUnit:RegisterEvent("SREL_Chilled", 49000, 0)
end

function SREL_FrostArmor(pUnit, Event)
	pUnit:CastSpell(12544)
end

function SREL_ConeOfCold(pUnit, Event)
	pUnit:CastSpellOnTarget(15244)
end

function SREL_FrostWard(pUnit, Event)
	pUnit:CastSpell(15044)
end

function SREL_Blizzard(pUnit, Event)
	pUnit:CastSpellOnTarget(8364)
end

function SREL_FrostNova(pUnit, Event)
	pUnit:CastSpell(12674)
end

function SREL_FrostBolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(12675)
end

function SREL_Chilled(pUnit, Event)
	pUnit:CastSpellOnTarget(6136)
end

function SREL_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function SREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9038, 1, "SREL_OnCombat")
RegisterUnitEvent(9038, 2, "SREL_OnLeaveCombat")
RegisterUnitEvent(9038, 4, "SREL_OnDeath")
RegisterUnitGossipEvent(9038, 1, "SREL_OnGossipTalk")

--Doom'rel
function DOREL_OnGossipTalk(pUnit, player, Event)
	player:PlayerSendChatMessage(1, 0, "Your bondage is at the end, Doom'rel. I challenge you!")
	pUnit:SendChatMessage(12, 0, "You have challenged the Seven, and now you will die!")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function DOREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("DOREL_Banish", 7000, 0)
	pUnit:RegisterEvent("DOREL_CurseOfWeak", 14000, 0)
	pUnit:RegisterEvent("DOREL_DemonArmor", 21000, 0)
	pUnit:RegisterEvent("DOREL_Immolate", 28000, 0)
	pUnit:RegisterEvent("DOREL_ShadowBoltValley", 35000, 0)
	pUnit:RegisterEvent("DOREL_SummonVoidwalkers", 42000, 0)
end

function DOREL_Banish(pUnit, Event)
	pUnit:FullCastSpellOnTarget(8994)
end

function DOREL_CurseOfWeak(pUnit, Event)
	pUnit:CastSpellOnTarget(12493)
end

function DOREL_DemonArmor(pUnit, Event)
	pUnit:CastSpell(13787)
end

function DOREL_Immolate(pUnit, Event)
	pUnit:FullCastSpellOnTarget(12742)
end

function DOREL_ShadowBoltValley(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15245)
end

function DOREL_SummonVoidwalkers(pUnit, Event)
	pUnit:CastSpell(15092)
end

function DOREL_OnLeaveCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Your challenge has failed!")
	pUnit:RemoveEvents()
end

function DOREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9039, 1, "DOREL_OnCombat")
RegisterUnitEvent(9039, 2, "DOREL_OnLeaveCombat")
RegisterUnitEvent(9039, 4, "DOREL_OnDeath")
RegisterUnitGossipEvent(9039, 1, "DOREL_OnGossipTalk")

--Dope'rel
function DREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(12, 0, "Our punishment is also our blessing.")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function DREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("DREL_Backstab", 7000, 0)
	pUnit:RegisterEvent("DREL_Evasion", 14000, 0)
	pUnit:RegisterEvent("DREL_Gouge", 21000, 0)
	pUnit:RegisterEvent("DREL_Rupture", 28000, 0)
	pUnit:RegisterEvent("DREL_SinisterStrike", 35000, 0)
end

function DREL_Backstab(pUnit, Event)
	pUnit:CastSpellOnTarget(15582)
end

function DREL_Evasion(pUnit, Event)
	pUnit:CastSpell(15087)
end

function DREL_Gouge(pUnit, Event)
	pUnit:CastSpellOnTarget(12540)
end

function DREL_Rupture(pUnit, Event)
	pUnit:CastSpellOnTarget(15583)
end

function DREL_SinisterStrike(pUnit, Event)
	pUnit:CastSpellOnTarget(15581)
end

function DREL_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function DREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9040, 1, "DREL_OnCombat")
RegisterUnitEvent(9040, 2, "DREL_OnLeaveCombat")
RegisterUnitEvent(9040, 4, "DREL_OnDeath")
RegisterUnitGossipEvent(9040, 1, "DREL_OnGossipTalk")