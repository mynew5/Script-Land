#ifndef PvPMgr_H
#define PvPMgr_H

#include "StdAfx.h"

#define CLEAN_DELAY 20000

class PvPMgr
{

	public:
		uint32 Index; // Player GUID
		uint32 CurrentKills;
		uint32 LastGuid;
		uint32 VP;

		
		PvPMgr();
		bool ChecksPassed(Player * Attcker, Player * Vct);
		void Killed(Player * killer);
		uint32 getHowManyTimesKilled(Player* killer);

		map<uint32, uint32> KillerMap;
};

class PvPStorage
{
	private:
		static PvPStorage *Instance;
		vector<PvPMgr*> Vect;
		vector<PvPMgr*>::iterator Itr;
		Mutex StorageLock;
		
		PvPStorage();
		void CleanVect();

	public:
		static PvPStorage *GetInstance();
		PvPMgr *CreateMgr(const uint32 &Index);
		PvPMgr *GetMgr(const uint32 &Index, const bool Create);
		vector<PvPMgr*> GetVect() 
		{
			return Vect;
		}
};

#endif