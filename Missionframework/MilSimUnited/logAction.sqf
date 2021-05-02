_unit = _this select 0;

_uid = getPlayerUID _unit;
if(_uid == "76561198004905141") then {
	hint "befu!";
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
};