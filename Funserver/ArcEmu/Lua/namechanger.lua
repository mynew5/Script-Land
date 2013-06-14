NameNpc = {}
NameNpc.NpcId = 990000044			-- Put npc id here.

NameNpc.AllowedSymbols = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}

function NameNpc.NameNpcOnGossipTalk(pUnit, Event, player)
	pUnit:GossipCreateMenu(1, player, 0)
	pUnit:GossipMenuAddItem(10, "Change my name.", 5, 0)
	pUnit:GossipMenuAddItem(10, "Nevermind.", 2, 0)
	player:SendBroadcastMessage("|cffFF0000Hello there "..player:GetName()..".. im |cffFF00A0Thantos |cffFF0000, im looking for my lost spirit.. have you found any?")
	pUnit:GossipSendMenu(player)
end


function NameNpc.NameNpcOnGossipSelect(pUnit, Event, player, id, intid, code, pMisc)

	if(intid == 5) then
	if player:HasItem(90091) then
    player:GetItemCount(20)
		pUnit:GossipCreateMenu(2, player, 0)
		pUnit:GossipMenuAddItem(10, "Confirm you wish to pay 20 tokens to get a name change", 5, 0)
			pUnit:GossipMenuAddItem(10, "|cffFF0000Confirmed", 1, 1)
				pUnit:GossipSendMenu(player)
	else
	player:SendBroadcastMessage("|cffFF0000Im very sorry im not that cheap.. You need 20 |cffFF00A0 Spirit of Thantos|cffFF0000 to perform a name change!")
	player:GossipComplete()
	end
end

	if(intid == 1) then
		NameNpc[player:GetName()] = {}
		NameNpc[player:GetName()].tab = {}
		if (NameNpc.SymbolCheck(player, code) == true) then
			local StrL = string.len(""..code.."") 
			if (StrL < 13) then
				local N = string.sub(""..code.."", 1, 1) 
				local UN = string.upper(""..N.."") 
				local N2 = string.sub(""..code.."", 2, StrL) 
				local LN = string.lower(""..N2.."") 
				local Name = UN:gsub(""..UN.."", ""..UN..""..LN.."") 
				if (CharDBQuery("SELECT name FROM characters WHERE name = '"..Name.."'", 0) == false) then
					player:SendBroadcastMessage("|cffFF0000You will be disconnected in |cffFF00A05 |cffFF0000seconds. This is needed for changing your name to change.")
					local playername = player:GetName()
					RegisterTimedEvent("NameNpc.Disconnect", 5000, 1, player)
					RegisterTimedEvent("NameNpc.ChangeName", 8000, 1, playername, Name)	
					player:RemoveItem(90091, 20)
					player:GossipComplete()
				else
					player:SendBroadcastMessage("|cffFF0000This |cffFF00A0name |cffFF0000is already taken!")
				end	
			else
				player:SendBroadcastMessage("|cffFF0000The |cffFF00A0name |cffFF0000is to long!")
			end
		else
			player:SendBroadcastMessage("|cffFF0000These |cffFF00A0symbols |cffFF0000aint allowed!")
		end	
	end 
	if(intid == 2) then
		player:GossipComplete()
	end
end

function NameNpc.SymbolCheck(player, str)
	if (t == nil) or (t == 0) then
		t = 1 
	end	
	local StrL = string.len(str)
	local StrC = StrL + 1
	while (t ~= StrC) do 
		local N = string.sub(str, t, t) 
		if (table.find(NameNpc.AllowedSymbols, N) == false) then 
			t = 0
			return false
		else
			t = t + 1
			if (t == StrC) then
				t = 0
				return true
			end
		end		
	end
end	

function NameNpc.Disconnect(player)
	player:SoftDisconnect()  
end	

function NameNpc.ChangeName(playername, name)
	CharDBQuery("UPDATE characters SET name = '"..name.."' WHERE name = '"..playername.."'", 0)
end

function table.find(t, v) 
	if type(t) == "table" and v then
		for k, val in pairs(t) do
			if v == val then
				return true	
			end
		end
	end
	return false
end	

RegisterUnitGossipEvent(NameNpc.NpcId, 1, "NameNpc.NameNpcOnGossipTalk")
RegisterUnitGossipEvent(NameNpc.NpcId, 2, "NameNpc.NameNpcOnGossipSelect")