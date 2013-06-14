--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Lards_Picnic_Basket_onUse(Unit, Event)
	Unit:SpawnCreature(14748, 401.681061, -4825.897949, 9.381310, 3.16951, 95, 540000)
	Unit:SpawnCreature(14748, 403.259125, -4830.528320, 8.991310, 3.16951, 95, 540000)
	Unit:SpawnCreature(14748, 404.802185, -4820.998535, 10.790082, 3.16951, 95, 540000)
end

RegisterGameObjectEvent(179910, 2, "Lards_Picnic_Basket_onUse")