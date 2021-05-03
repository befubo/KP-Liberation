_unit = _this select 0;

_uid = getPlayerUID _unit;
_huber = "76561197993044168";
_breacher = "76561198091902766";
_deusit = "76561198046297709";
_befu = "76561198004905141";

if(_uid == _huber || _uid == _breacher || _uid == _deusit || _uid == _befu) then {
	_unit addAction
	[
		"<t color='#FF0000'>Dump Build Log in RPT</t>",
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			_playerActions = profileNamespace getVariable ["KV13_LogPlayerActions", []];
			["----------------- MILSIM UNITED BUILD LOG -----------------"] remoteExec ["diag_log", 2];
				{
					_name = _x select 0;
					_uid = _x select 1;
					_classname = _x select 2;
					_time = _x select 3;
					_day = _time select 2;
					if(_day < 10) then {
						_day = "0" + str _day;
					} else {
						_day = str _day;
					};
					_month = _time select 1;
					if(_month < 10) then {
						_month = "0" + str _month;
					} else {
						_month = str _month;
					};
					_year = str (_time select 0);
					_hour = _time select 3;
					if(_hour < 10) then {
						_hour = "0" + str _hour;
					} else {
						_hour = str _hour;
					};
					_minute = _time select 4;
					if(_minute < 10) then {
						_minute = "0" + str _minute;
					} else {
						_minute = str _minute;
					};
					_logText = "[" + _day + "." + _month + "." + _year + " - " + _hour + ":" + _minute + "] " + _name + "(" + _uid + "): " + _classname;
					[_logText] remoteExec ["diag_log", 2];
				} foreach _playerActions;
			["----------------- END MILSIM UNITED LOG -----------------"] remoteExec ["diag_log", 2];
		},
		nil,-99,false,true,"","true",0,false,"",""
	];
	
	_unit addAction
	[
		"<t color='#FF0000'>Dump Permission Log in RPT</t>",
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			_allPermissions = GRLIB_permissions;
			["----------------- MILSIM UNITED PERMISSION LOG -----------------"] remoteExec ["diag_log", 2];
				{
					_name = _x select 1;
					_uid = _x select 0;
					_perms = _x select 2;
					_light = "";
					_heavy = "";
					_air = "";
					_const = "";
					_recy = "";
					_other = "";
					if(_perms select 0) then { _light = "[x]"; } else { _light = "[ ]"; };
					if(_perms select 1) then { _heavy = "[x]"; } else { _heavy = "[ ]"; };
					if(_perms select 2) then { _air = "[x]"; } else { _air = "[ ]"; };
					if(_perms select 3) then { _const = "[x]"; } else { _const = "[ ]"; };
					if(_perms select 4) then { _recy = "[x]"; } else { _recy = "[ ]"; };
					if(_perms select 5) then { _other = "[x]"; } else { _other = "[ ]"; };
					
					_logText = _name + " (" + _uid + "): Light " + _light + " | Heavy " + _heavy + " | Air " + _air + " | Construction " + _const + " | Recycling " + _recy + " | Others " + _other; 
					[_logText] remoteExec ["diag_log", 2];
				} foreach _allPermissions;
			["----------------- END MILSIM UNITED LOG -----------------"] remoteExec ["diag_log", 2];
		},
		nil,-99,false,true,"","true",0,false,"",""
	];
};