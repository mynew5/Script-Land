--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Sunblade Protector
function SUNBLADE_PROTECTOR_LIGHTING(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46480, Unit:GetRandomPlayer(0))
end

function SUNBLADE_PROTECTOR_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_PROTECTOR_LIGHTING", 10000, 0)
end

function SUNBLADE_PROTECTOR_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_PROTECTOR_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Cabalist
function SUNBLADE_CABALIST_IGNITE_MANA(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46543, Unit:GetRandomPlayer(4))
end

function SUNBLADE_CABALIST_SUMMON_IMP(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46544, Unit:GetRandomPlayer(0))
end

function SUNBLADE_CABALIST_SHADOWBOLT(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(47248, Unit:GetRandomPlayer(0))
end

function SUNBLADE_CABALIST_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_CABALIST_IGNITE_MANA", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_CABALIST_SUMMON_IMP", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_CABALIST_SHADOWBOLT", 5000, 0)
end

function SUNBLADE_CABALIST_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_CABALIST_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Arch Mage
function SUNBLADE_ARCHMAGE_ARCANE_EXPLOSION(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46553, Unit:GetRandomPlayer(0))
end

function SUNBLADE_ARCHMAGE_FROSTNOVA(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46555, Unit:GetClosestPlayer())
end

function SUNBLADE_ARCHMAGE_BLINK(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46573, Unit:GetRandomPlayer(0))
end

function SUNBLADE_ARCHMAGE_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_ARCHMAGE_ARCANE_EXPLOSION", 5000, 0)
    Unit:RegisterEvent("SUNBLADE_ARCHMAGE_FROSTNOVA", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_ARCHMAGE_BLINK", 20000, 0)
end

function SUNBLADE_ARCHMAGE_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_ARCHMAGE_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Dawn Priest
function SUNBLADE_DAWNPRIEST_RENEW(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46563, Unit:GetRandomFriend(0))
end

function SUNBLADE_DAWNPRIEST_HOLYNOVA(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46564, Unit:GetRandomPlayer(1))
end

function SUNBLADE_DAWNPRIEST_HOLYFORM(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46565, Unit:GetRandomPlayer(0))
end

function SUNBLADE_DAWNPRIEST_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_DAWNPRIEST_RENEW", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_DAWNPRIEST_HOLYNOVA", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_DAWNPRIEST_HOLYFORM", 20000, 0)
end

function SUNBLADE_DAWNPRIEST_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_DAWNPRIEST_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Dragonhawk
function SUNBLADE_DRAGONHAWK_FLAMEBREATH(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(47251, Unit:GetRandomPlayer(1))
end

function SUNBLADE_DRAGONHAWK_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_DRAGONHAWK_FLAMEBREATH", 8000, 0)
end

function SUNBLADE_DRAGONHAWK_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_DRAGONHAWK_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Dusk Priest
function SUNBLADE_DUSK_PRIEST_SHADOWORD_PAIN(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46560, Unit:GetRandomPlayer(0))
end

function SUNBLADE_DUSK_PRIEST_FEAR(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46561, Unit:GetRandomPlayer(1))
end

function SUNBLADE_DUSK_PRIEST_MIND_FLAY(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(47262, Unit:GetRandomPlayer(2))
end

function SUNBLADE_DUSK_PRIEST_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_DUSK_PRIEST_SHADOWORD_PAIN", 15000, 0)
    Unit:RegisterEvent("SUNBLADE_DUSK_PRIEST_FEAR", 15000, 0)
    Unit:RegisterEvent("SUNBLADE_DUSK_PRIEST_MIND_FLAY", 10000, 0)
end

function SUNBLADE_DUSK_PRIEST_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_DUSK_PRIEST_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Scout
function SUNBLADE_SCOUT_SINISTER_STRIKE(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46558, Unit:GetRandomPlayer(1))
end

function SUNBLADE_SCOUT_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_SCOUT_SINISTER_STRIKE", 5000, 0)
end

function SUNBLADE_SCOUT_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_SCOUT_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--SUNBLADE SLAYER
function SUNBLADE_SLAYER_SLAYING_SHOT(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46557, Unit:GetRandomPlayer(2))
end

function SUNBLADE_SLAYER_SHOOT(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(47001, Unit:GetRandomPlayer(2))
end

function SUNBLADE_SLAYER_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_SLAYER_SLAYING_SHOT", 10000, 0)
    Unit:RegisterEvent("SUNBLADE_SLAYER_SHOOT", 10000, 0)
end

function SUNBLADE_SLAYER_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_SLAYER_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Sunblade Vindicator
function SUNBLADE_VINDICATOR_MORTAL_STRIKE(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(39171, Unit:GetClosestPlayer())
end

function SUNBLADE_VINDICATOR_CLEAVE(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46559, Unit:GetClosestPlayer())
end

function SUNBLADE_VINDICATOR_OnCombat(Unit,event)
    Unit:RegisterEvent("SUNBLADE_VINDICATOR_MORTAL_STRIKE", 10000,0)
    Unit:RegisterEvent("SUNBLADE_VINDICATOR_CLEAVE", 7000, 0)
end

function SUNBLADE_VINDICATOR_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SUNBLADE_VINDICATOR_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Shadowsword Soulbinder
function SHADOWSWORD_SOULBINDER_CURSE_OF_EXHAUSTION(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46434, Unit:GetRandomPlayer(7))
end

function SHADOWSWORD_SOULBINDER_FLASH_OF_DARKNESS(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46442, Unit:GetClosestPlayer())
end

function SHADOWSWORD_SOULBINDER_OnCombat(Unit,event)
    Unit:RegisterEvent("SHADOWSWORD_SOULBINDER_CURSE_OF_EXHAUSTION", 4000, 0)
    Unit:RegisterEvent("SHADOWSWORD_SOULBINDER_FLASH_OF_DARKNESS", 10000, 0)
end

function SHADOWSWORD_SOULBINDER_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SHADOWSWORD_SOULBINDER_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Shadowsword Assassin
function SHADOWSWORD_ASSASSIN_ASSASSINS_MARK(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(46459, Unit:GetRandomPlayer(0))
end

function SHADOWSWORD_ASSASSIN_SHADOWSTEP(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(46463, Unit:GetRandomPlayer(0))
end

function SHADOWSWORD_ASSASSIN_OnCombat(Unit,event)
    Unit:RegisterEvent("SHADOWSWORD_ASSASSIN_ASSASSINS_MARK", 4000, 0)
    Unit:RegisterEvent("SHADOWSWORD_ASSASSIN_SHADOWSTEP", 10000, 0)
end

function SHADOWSWORD_ASSASSIN_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SHADOWSWORD_ASSASSIN_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Shadowsword Lifeshaper
function SHADOWSWORD_LIFESHAPER_DRAIN_LIFE(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(46466, Unit:GetRandomPlayer(7))
end

function SHADOWSWORD_LIFESHAPER_HEALTH_FUNNEL(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46467, Unit:GetRandomFriend())
end

function SHADOWSWORD_LIFESHAPER_OnCombat(Unit,event)
    Unit:RegisterEvent("SHADOWSWORD_LIFESHAPER_DRAIN_LIFE", 10000, 0)
    Unit:RegisterEvent("SHADOWSWORD_LIFESHAPER_HEALTH_FUNNEL", 8000, 0)
end

function SHADOWSWORD_LIFESHAPER_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SHADOWSWORD_LIFESHAPER_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Shadowsword Vanquisher
function SHADOWSWORD_VANQUISHER_CLEAVE(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(46468, Unit:GetclosestPlayer())
end

function SHADOWSWORD_VANQUISHER_MELT_ARMOR(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46469, Unit:GetMainTank())
end

function SHADOWSWORD_VANQUISHER_OnCombat(Unit,event)
    Unit:RegisterEvent("SHADOWSWORD_VANQUISHER_CLEAVE", 10000, 0)
    Unit:RegisterEvent("SHADOWSWORD_VANQUISHER_MELT_ARMOR", 20000, 0)
end

function SHADOWSWORD_VANQUISHER_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SHADOWSWORD_VANQUISHER_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

--Shadowsword Manafiend
function SHADOWSWORD_MANA_FIEND_DRAIN_MANA(Unit, event, miscUnit, misc)
   Unit:FullCastSpellOnTarget(46453, Unit:GetRandomPlayer(4))
end

function SHADOWSWORD_MANA_FIEND_ARCANE_EXPLOSION(Unit, event, miscUnit, misc)
   Unit:CastSpellOnTarget(46457, Unit:GetClosestPlayer())
end

function SHADOWSWORD_MANA_FIEND_OnCombat(Unit,event)
    Unit:RegisterEvent("SHADOWSWORD_MANA_FIEND_DRAIN_MANA", 10000, 0)
    Unit:RegisterEvent("SHADOWSWORD_MANA_FIEND_ARCANE_EXPLOSION", 8000, 0)
end

function SHADOWSWORD_MANA_FIEND_OnLeaveCombat(Unit,Event)
    Unit:RemoveEvents()
end

function SHADOWSWORD_MANA_FIEND_OnDied(Unit,Event)
    Unit:RemoveEvents()
end

RegisterUnitEvent(25483, 1,"SHADOWSWORD_MANA_FIEND_OnCombat")
RegisterUnitEvent(25483, 2,"SHADOWSWORD_MANA_FIEND_OnLeaveCombat")
RegisterUnitEvent(25483, 4,"SHADOWSWORD_MANA_FIEND_OnDied")
RegisterUnitEvent(25486, 1,"SHADOWSWORD_VANQUISHER_OnCombat")
RegisterUnitEvent(25486, 2,"SHADOWSWORD_VANQUISHER_OnLeaveCombat")
RegisterUnitEvent(25486, 4,"SHADOWSWORD_VANQUISHER_OnDied")
RegisterUnitEvent(25506, 1,"SHADOWSWORD_LIFESHAPER_OnCombat")
RegisterUnitEvent(25506, 2,"SHADOWSWORD_LIFESHAPER_OnLeaveCombat")
RegisterUnitEvent(25506, 4,"SHADOWSWORD_LIFESHAPER_OnDied")
RegisterUnitEvent(25484, 1,"SHADOWSWORD_ASSASSIN_OnCombat")
RegisterUnitEvent(25484, 2,"SHADOWSWORD_ASSASSIN_OnLeaveCombat")
RegisterUnitEvent(25484, 4,"SHADOWSWORD_ASSASSIN_OnDied")
RegisterUnitEvent(25373, 1,"SHADOWSWORD_SOULBINDER_OnCombat")
RegisterUnitEvent(25373, 2,"SHADOWSWORD_SOULBINDER_OnLeaveCombat")
RegisterUnitEvent(25373, 4,"SHADOWSWORD_SOULBINDER_OnDied")
RegisterUnitEvent(25369, 1, "SUNBLADE_VINDICATOR_OnCombat")
RegisterUnitEvent(25369, 2, "SUNBLADE_VINDICATOR_OnLeaveCombat")
RegisterUnitEvent(25369, 4, "SUNBLADE_VINDICATOR_OnDied")
RegisterUnitEvent(25368, 1, "SUNBLADE_SLAYER_OnCombat")
RegisterUnitEvent(25368, 2, "SUNBLADE_SLAYER_OnLeaveCombat")
RegisterUnitEvent(25368, 4, "SUNBLADE_SLAYER_OnDied")
RegisterUnitEvent(25372, 1, "SUNBLADE_SCOUT_OnCombat")
RegisterUnitEvent(25372, 2, "SUNBLADE_SCOUT_OnLeaveCombat")
RegisterUnitEvent(25372, 4, "SUNBLADE_SCOUT_OnDied")
RegisterUnitEvent(25370, 1, "SUNBLADE_DUSK_PRIEST_OnCombat")
RegisterUnitEvent(25370, 2, "SUNBLADE_DUSK_PRIEST_OnLeaveCombat")
RegisterUnitEvent(25370, 4, "SUNBLADE_DUSK_PRIEST_OnDied")
RegisterUnitEvent(25867, 1, "SUNBLADE_DRAGONHAWK_OnCombat")
RegisterUnitEvent(25867, 2, "SUNBLADE_DRAGONHAWK_OnLeaveCombat")
RegisterUnitEvent(25867, 4, "SUNBLADE_DRAGONHAWK_OnDied")
RegisterUnitEvent(25371, 1, "SUNBLADE_DAWNPRIEST_OnCombat")
RegisterUnitEvent(25371, 2, "SUNBLADE_DAWNPRIEST_OnLeaveCombat")
RegisterUnitEvent(25371, 4, "SUNBLADE_DAWNPRIEST_OnDied")
RegisterUnitEvent(25363, 1, "SUNBLADE_CABALIST_OnCombat")
RegisterUnitEvent(25363, 2, "SUNBLADE_CABALIST_OnLeaveCombat")
RegisterUnitEvent(25363, 4, "SUNBLADE_CABALIST_OnDied")
RegisterUnitEvent(25367, 1, "SUNBLADE_ARCHMAGE_OnCombat")
RegisterUnitEvent(25367, 2, "SUNBLADE_ARCHMAGE_OnLeaveCombat")
RegisterUnitEvent(25367, 4, "SUNBLADE_ARCHMAGE_OnDied")
RegisterUnitEvent(25507, 1, "SUNBLADE_PROTECTOR_OnCombat")
RegisterUnitEvent(25507, 2, "SUNBLADE_PROTECTOR_OnLeaveCombat")
RegisterUnitEvent(25507, 4, "SUNBLADE_PROTECTOR_OnDied")