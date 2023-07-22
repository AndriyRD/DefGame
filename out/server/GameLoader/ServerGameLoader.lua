-- Compiled with roblox-ts v2.1.0
local GameLoader
do
	GameLoader = setmetatable({}, {
		__tostring = function()
			return "GameLoader"
		end,
	})
	GameLoader.__index = GameLoader
	function GameLoader.new(...)
		local self = setmetatable({}, GameLoader)
		return self:constructor(...) or self
	end
	function GameLoader:constructor()
	end
	function GameLoader:Startup()
	end
end
return {
	GameLoader = GameLoader,
}
