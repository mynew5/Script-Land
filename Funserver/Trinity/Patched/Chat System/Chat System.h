#include "Setup.h"

bool ContainsString(const char * Message)
{
	if (Message[0] == '#' && Message[1] == 'c')
	{
		return true;
	}
	return false;
}

std::string MakeString(const char * Message)
{
	string newmsg = static_cast<string>(Message);
	return newmsg;
}

void DisplayString(const char * message)
{
	sWorld.SendWorldText(message);
}

void ParseString(Player * pPlayer, const char * Message)
{
	string currentmsg = MakeString(Message);
	string newmsg = "[";
	if (pPlayer->GetSession()->CanUseCommand('z'))
	{
		newmsg+= "Admin";
	}
	else if (pPlayer->GetSession()->HasGMPermissions())
	{
		newmsg+= "GM";
	}
	newmsg += "][";
	newmsg += pPlayer->GetName();
	newmsg += "]: ";
	newmsg += currentmsg.substr((currentmsg.find("#c") + 2));

	const char * message = &newmsg[0];
	DisplayString(message);
}



bool ChatSystem(Player * pPlayer, uint32 Type, uint32 Lang, const char * Message, const char * Misc)
{
	if (ContainsString(Message))
	{
		ParseString(pPlayer, Message);
		return false;
	}
	return true;
}

void SetupChatSystem(ScriptMgr * mgr)
{
	mgr->register_hook(SERVER_HOOK_EVENT_ON_CHAT, &ChatSystem);
}