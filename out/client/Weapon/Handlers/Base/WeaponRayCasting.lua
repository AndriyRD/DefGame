-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter").ReloadableCharacter
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
	function WeaponRayCasting:constructor(owner, weaponModel)
		self.owner = owner
		self.rayParams = RaycastParams.new()
		self.RANGE = 100
		self.endPointOffset = Vector3.new(0, 0, -self.RANGE)
		self.char = ReloadableCharacter.new(owner)
		local ignoreList = { self.char:GetCharacter(), GlobalConfig.DEBRIS }
		if weaponModel then
			local _weaponModel = weaponModel
			table.insert(ignoreList, _weaponModel)
			local _ = #ignoreList
		else
			local _ = nil
		end
		self.rayParams.FilterType = Enum.RaycastFilterType.Exclude
		self.rayParams.FilterDescendantsInstances = ignoreList
		self.mouse = owner:GetMouse()
	end
	function WeaponRayCasting:GetDirection(startCF)
		local _lookVector = CFrame.lookAt(startCF.Position, self.mouse.Hit.Position).LookVector
		local _rANGE = self.RANGE
		return _lookVector * _rANGE
	end
	function WeaponRayCasting:Cast()
		local root = self.char:GetRoot()
		local origin = root.Position
		local res = Workspace:Raycast(origin, self:GetDirection(root.CFrame), self.rayParams)
		return {
			RaycastResult = res,
			EndPoint = root.CFrame:PointToWorldSpace(self.endPointOffset),
		}
	end
end
return {
	WeaponRayCasting = WeaponRayCasting,
}
