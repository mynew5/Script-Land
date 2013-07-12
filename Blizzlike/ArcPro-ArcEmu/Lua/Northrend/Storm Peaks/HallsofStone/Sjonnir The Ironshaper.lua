--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local Sjonnir = 27978

function SjonnirTheIronshaper_OnCombat(pUnit, Event)
  pUnit:RegisterEvent("Sjonnir_ChainLightning", 7000, 0)
  pUnit:RegisterEvent("Sjonnir_LightningRing", 5000, 0)
  pUnit:RegisterEvent("Sjonnir_LightningShield", 28000, 0)
  pUnit:RegisterEvent("Sjonnir_StaticCharge", 500, 0)
  pUnit:RegisterEvent("Sjonnir_Frenzy", 600000, 1)
end

function Sjonnir_ChainLightning(pUnit, Event)
	pUnit:CastSpellOnTarget(50830, pUnit:GetRandomPlayer(0))
	plr:CastspellOnTarget(50830, pUnit:GetRandomPlayer(0):GetClosestFriend())
	plrfr:CastSpellOnTarget(50830, pUnit:GetRandomPlayer(0):GetClosestFriend():GetClosestFriend())
end
	
function Sjonnir_LightningRing(pUnit, Event)
    pUnit:CastSpellOnTarget(50841, pUnit:GetRandomPlayer(0))
	pUnit:GetRandomPlayer(0):AddAura(50841, 15000)
end

function Sjonnir_LightningShield(pUnit, Event)
	pUnit:CastSpell(59845)
	pUnit:AddAura(59845, 600000)
end

function Sjonnir_StaticCharge(pUnit, Event)
    if(pUnit:GetDistanceYards(pUnit:GetClosestEnemy()) < 3) then
	  pUnit:GetClosestEnemy():AddAura(50835, 10000)
	end
end

function Sjonnir_Frenzy(pUnit, Event)
	pUnit:CastSpell(28747)
end

RegisterUnitEvent(Sjonnir, 1, "SjonnirTheIronshaper_OnCombat")