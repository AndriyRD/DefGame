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
	function RemoteProvider:GetRemoteFolder(dirName)
		return ReplicatedStorage:WaitForChild(dirName):WaitForChild(RemoteProvider.REMOTE_DIR_NAME)
	end
	function RemoteProvider:GetForEquipment()
		return {
			Select = RemoteProvider.dirs.Equipment:WaitForChild("SelectEquipment"),
		}
	end
	function RemoteProvider:GetForWeapon()
		return {
			CreateWeapon = RemoteProvider.dirs.Weapon:WaitForChild("CreateWeapon"),
			HitPackage = RemoteProvider.dirs.Weapon:WaitForChild("HitPackage"),
			StartFire = RemoteProvider.dirs.Weapon:WaitForChild("StartFire"),
			StopFire = RemoteProvider.dirs.Weapon:WaitForChild("StopFire"),
			Reload = RemoteProvider.dirs.Weapon:WaitForChild("Reload"),
			Hit = RemoteProvider.dirs.Weapon:WaitForChild("Hit"),
		}
	end
	function RemoteProvider:GetForBuild()
		return {
			Build = RemoteProvider.dirs.Build:WaitForChild("Build"),
			BuildingAction = RemoteProvider.dirs.Build:WaitForChild("BuildingAction"),
		}
	end
	function RemoteProvider:GetForRunner()
		return {
			Run = RemoteProvider.dirs.Runner:WaitForChild("Run"),
			Stop = RemoteProvider.dirs.Runner:WaitForChild("Stop"),
		}
	end
	function RemoteProvider:GetForGameLoader()
		return {
			NewSession = RemoteProvider.dirs.GameLoader:WaitForChild("NewSession"),
		}
	end
	function RemoteProvider:GetTeam()
		return {
			JoinToTeam = RemoteProvider.dirs.Team:WaitForChild("JoinToTeam"),
		}
	end
	RemoteProvider.REMOTE_DIR_NAME = "Remote"
	RemoteProvider.dirs = {
		Runner = RemoteProvider:GetRemoteFolder("Runner"),
		Equipment = RemoteProvider:GetRemoteFolder("Equipment"),
		Weapon = RemoteProvider:GetRemoteFolder("Weapon"),
		Build = RemoteProvider:GetRemoteFolder("Build"),
		GameLoader = RemoteProvider:GetRemoteFolder("GameLoader"),
		Team = RemoteProvider:GetRemoteFolder("Team"),
	}
end
return {
	RemoteProvider = RemoteProvider,
}
