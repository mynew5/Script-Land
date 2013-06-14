function OnSpawn(pUnit, event)
local entry = pUnit:GetEntry()
if(entry == 18927)then -- Human Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(43632)
	elseif(aura == 1)then
		pUnit:CastSpell(43633)
	end
elseif(entry == 19148)then -- Dwarf Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(43626)
	elseif(aura == 1)then
		pUnit:CastSpell(43627)
	end
elseif(entry == 19169)then -- Blood Elf Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(43405)
	elseif(aura == 1)then
		pUnit:CastSpell(43406)
	end
elseif(entry == 19171)then -- Draenei Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(43623)
	elseif(aura == 1)then
		pUnit:CastSpell(43625)
	end
elseif(entry == 19172)then -- Gnome Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(43628)
	elseif(aura == 1)then
		pUnit:CastSpell(43629)
	end
elseif(entry == 19173)then -- Night Elf Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(43634)
	elseif(aura == 1)then
		pUnit:CastSpell(43635)
	end
elseif(entry == 19175)then -- Orc Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(43636)
	elseif(aura == 1)then
		pUnit:CastSpell(43637)
	end
elseif(entry == 19176)then -- Tauren Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(43638)
	elseif(aura == 1)then
		pUnit:CastSpell(43639)
	end
elseif(entry == 19177)then -- Troll Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(43640)
	elseif(aura == 1)then
		pUnit:CastSpell(43641)
	end
elseif(entry == 19178)then -- Forsaken Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(43642)
	elseif(aura == 1)then
		pUnit:CastSpell(43643)
	end
elseif(entry == 20102)then -- Goblin Commoner
	local aura = math.random(0,1)
	if(aura == 0)then
		pUnit:CastSpell(43630)
	elseif(aura == 1)then
		pUnit:CastSpell(43631)
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
