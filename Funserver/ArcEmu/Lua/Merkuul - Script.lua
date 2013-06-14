--[[ Merkuul Functions ]]--

function Merkuul_WaterVolley(Unit)
print "Merkuul_WaterVolley initiated..."
Unit:FullCastSpell(38335)
end

function Merkuul_WaterBolt(Unit)
print "Merkuul_WaterBolt initiated..."
Unit:FullCastSpellOnTarget(31012, Unit:GetRandomPlayer(0))
end

function Merkuul_ConeOfCold(Unit)
print "Merkuul_ConeOfCold initiated..."
Unit:FullCastSpell(37265)
end

function Merkuul_IceBolt(Unit)
print "Merkuul_IceBolt initated..."
Unit:FullCastSpellOnTarget(28526, Unit:GetRandomPlayer(0))
end

function Merkuul_IceTomb(Unit)
print "Merkuul_IceTomb initated..."
Unit:FullCastSpellOnTarget(16869, Unit:GetRandomPlayer(0))
end

function Merkuul_ChainsOfIce(Unit)
print "Merkuul_ChainsOfIce initiated..."
Unit:FullCastSpellOnTarget(29991, Unit:GetRandomPlayer(0))
end

function Merkuul_ManaShield(Unit)
print "Merkuul_ManaShield initiated..."
Unit:CastSpell(38151)
end

function Merkuul_FrostNova(Unit)
print "Merkuul_FrostNova initiated..."
Unit:FullCastSpell(31250)
end

--[[ Elemental Functions ]]--

function Elemental_WaterBolt(Unit)
print "Elemental_WaterBolt initated..."
Unit:FullCastSpellOnTarget(37252, Unit:GetRandomPlayer(0))
end

function Elemental_Debuff(Unit)
print "Elemental_Debuff initiated..."
Unit:FullCastSpellOnTarget(38089, Unit:GetRandomPlayer(0))
end

function Elemental_Despawn(Unit)
if Unit:GetHealthPct() < 30 then
print "Elemental_Despawn initiating..."
Unit:Despawn(100, 0)
else
end
end

--[[ Merkuul Blizzard Functions ]]--

function Merkuul_BlizzardSummon(Unit, event)
print "Merkuul_BlizzardSummon initiated..."
plr=Unit:GetRandomPlayer(0);
x=plr:GetX();
y=plr:GetY();
z=plr:GetZ();
Unit:SpawnCreature(210003, x, y, z, 90, 14, 0)
end

function Merkuul_BlizzardTriggerSpell(Unit, event)
print "Merkuul_BlizzardTriggerSpell initiated..."
Unit:StopMovement(11000)
Unit:FullCastSpell(20680)
Unit:Despawn(11000, 0)
end

function Merkuul_BLizzardTriggerOnEnterCombat(Unit, event)
print "Merkuul_BlizzardTriggerSpawned initiated..."
Unit:RegisterEvent("Merkuul_BlizzardTriggerSpell", 4000, 1)
end



--[[ Phase One ]]--

function Merkuul_PhaseOne(Unit, event)
print "--- MERKUUL PHASEONE INITIATED ---"
Unit:RemoveEvents()
Unit:RegisterEvent("Merkuul_WaterBolt", 4000, 0)
Unit:RegisterEvent("Merkuul_IceTomb", 6000, 0)
Unit:RegisterEvent("Merkuul_PhaseTwo", 1000, 0)
end

--[[ Phase Two ]]--

function Merkuul_PhaseTwo(Unit, event)
if Unit:GetHealthPct() <86 then
print "--- MERKUUL PHASETWO INITIATED ---"
x = Unit:GetX()
y = Unit:GetY()
z = Unit:GetZ()
o = Unit:GetO()
x1 = x + 4
y1 = y + 4
x2 = x + 8
y2 = y - 4
x3 = x - 4
y3 = y + 4
x4 = x - 8
y4 = y + 8
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "It would be wise to turn back...")
Unit:SpawnCreature(210002, x1, y1, z, o, 21, 360000)
Unit:SpawnCreature(210002, x2, y2, z, o, 21, 360000)
Unit:RegisterEvent("Merkuul_WaterBolt", 4000, 0)
Unit:RegisterEvent("Merkuul_IceTomb", 4500, 0)
Unit:RegisterEvent("Merkuul_ConeOfCold", 10000, 0)
Unit:RegisterEvent("Merkuul_PhaseThree", 1000, 0)
end
end

