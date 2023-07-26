-- Compiled with roblox-ts v2.1.0
local LIFE_CICLE_MODS
do
	local _inverse = {}
	LIFE_CICLE_MODS = setmetatable({}, {
		__index = _inverse,
	})
	LIFE_CICLE_MODS.HEARTBEAT = "Heartbeat"
	_inverse.Heartbeat = "HEARTBEAT"
	LIFE_CICLE_MODS.RENDER_STEPPED = "RenderStepped"
	_inverse.RenderStepped = "RENDER_STEPPED"
end
return {
	LIFE_CICLE_MODS = LIFE_CICLE_MODS,
}
