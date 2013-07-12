function EventsList( event, pPlayer, message, type, language )
if(pPlayer:IsGm() and message == "#event list" ) then
	local result = WorldDBQuery( "SELECT `name` FROM `active_event_id` LIMIT 50" );
	if( result ~= NIL ) then
		local colcount = result:GetColumnCount();
		repeat
			for col = 0, colcount-1, 1 do
				pPlayer:SendBroadcastMessage(" "..result:GetColumn( col ):GetString() .. "  " );
			end
			print();
		until result:NextRow() ~= true
	else
		pPlayer:SendBroadcastMessage("There are no events currently added or the table `active_event_id` does not exist for some reason.");
	end
end
end

RegisterServerHook( 16, "EventsList" );
