--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function spellflare(Unit)
	Unit:CastSpell(42505) 
end

function Banddespawn(Unit, Event)
	Unit:Delete()
end

function despawnband(Unit, Event)
	Unit:RegisterEvent(500, spellflare, 1)
	Unit:RemoveEvents() 
	Unit:Despawn(1000,2000000)  
end

function despawnband2(Unit, Event)
	Unit:RegisterEvent(500, spellflare, 2)
	Unit:RemoveEvents() 
	Unit:Despawn(1000,2000000)
end

function spellfire(Unit)
	Unit:CastSpell(42501)
end

function UDemotes(Unit)
	Unit:RegisterEvent(500, spellflare, 2)
	Unit:RegisterEvent(280000, despawnband, 0)
	Unit:RegisterEvent(10000, EmoteSpinGuiUD, 1)
	Unit:RegisterEvent(30000, EmoteStrumGuiUD, 1)
	Unit:RegisterEvent(34000, EmoteStrumGuiUD, 1)
	Unit:RegisterEvent(38000, EmoteSpinGuiUD, 1)
	Unit:RegisterEvent(45000, Normalstate, 1)
	Unit:RegisterEvent(104000, EmoteJumpGuiUD, 1)
	Unit:RegisterEvent(70000, EmoteStepGuiUD, 1)
	Unit:RegisterEvent(85000, Normalstate, 1)
	Unit:RegisterEvent(123000, EmoteJumpGuiUD, 1)
	Unit:RegisterEvent(140000, Spotlight, 1)
	Unit:RegisterEvent(145000, EmoteSpinGuiUD, 1) 
	Unit:RegisterEvent(168000, EmoteJumpGuiUD, 1)
	Unit:RegisterEvent(200000, Normalstate, 1)
	Unit:RegisterEvent(229000, EmoteStepGuiUD, 1)
	Unit:RegisterEvent(203000, Normalstate, 1)
end

function EmoteStrumGuiUD(Unit)
	Unit:Emote(405)
end

function EmoteStepGuiUD(Unit)
	Unit:Emote(403)
end

function EmoteSpinGuiUD(Unit)
	Unit:Emote(404)
end
function EmoteJumpGuiUD(Unit)
	Unit:Emote(402)
end

function Drumemotes(Unit)
	Unit:RegisterEvent(500, spellflare, 2)
	Unit:RegisterEvent(280000, despawnband, 0)
	Unit:SetCombatCapable(0)
	Unit:RegisterEvent(30000, Emotetwodrum, 1)
	Unit:RegisterEvent(34000, Emotetwodrum, 1)
	Unit:RegisterEvent(38000, Emotetwodrum, 1)
	Unit:RegisterEvent(45000, Normalstate, 1)
	Unit:RegisterEvent(58000, Emotetwodrum, 1)
	Unit:RegisterEvent(68000, Emotejumpdrum, 1)
	Unit:RegisterEvent(88000, Emoterolldrum, 1)
	Unit:RegisterEvent(100000, Emotejumpdrum, 1)
	Unit:RegisterEvent(138000, Emotetwodrum, 1)
	Unit:RegisterEvent(210000, Emoterolldrum, 1)
	Unit:RegisterEvent(203000, Normalstate, 1)
end

function Emotejumpdrum(Unit)
	Unit:Emote(405)
end

function Emoterolldrum(Unit)
	Unit:Emote(402)
end

function Emotetwodrum(Unit)
	Unit:Emote(403)
end

function Emotespindrum(Unit)
	Unit:Emote(404)
end

function Orcemotes(Unit)
	Unit:RegisterEvent(500, spellflare, 2)
	Unit:RegisterEvent(280000, despawnband, 0)
	Unit:SetCombatCapable(0)
	Unit:RegisterEvent(0500, EmoteRight, 1)
	Unit:RegisterEvent(19000, EmoteGrabclose, 1)
	Unit:RegisterEvent(30000, Emoteleft, 1)
	Unit:RegisterEvent(45000, Normalstate, 1)
	Unit:RegisterEvent(65000, EmoteGrab, 1)
	Unit:RegisterEvent(70000, Emoteleft, 1)
	Unit:RegisterEvent(84000, EmoteScream, 1)
	Unit:RegisterEvent(87000, Normalstate, 1)
	Unit:RegisterEvent(115000, OrcLight, 1)
	Unit:RegisterEvent(123042, Emoteleft, 1)
	Unit:RegisterEvent(137000, EmoteScream, 1)
	Unit:RegisterEvent(142000, Emotestop, 1)
	Unit:RegisterEvent(180000, Emotestop, 1)
	Unit:RegisterEvent(229000, EmoteRight, 1)
	Unit:RegisterEvent(239000, EmoteGrab, 1)
	Unit:RegisterEvent(259000, EmoteScream, 1)
end

function EmoteRight(Unit)
	Unit:Emote(403)
end

function Emoteleft(Unit)
	Unit:Emote(404)
end

