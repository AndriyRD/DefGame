-- Compiled with roblox-ts v2.1.0
local GAME_MODE_IDS
do
	local _inverse = {}
	GAME_MODE_IDS = setmetatable({}, {
		__index = _inverse,
	})
	GAME_MODE_IDS.TEAM_WARS = "TEAM_WARS"
	_inverse.TEAM_WARS = "TEAM_WARS"
end
return {
	GAME_MODE_IDS = GAME_MODE_IDS,
}
