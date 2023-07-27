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
	GlobalConfig.CHARACTER_ALIGHT_ISNTANCE = ReplicatedStorage:WaitForChild("CharAlignOrientation")
	GlobalConfig.BIND_DATA = {
		Weapon = {
			Fire = {
				Action = "WeaponFireAction",
				PC = {
					Input = Enum.UserInputType.MouseButton1,
				},
			},
			Reload = {
				Action = "WeaponReloadAction",
				PC = {
					Input = Enum.KeyCode.R,
				},
			},
		},
		Build = {
			Cancel = {
				Action = "CancleBuildAction",
				PC = {
					Input = { Enum.KeyCode.T, Enum.UserInputType.MouseButton2 },
				},
			},
			Build = {
				Action = "BuildAction",
				PC = {
					Input = Enum.UserInputType.MouseButton1,
				},
			},
			Rotate = {
				Action = "RotateBuildingAction",
				PC = {
					Input = { Enum.KeyCode.Q, Enum.KeyCode.E },
				},
			},
			UI = {
				Action = "ShowBuildUI",
				PC = {
					Input = Enum.KeyCode.B,
				},
			},
		},
		Run = {
			Action = "RunAction",
			Input = {
				PC = Enum.KeyCode.LeftShift,
			},
		},
	}
	GlobalConfig.REPLICATE_PACKAGES_ID = {
		FIRE = "Fire",
	}
	GlobalConfig.SHELTER = {
		IDLE_ANIMATION_ID = "14134513942",
		HIDE_ANIMATION_ID = "14134503194",
	}
	GlobalConfig.ATTRIBUTES_NAMES = {
		GAME_MODE = "GameMode",
		IS_STARTING_GAME = "IsStarting",
	}
	GlobalConfig.MAP_MODEL_STORAGE = ReplicatedStorage:WaitForChild("Maps")
	GlobalConfig.BUILDING_MODEL_STORAGE = ReplicatedStorage:WaitForChild("Build"):WaitForChild("Models")
	GlobalConfig.MAP_TERRAIN_CONTAINER_NAME = "Tarrain"
	GlobalConfig.LAODED_MAP_NAME = "Map"
	GlobalConfig.HP_ATTRIBUtE_NAME = "HP"
	GlobalConfig.UI_MAIN_SCREEN_NAME = "MainUI"
	GlobalConfig.RUN_STATE_TAG_NAME = "Running"
	GlobalConfig.BUILDING_GLOBAL_ID_INSTANCE_NAME = "GlobalID"
end
return {
	GlobalConfig = GlobalConfig,
}
