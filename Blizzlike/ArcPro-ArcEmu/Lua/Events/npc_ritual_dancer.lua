SPELL_TIKI_VISUAL_1 = 75214
SPELL_TIKI_VISUAL_2 = 75228
SPELL_TIKI_VISUAL_3 = 75229
SPELL_TIKI_VISUAL_4 = 75219
SPELL_TIKI_VISUAL_5 = 75230
SPELL_TIKI_VISUAL_6 = 75220
NPC_RITUAL_DANCER = 40356

function OnSpawn(pUnit, event)
pUnit:RemoveAllAuras()
local aura = math.random(1,6)
if(aura == 1)then
	pUnit:CastSpell(SPELL_TIKI_VISUAL_1)
elseif(aura == 2)then
	pUnit:CastSpell(SPELL_TIKI_VISUAL_2)
elseif(aura == 3)then
	pUnit:CastSpell(SPELL_TIKI_VISUAL_3)
elseif(aura == 4)then
	pUnit:CastSpell(SPELL_TIKI_VISUAL_4)
elseif(aura == 5)then
	pUnit:CastSpell(SPELL_TIKI_VISUAL_5)
elseif(aura == 6)then
	pUnit:CastSpell(SPELL_TIKI_VISUAL_6)
end
end

RegisterUnitEvent(NPC_RITUAL_DANCER,18,OnSpawn)
