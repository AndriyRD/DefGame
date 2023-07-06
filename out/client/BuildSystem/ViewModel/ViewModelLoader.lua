-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local ViewModelLoader
do
	ViewModelLoader = setmetatable({}, {
		__tostring = function()
			return "ViewModelLoader"
		end,
	})
	ViewModelLoader.__index = ViewModelLoader
	function ViewModelLoader.new(...)
		local self = setmetatable({}, ViewModelLoader)
		return self:constructor(...) or self
	end
	function ViewModelLoader:constructor()
	end
	function ViewModelLoader:Load(name)
		local origin = GlobalConfig.BUILDING_MODEL_STORAGE:WaitForChild(name)
		if not origin then
			error("Not found building-model by name: " .. name)
		end
		return origin:Clone()
	end
end
return {
	ViewModelLoader = ViewModelLoader,
}
