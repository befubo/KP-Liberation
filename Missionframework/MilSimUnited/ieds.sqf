_allIED = allMines;
_allMarkers = allMissionObjects "Land_HelipadEmpty_F";

{
	_playerActive = 0;
	_list = _x nearEntities 3500;
	
	{
		if(isPlayer _x) then {
			_playerActive = 1;
		}
	} foreach _list;
	
	if(_playerActive == 0) then {
		deleteVehicle _x;
	}
} foreach _allIED;

{
	_playerActive = 0;
	_list = _x nearEntities 3500;
	
	{
		if(isPlayer _x) then {
			_playerActive = 1;
		}
	} foreach _list;
	
	if(_playerActive == 0) then {
		deleteVehicle _x;
	}
} foreach _allMarkers;

maxMines = 4;
_headlessClients = entities "HeadlessClient_F";
_humanPlayers = allPlayers - _headlessClients;
_humanPlayers call BIS_fnc_arrayShuffle;


{
	_allIED = allMines;
	_countMines = count _allIED;
		
	if(_countMines < maxMines && isTouchingGround _x) then {
		_nearestRoad = _x nearRoads 3500;
		_closeRoads = _x nearRoads 1500;
		_allowedRoads = _nearestRoad - _closeRoads;
			
		_count = count _allowedRoads;
		
		_rand = random _count;
		_rand = round _rand;
		
		_streetObject = _allowedRoads select _rand;
		_pos = getPos _streetObject;
		
		_randSpawnPos = _pos getPos [5 * sqrt random 1, random 360];
		
		_mineClassnames = ["ACE_IEDLandBig_Range","ACE_IEDUrbanBig_Range","ACE_IEDLandSmall_Range","ACE_IEDUrbanSmall_Range"];
		_usedMine = selectRandom _mineClassnames;
		
		_veh = createVehicle ["Land_HelipadEmpty_F", _randSpawnPos, [], 0, "CAN_COLLIDE"];				
		_mine = createMine [_usedMine, _randSpawnPos, [], 0];
		

		{
			_x addCuratorEditableObjects [[_veh], true];
		} foreach allCurators;

		
	}
} foreach _humanPlayers;