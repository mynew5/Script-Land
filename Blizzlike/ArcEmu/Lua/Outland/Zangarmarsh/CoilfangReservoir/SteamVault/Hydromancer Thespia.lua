--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Thespia(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Thespia_Cloud",8000,0)
	Unit:RegisterEvent("Thespia_Winds",10000,0)
	Unit:RegisterEvent("Thespia_Burst",13000,0)
end

function Thespia_Cloud(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(25033, Unit:GetRandomPlayer())
	Unit:SendChatMessage(12, 0, "This cloud will kill you...")
end

function Thespia_Winds(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31718, Unit:GetRandomPlayer())
	Unit:SendChatMessage(12, 0, "Let the wind immobilize you...")
end

function Thespia_Burst(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31481, Unit:GetClosestPlayer())
	Unit:SendChatMessage(12, 0, "A good burst for you...")
end

RegisterUnitEvent(17797,1,"Thespia")