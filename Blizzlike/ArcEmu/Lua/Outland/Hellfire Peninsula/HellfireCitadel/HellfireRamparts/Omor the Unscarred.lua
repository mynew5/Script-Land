--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Omor the Unscarred yells: A-kreesh!
Omor the Unscarred yells: Achor she-ki! Feast, my pet! Eat your fill!
Omor the Unscarred yells: Die, weakling!
Omor the Unscarred yells: I am victorious!
Omor the Unscarred yells: I will not be defeated!
Omor the Unscarred yells: It is... not over.
Omor the Unscarred yells: You dare stand against ME?
Omor the Unscarred yells: Your insolence will be your death!]]

function Omor(Unit, Event, MiscUnit, Misc)
    Unit:RegisterEvent("Omor_Shadow_Bolt",7000,0)
    Unit:RegisterEvent("Omor_Spell_reflect",13000,0)
    Unit:RegisterEvent("Omor_Felhounds",19000,0)
    Unit:RegisterEvent("Omor_Shadow_Whip",27000,0)
    Unit:RegisterEvent("Omor_Treacherous_Aura",33000,0)
    Unit:RegisterEvent("Omor_Bane_Treachery",33000,0)
end

function Omor_Shadow_Bolt(Unit, Event, MiscUnit, Misc)
    Unit:FullCastSpellOnTarget(36987, Unit:ClosestPlayer())
end

function Omor_Spell_reflect(Unit)
    Unit:FullCastSpell(33961)
end

function Omor_Felhounds(Unit)
    Unit:SpawnCreature(18478, -1168.601, 1699.915, 91.477, 0, 18, 96000000);
    Unit:SpawnCreature(18478, -1160.796, 1689.295, 91.646, 0, 18, 96000000)
end

function Omor_Shadow_Whip(Unit, Event, MiscUnit, Misc)
    Unit:FullCastSpellOnTarget(30638, Unit:RandomPlayer())
end

function Omor_Treacherous_Aura(Unit, Event, MiscUnit, Misc)
    Unit:FullCastSpellOnTarget(30695, Unit:RandomPlayer())
end

function Omor_Bane_Treachery(Unit, Event, MiscUnit, Misc)
    Unit:FullCastSpellOnTarget(37566, Unit:RandomPlayer())
end

RegisterUnitEvent(17308,1,"Omor")