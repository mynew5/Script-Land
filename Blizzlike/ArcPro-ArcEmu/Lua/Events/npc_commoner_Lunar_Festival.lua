function OnSpawn(pUnit, event)
pUnit:RemoveAllAuras()
local entry = pUnit:GetEntry()
if(entry == 18927)then -- Human Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33398)
	elseif(aura == 1)then
		pUnit:CastSpell(33397)
	end
elseif(entry == 19148)then -- Dwarf Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33437)
	elseif(aura == 1)then
		pUnit:CastSpell(33434)
	end
elseif(entry == 19169)then -- Blood Elf Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33416)
	elseif(aura == 1)then
		pUnit:CastSpell(33413)
	end
elseif(entry == 19171)then -- Draenei Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33431)
	elseif(aura == 1)then
		pUnit:CastSpell(33428)
	end
elseif(entry == 19172)then -- Gnome Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33449)
	elseif(aura == 1)then
		pUnit:CastSpell(33446)
	end
elseif(entry == 19173)then -- Night Elf Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33443)
	elseif(aura == 1)then
		pUnit:CastSpell(33440)
	end
elseif(entry == 19175)then -- Orc Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33456)
	elseif(aura == 1)then
		pUnit:CastSpell(33453)
	end
elseif(entry == 19176)then -- Tauren Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33466)
	elseif(aura == 1)then
		pUnit:CastSpell(33459)
	end
elseif(entry == 19177)then -- Troll Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33472)
	elseif(aura == 1)then
		pUnit:CastSpell(33469)
	end
elseif(entry == 19178)then -- Forsaken Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33478)
	elseif(aura == 1)then
		pUnit:CastSpell(33475)
	end
elseif(entry == 20102)then -- Goblin Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(34851)
	elseif(aura == 1)then
		pUnit:CastSpell(34848)
	end
end
end

RegisterUnitEvent(18927,18,OnSpawn)
RegisterUnitEvent(19148,18,OnSpawn)
RegisterUnitEvent(19169,18,OnSpawn)
RegisterUnitEvent(19171,18,OnSpawn)
RegisterUnitEvent(19172,18,OnSpawn)
RegisterUnitEvent(19173,18,OnSpawn)
RegisterUnitEvent(19175,18,OnSpawn)
RegisterUnitEvent(19176,18,OnSpawn)
RegisterUnitEvent(19177,18,OnSpawn)
RegisterUnitEvent(19178,18,OnSpawn)
RegisterUnitEvent(20102,18,OnSpawn)
