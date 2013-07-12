--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770, Rochet2; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[Add spawn and Despawn for Time Keeper(Search on wowhead [Time keeper])]]
function Aeonus_OnCombat(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "The time has come to shatter this clockwork universe forever! Let us no longer be slaves of the hourglass! I warn you: those who do not embrace the greater path shall become victims of its passing!")
	pUnit:RegisterEvent("Aeonus_Spell1", 20000, 0)
end

function Aeonus_Spell1(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "Let us see what fate lays in store...")
    pUnit:CastSpellOnTarget(31422, pUnit:GetMainTank())
	pUnit:RegisterEvent("Aeonus_Spell2", 30000, 0)
end

function Aeonus_Spell2(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "Your time is up, slave of the past!")
    pUnit:CastSpellOnTarget(31473, pUnit:GetMainTank())
	pUnit:Castspell(37853)
end

function Aeonus_OnLeaveCombat(pUnit, Event)
    pUnit:Castspell(37853)
end

function Aeonus_OnKilledTarget(pUnit, Event)
    if(math.random(1,2) == 1) then
        pUnit:SendChatMessage(12, 0, "No one can stop us! No one!")
    else
        pUnit:SendChatMessage(12, 0, "One less obstacle in our way!")
    end
end

function Aeonus_OnDeath(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "We will triumph.. It is only a matter...of time.")
end

RegisterUnitEvent(17881, 1, "Aeonus_OnCombat")
RegisterUnitEvent(17881, 2, "Aeonus_OnLeaveCombat")
RegisterUnitEvent(17881, 3, "Aeonus_OnKilledTarget")
RegisterUnitEvent(17881, 4, "Aeonus_OnDeath")