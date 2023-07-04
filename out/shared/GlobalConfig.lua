-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local ReplicatedStorage = _services.ReplicatedStorage
local Workspace = _services.Workspace
local GlobalConfig
do
	GlobalConfig = setmetatable({}, {
		__tostring = function()
			return "GlobalConfig"
		end,
	})
	GlobalConfig.__index = GlobalConfig
	function GlobalConfig.new(...)
		local self = setmetatable({}, GlobalConfig)
		return self:constructor(...) or self
	end
	function GlobalConfig:constructor()
	end
	GlobalConfig.DEBRIS = Workspace:WaitForChild("Debris")
	GlobalConfig.BIND_DATA = {
		Weapon = {
			Fire = {
				Action = "WeaponFireAction",
				PC = {
					Input = Enum.UserInputType.MouseButton1,
				},
			},
		},
	}
	GlobalConfig.REPLICATE_PACKAGES_ID = {
		FIRE = "Fire",
	}
	GlobalConfig.MAP_MODEL_STORAGE = ReplicatedStorage:WaitForChild("Maps")
end
return {
	GlobalConfig = GlobalConfig,
}