function EmoteScream(Unit)
	Unit:Emote(407)
end

function EmoteGrab(Unit)
	Unit:Emote(405)
end

function Emotestop(Unit)
	Unit:Emote(402)
end

function EmoteGrabclose(Unit)
	Unit:Emote(406)
end

function OrcLight(Unit)
	Unit:CastSpell(42510)
end

function Trollemotes(Unit)
	Unit:RegisterEvent(500, spellflare, 2)
	Unit:SetCombatCapable(0)
	Unit:RegisterEvent(10000, EmoteStrumbass, 1)
	Unit:RegisterEvent(30000, EmoteStrumbass, 1)
	Unit:RegisterEvent(45000, Normalstate, 1)
	Unit:RegisterEvent(70350, EmoteStepbass, 1)
	Unit:RegisterEvent(85000, Normalstate, 1)
	Unit:RegisterEvent(95000, EmoteJumpbass, 1)
	Unit:RegisterEvent(102000, EmoteStrumbass, 1) 
	Unit:RegisterEvent(115000, EmoteStepbass, 1)
	Unit:RegisterEvent(123500, EmoteStepbass, 1)
	Unit:RegisterEvent(165000, EmoteStepbass, 1)
	Unit:RegisterEvent(192300, EmoteJumpbass, 1)
	Unit:RegisterEvent(203000, Normalstate, 1)
	Unit:RegisterEvent(229550, EmoteStepbass, 1)
	Unit:RegisterEvent(280000, despawnband, 1)
end

function EmoteStrumbass(Unit)
	Unit:Emote(404)
end

function EmoteJumpbass(Unit)
	Unit:Emote(403)
end

function EmoteStepbass(Unit)
	Unit:Emote(402)
end

function BEmotes(Unit)
	Unit:RegisterEvent(500, spellflare, 2)
	Unit:RegisterEvent(280000, despawnband, 0)
	Unit:RegisterEvent(10000, EmoteStrumGui, 1)
	Unit:RegisterEvent(30000, EmoteStrumGui, 1)
	Unit:RegisterEvent(34000, EmoteStrumGui, 1)
	Unit:RegisterEvent(38000, EmoteStrumGui, 1)
	Unit:RegisterEvent(45000, Normalstate, 1)
	Unit:RegisterEvent(70061, EmoteStrumGui, 1)
	Unit:RegisterEvent(85000, Normalstate, 1)
	Unit:RegisterEvent(104000, EmotekickGui, 1)
	Unit:RegisterEvent(123042, EmoteStrumGui, 1)
	Unit:RegisterEvent(140000, EmoteStrumGui, 1)
	Unit:RegisterEvent(166000, EmotekickGui, 1)
	Unit:RegisterEvent(168000, EmotepluckGui, 1)
	Unit:RegisterEvent(180000, EmotepluckGui, 1)
	Unit:RegisterEvent(193000, EmoteSpinGui, 1)
	Unit:RegisterEvent(203000, Normalstate, 1)
	Unit:RegisterEvent(229240, EmoteStrumGui, 1)
	Unit:RegisterEvent(257000, Normalstate, 1)
	Unit:RegisterEvent(259000, EmoteSpinGui, 1)
end

function EmoteStrumGui(Unit)
	Unit:Emote(402)
end

function EmotepluckGui(Unit)
	Unit:Emote(404)
end

function EmotekickGui(Unit)
	Unit:Emote(403)
end

function EmoteSpinGui(Unit)
	Unit:Emote(405)
end

function Normalstate(Unit)
	Unit:Emote(401)
end

function Spotlight(Unit)
	Unit:CastSpell(39312)
end

function spellearth(Unit)
	Unit:CastSpell(42499)
	Unit:RegisterEvent(2000, spellfire, 1)
end

function spelllightning(Unit)
	Unit:CastSpell(42510)
	Unit:CastSpell(42507)
end
 
function spellstorm(Unit)
	Unit:CastSpell(42500)
	Unit:RegisterEvent(1000, spelllightning, 1)
	Unit:RegisterEvent(4000, spellearth, 1)
end

function Onspawnband4(Unit)
	Unit:PlaySoundToSet(11803) 
	Unit:SetCombatCapable(0)
	Unit:RegisterEvent(1000, spellstorm, 1)  
	Unit:RegisterEvent(70000, spellstorm, 1)  
	Unit:RegisterEvent(123000, spellstorm, 1) 
	Unit:RegisterEvent(230000, spellstorm, 1)  
	Unit:RegisterEvent(243000, spellstorm, 1) 
	Unit:RegisterEvent(280000, despawnband, 0)  
end

RegisterUnitEvent(23624, 6, "Trollemotes") 
RegisterUnitEvent(23619, 6, "UDemotes")  
RegisterUnitEvent(23626, 6, "BEmotes")
RegisterUnitEvent(23625, 6, "Orcemotes")
RegisterUnitEvent(23623, 6, "Drumemotes")
RegisterUnitEvent(49000, 6, "Onspawnband4")