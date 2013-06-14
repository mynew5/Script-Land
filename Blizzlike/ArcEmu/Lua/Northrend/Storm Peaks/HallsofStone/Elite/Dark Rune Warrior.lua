--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DarkRuneWarrior_OnCombat(pUnit, Event)
   pUnit:RegisterEvent("DarkRuneWarrior_Cleave", 10000, 1)
end

function DarkRuneWarrior_Cleave(pUnit, Event)
     if(pUnit:GetClosestEnemy():GetDistanceYards(pUnit) < 5) then
	   pUnit:CastSpellOnTarget(42724, pUnit:GetClosestEnemy())
	   pUnit:RegisterEvent("DarkRuneWarrior_HeroicStrike", 10000, 1)
   end
end

function DarkRuneWarrior_HeroicStrike(pUnit, Event)
     if(pUnit:GetClosestEnemy():GetDistanceYards(pUnit) < 5) then
	   pUnit:CastSpellOnTarget(53395, pUnit:GetClosestEnemy())
	   pUnit:RegisterEvent("DarkRuneWarrior_Cleave", 10000, 1)
   end
end

RegisterUnitEvent(27960, 1, "DarkRuneWarrior_OnCombat")