-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local RemoteProvider
do
	RemoteProvider = setmetatable({}, {
		__tostring = function()
			return "RemoteProvider"
		end,
	})
	RemoteProvider.__index = RemoteProvider
	function RemoteProvider.new(...)
		local self = setmetatable({}, RemoteProvider)
		return self:constructor(...) or self
	end
	function RemoteProvider:constructor()
	end
	function RemoteProvider:GetForEquipment()
		return {
			Select = self.dirs.Equipemnt:WaitForChild("SelectEquipment"),
		}
	end
	function RemoteProvider:GetForWeapon()
		return {
			CreateWeapon = self.dirs.Weapon:WaitForChild("CreateWeapon"),
			StartFire = self.dirs.Weapon:WaitForChild("StartFire"),
			StopFire = self.dirs.Weapon:WaitForChild("StopFire"),
		}
	end
	function RemoteProvider:GetForBuild()
		return {
			Build = self.dirs.Build:WaitForChild("Build"),
		}
	end
	RemoteProvider.dirs = {
		Equipemnt = ReplicatedStorage:WaitForChild("Equipment"):WaitForChild("Remote"),
		Weapon = ReplicatedStorage:WaitForChild("Weapon"):WaitForChild("Remote"),
		Build = ReplicatedStorage:WaitForChild("Build"):WaitForChild("Remote"),
	}
end
return {
	RemoteProvider = RemoteProvider,
}
