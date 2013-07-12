--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, Janurary 19, 2011 - 2013. ]]

numOfUIs = 1;
TEXT = tostring;
EmoteList = {
	"WAVE",
	"BOW",
	"DANCE",
	"APPLAUD",
	"BEG",
	"CHEER",
	"CHICKEN",
	"CRY",
	"EAT",
	"FLEX",
	"KISS",
	"LAUGH",
	"POINT",
	"ROAR",
	"RUDE",
	"SALUTE",
	"SHY",
	"TALK",
	"STAND",
	"SIT",
	"SLEEP",
	"KNEEL",
};

MyTable = { };
MyTable["GUI"] = "Linghuye";
MyTable["Network"] = "Fredazsq";
MyTable["Game"] = "mjq";
MyTable["Funney"] = "hyj";

function MyScriptFunc()
	appGame:ShowMessage(EmoteList[numOfUIs]);
end

function MyScriptFunc3()
	appGame:ShowMessage(EmoteList[numOfUIs]);
end

MyFunc = function(msg)
	appGame:ShowMessage(msg);
end

function MyScriptFunc8()
	if(AddFunc(1, 3) == 5) then
		appGame:ShowMessage("Script to Script");
	end	
end

function AddFunc(a, b)
	return a+b;
end
