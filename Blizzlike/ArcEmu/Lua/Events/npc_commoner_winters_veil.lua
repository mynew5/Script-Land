function OnSpawn(pUnit, event)
local entry = pUnit:GetEntry()
if(entry == 18927)then -- Human Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33402)
	elseif(aura == 1)then
		pUnit:CastSpell(33403)
	end
elseif(entry == 19148)then -- Dwarf Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33433)
	elseif(aura == 1)then
		pUnit:CastSpell(33436)
	end
elseif(entry == 19169)then -- Blood Elf Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33412)
	elseif(aura == 1)then
		pUnit:CastSpell(33415)
	end
elseif(entry == 19171)then -- Draenei Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33427)
	elseif(aura == 1)then
		pUnit:CastSpell(33430)
	end
elseif(entry == 19172)then -- Gnome Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33445)
	elseif(aura == 1)then
		pUnit:CastSpell(33448)
	end
elseif(entry == 19173)then -- Night Elf Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33439)
	elseif(aura == 1)then
		pUnit:CastSpell(33442)
	end
elseif(entry == 19175)then -- Orc Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33451)
	elseif(aura == 1)then
		pUnit:CastSpell(33455)
	end
elseif(entry == 19176)then -- Tauren Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33458)
	elseif(aura == 1)then
		pUnit:CastSpell(33465)
	end
elseif(entry == 19177)then -- Troll Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33468)
	elseif(aura == 1)then
		pUnit:CastSpell(33471)
	end
elseif(entry == 19178)then -- Forsaken Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(33474)
	elseif(aura == 1)then
		pUnit:CastSpell(33477)
	end
elseif(entry == 20102)then -- Goblin Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(34845)
	elseif(aura == 1)then
		pUnit:CastSpell(34849)
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
