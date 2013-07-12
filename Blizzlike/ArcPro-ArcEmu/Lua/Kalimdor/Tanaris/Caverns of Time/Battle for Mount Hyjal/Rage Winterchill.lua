--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: LUA++; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function winterchill_start(Unit, Event)
   	Unit:SendChatMessage(14, 0, "The Legion's final conquest has begun! Once again the subjugation of this world is within our grasp. Let none survive!")
   	Unit:PlaySoundToSet(11022)
   	Unit:RegisterEvent("winterchill_dnd", 100, 0)
   	Unit:RegisterEvent("winterchill_fa", 100, 0)
   	Unit:RegisterEvent("winterchill_enrage", 600000, 0)
end

function winterchill_dnd(Unit, Event)
   	Unit:RemoveEvents()
    local speech = math.random(1,2)
    if(speech == 1) then
       	Unit:SendChatMessage(14, 0, "Crumble and rot!")
       	Unit:PlaySoundToSet(11023)
    else
       	Unit:SendChatMessage(14, 0, "Ashes to ashes, dust to dust!")
       	Unit:PlaySoundToSet(11055)
    end
    if(Unit:GetRandomPlayer(0) ~= nil) then
    	Unit:FullCastSpellOnTarget(39658, Unit:GetRandomPlayer(0))
    end
    local nextcast = math.random(1,2)
    if(nextcast == 1) then
       	Unit:RegisterEvent("winterchill_fb", math.random(30000,60000), 0)
    else
       	Unit:RegisterEvent("winterchill_fn", math.random(30000,60000), 0)
    end
end

function winterchill_fb(Unit, Event)
   	Unit:RemoveEvents()
    local speech = math.random(1,2)
    if(speech == 1) then
       	Unit:SendChatMessage(14, 0, "Succumb to the icy chill... of death.")
        --Unit:PlaySoundToSet(ID)
    else
       	Unit:SendChatMesasge(13, 0, "It will be much colder in your grave.")
        --Unit:PlaySoundToSet(ID)
    end
    if(Unit:GetRandomPlayer(0) ~= nil) then
    	Unit:CastSpellOnTarget(41486, Unit:GetRandomPlayer(0))
    end
    local randomtimer = math.random(30000,60000)
	local nextcast = math.random(1,2)
    if(nextcast == 1) then
       	Unit:RegisterEvent("winterchill_dnd", math.random(30000,60000), 0)
    else
       	Unit:RegisterEvent("winterchill_fn", math.random(30000,60000), 0)
    end
end

function winterchill_fn(Unit, Event)
   	Unit:RemoveEvents()
    local speach = math.random(1, 2)
    if (speach == 1) then
       	Unit:SendChatMessage(14, 0, "Succumb to the icy chill... of death.")
        --	Unit:PlaySoundToSet(ID)
    elseif (speach == 2) then
       	Unit:SendChatMesasge(13, 0, "It will be much colder in your grave.")
        --	Unit:PlaySoundToSet(ID)
    end    
    local oncast =	Unit:GetRandomPlayer(0)
    if (oncast ~= nil) then
    	Unit:CastSpellOnTarget(31250, oncast)
    end
    local randomtimer = math.random(30000, 60000)
	local nextcast = math.random(1, 2)
    if (nextcast == 1) then
       	Unit:RegisterEvent("winterchill_dnd", randomtimer, 0)
    elseif (nextcast == 2) then
       	Unit:RegisterEvent("winterchill_fb", randomtimer, 0)
    end    
end

function winterchill_fa(Unit, Event)
   	Unit:RemoveEvents()
   	Unit:CastSpellOnTarget(31256, Unit)
   	Unit:RegisterEvent("winterchill_fa", math.random(30000,60000), 0)
end
    
function winterchill_enrage(Unit, Event)
   	Unit:RemoveEvents()
   	Unit:CastSpellOnTarget(46587, Unit)
end

function winterchill_killplayer(Unit, Event)
   	Unit:RemoveEvents()
    local speech = math.random(1,3)
    if(speech == 1) then
       	Unit:SendChatMessage(14, 0, "All life must perish!")
       	Unit:PlaySoundToSet(11025)
    elseif(speech == 2) then
       	Unit:SendChatMessage(14, 0, "Your world is ours now!")
       	Unit:PlaySoundToSet(11056)
    else
       	Unit:SendChatMessage(14, 0, "Victory to the Legion!")
       	Unit:PlaySoundToSet(11057)
    end
end

function winterchill_death(Unit, Event)
   	Unit:SendChatMessage(14, 0, "You have won this battle, but not... the... war.")
   	Unit:PlaySoundToSet(11026)
   	Unit:RemoveEvents()
end
    
RegisterUnitEvent(17767, 1, "winterchill_start")
RegisterUnitEvent(17767, 3, "winterchill_killplayer")
RegisterUnitEvent(17767, 4, "winterchill_death")
RegisterUnitEvent(17767, 5, "winterchill_dnd")
RegisterUnitEvent(17767, 5, "winterchill_fb")
RegisterUnitEvent(17767, 5, "winterchill_fn")
RegisterUnitEvent(17767, 5, "winterchill_fa")
RegisterUnitEvent(17767, 5, "winterchill_enrage")