function Merkuul_PhaseThree(Unit, event)
if Unit:GetHealthPct() <61 then
print "--- MERKUUL PHASETHREE INITIATED ---"
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "Let me turn the temperature down a little lower...")
Unit:SpawnCreature(210002, x1, y1, z, o, 21, 360000)
Unit:SpawnCreature(210002, x2, y2, z, o, 21, 360000)
Unit:RegisterEvent("Merkuul_WaterVolley", 7000, 0)
Unit:RegisterEvent("Merkuul_FrostNova", 10500, 0)
Unit:RegisterEvent("Merkuul_BlizzardSummon", 15000, 0)
Unit:RegisterEvent("Merkuul_PhaseFour", 1000, 0)
end
end

function Merkuul_ElementalPhaseFour(Unit, event)
print "Merkuul_ElementalPhaseFour initiated"
Unit:SpawnCreature(210002, x1, y1, z, o, 21, 360000)
Unit:SpawnCreature(210002, x2, y2, z, o, 21, 360000)
end

function Merkuul_PhaseFour(Unit, event)
if Unit:GetHealthPct() <31 then
print "--- MERKUUL PHASEFOUR INITIATED ---"
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "Your persistance will be your undoing!")
Unit:SpawnCreature(210002, x1, y1, z, o, 21, 360000)
Unit:SpawnCreature(210002, x2, y2, z, o, 21, 360000)
Unit:SpawnCreature(210002, x3, y3, z, o, 21, 360000)
Unit:SpawnCreature(210002, x4, y4, z, o, 21, 360000)
Unit:RegisterEvent("Merkuul_ManaShield", 15000, 4)
Unit:RegisterEvent("Merkuul_ChainsOfIce", 7000, 0)
Unit:RegisterEvent("Merkuul_WaterBolt", 3000, 0)
Unit:RegisterEvent("Merkuul_ElementalPhaseFour", 60000, 0)
end
end

function Merkuul_EnterCombat(Unit, event)
print "Merkuul_EnterCombat initiated..."
Unit:StopMovement(100000)
Unit:SetCombatCapable(0)
Unit:SendChatMessage(12, 0, "Welcome to my humble home! Hope the chill dosen't bother you...")
Unit:RegisterEvent("Merkuul_PhaseOne", 1000, 0)
end

function Elemental_EnterCombat(Unit, event)
print "Elemental_EnterCombat initiated..."
Unit:RegisterEvent("Elemental_WaterBolt", 2500, 0)
Unit:RegisterEvent("Elemental_Debuff", 6000, 0)
Unit:RegisterEvent("Elemental_Despawn", 1000, 0)
Unit:SetCombatCapable(0)
end

function Merkuul_LeaveCombat(Unit)
print "Merkuul_LeaveCombat initiated..."
Unit:RemoveAura(28531)
Unit:RemoveEvents()
end

function Elemental_LeaveCombat(Unit)
print "Elemental_LeaveCombat initiated..."
Unit:RemoveEvents()
Unit:Despawn(15000,0)
end

function Merkuul_KilledTarget(Unit, event)
print "Merkuul_KilledTarget initiated..."
kill=math.random(1,3);
if kill == 1 then
Unit:SendChatMessage(12, 0, "Another body for the freezer...")
end

if kill == 2 then
Unit:SendChatMessage(12, 0, "Was it too cold?")
end

if kill == 3 then
Unit:SendChatMessage(12, 0, "Left Already?...")
end
end

function Merkuul_Death(Unit)
print "Merkuul_Death initiated..."
Unit:SendChatMessage(12, 0, "I feel...cold...")
Unit:RemoveEvents()
end

RegisterUnitEvent(210003, 1, "Merkuul_BLizzardTriggerOnEnterCombat")
RegisterUnitEvent(210001, 1, "Merkuul_EnterCombat")
RegisterUnitEvent(210002, 1, "Elemental_EnterCombat")
RegisterUnitEvent(210001, 2, "Merkuul_LeaveCombat")
RegisterUnitEvent(210002, 2, "Elemental_LeaveCombat")
RegisterUnitEvent(210001, 3, "Merkuul_KilledTarget")
RegisterUnitEvent(210001, 4, "Merkuul_Death")