{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\f0\fs20 ================================================== ================\par
=======================\par
Script by Bonedeath6\par
Please do not change author.\par
I will allow you to change the spells tho.\par
================================================== ================\par
\par
\par
\par
function Healer Of The Gods_OnGossip(unit, event, player)\par
unit:GossipCreateMenu(50, player, 0)\par
unit:GossipMenuAddItem(0, "Heal me please.", 1, 0)\par
if(intid == 1) then\par
function SayThis(Unit,event)\par
local plr = Unit:GetMainTank()\par
if plr ~= nil then\par
Unit:SendChatMessage(14,0,plr:GetName().."I have healed you with my almighty powers.")\par
Unit:CastSpellOnTarget(30839,:GetClosestPlayer())\par
Unit:GetClosestPlayer()\par
if(intid == Hasaura(30839)\par
Unit::RemoveAllAuras()\par
end\par
end\par
\par
RegisterUnitEvent(78000, 1, "Hell Reaver_OnCombat")\par
whereas\par
function On_Gossip(Unit,event)\par
Unit:CastSpellOnTarget(30839,:GetClosestPlayer())\par
Unit:GetClosestPlayer()\par
if(intid == Hasaura(30839)\par
Unit::RemoveAllAuras()\par
end\par
}
 