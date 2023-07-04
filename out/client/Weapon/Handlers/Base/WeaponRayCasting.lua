-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter").ReloadableCharacter
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local WeaponRayCasting
do
	WeaponRayCasting = setmetatable({}, {
		__tostring = function()
			return "WeaponRayCasting"
		end,
	})
	WeaponRayCasting.__index = WeaponRayCasting
	function WeaponRayCasting.new(...)
		local self = setmetatable({}, WeaponRayCasting)
		return self:constructor(...) or self
	end
	function WeaponRayCasting:constructor(owner)
		self.owner = owner
		self.rayParams = RaycastParams.new()
		self.RANGE = 100
		self.char = ReloadableCharacter.new(owner)
		self.rayParams.FilterType = Enum.RaycastFilterType.Exclude
		self.rayParams.FilterDescendantsInstances = { self.char:GetCharacter(), GlobalConfig.DEBRIS }
	end
	function WeaponRayCasting:Cast()
		local root = self.char:GetRoot()
		local _fn = Workspace
		local _exp = root.Position
		local _lookVector = root.CFrame.LookVector
		local _rANGE = self.RANGE
		return _fn:Raycast(_exp, _lookVector * _rANGE, self.rayParams)
	end
end
return {
	WeaponRayCasting = WeaponRayCasting,
}
