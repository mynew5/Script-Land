--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Gastricpenguin; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DefiasTalk_onAgro(pUnit, Event)
local spin = math.random(1,11)
    if(spin == 1) then
        pUnit:SendChatMessage(11, 0, "Taste my blade!")
        pUnit:CastSpell(8091)
    elseif(spin == 2) then
       	pUnit:SendChatMessage(11, 0, "Finally, a chance to use my sharpened blade!")
       	pUnit:CastSpell(8091)
   elseif(spin == 3) then
       	pUnit:SendChatMessage(11, 0, "I'll teach you to mess with the Defias!")
       	pUnit:CastSpell(8091)
    elseif(spin == 4) then
       	pUnit:SendChatMessage(11, 0, "Vengeance will be mine")
       	pUnit:CastSpell(8091)
    elseif(spin == 5) then
        pUnit:SendChatMessage(11, 0, "Engarde!")
        pUnit:CastSpell(8091)
    elseif(spin == 6) then
        pUnit:SendChatMessage(11, 0, "Taste my Blade!")
        pUnit:CastSpell(8091)
    elseif(spin == 7) then
        pUnit:SendChatMessage(11, 0, "Attack!")
        pUnit:CastSpell(8091)
    elseif(spin == 8) then
        pUnit:SendChatMessage(11, 0, "For the Defias!")
        pUnit:CastSpell(8091)
    elseif(spin == 9) then
        pUnit:SendChatMessage(11, 0, "You have no chance to survive!")
        pUnit:CastSpell(8091)
    elseif(spin == 10) then
        pUnit:SendChatMessage(11, 0, "You are on your way to destruction!")
        pUnit:CastSpell(8091)
    end
end

RegisterUnitEvent(38, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(94, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(95, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(116, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(121, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(122, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(215, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(449, 1, "DefiasTalk_onAgro")
--RegisterUnitEvent(450, 1, "DefiasTalk_onAgro")
--RegisterUnitEvent(467, 1, "DefiasTalk_onAgro")
--RegisterUnitEvent(474, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(481, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(504, 1, "DefiasTalk_onAgro")
--RegisterUnitEvent(550, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(583, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(589, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(590, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(594, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(598, 1, "DefiasTalk_onAgro")
--RegisterUnitEvent(619, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(634, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(636, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(657, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(824, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(909, 1, "DefiasTalk_onAgro")
RegisterUnitEvent(910, 1, "DefiasTalk_onAgro")