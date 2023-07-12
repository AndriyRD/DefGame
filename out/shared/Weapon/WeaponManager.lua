-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponContainerFactory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponContainer", "WeaponContainerFactory").WeaponContainerFactory
local WeaponManager
do
	WeaponManager = setmetatable({}, {
		__tostring = function()
			return "WeaponManager"
		end,
	})
	WeaponManager.__index = WeaponManager
	function WeaponManager.new(...)
		local self = setmetatable({}, WeaponManager)
		return self:constructor(...) or self
	end
	function WeaponManager:constructor(handlerFactory)
		self.handlerFactory = handlerFactory
		self.containerList = {}
		self.weaponContainerFactory = WeaponContainerFactory.new(self.handlerFactory)
	end
	function WeaponManager:RegisterWeapon(plaeyr, model)
		local container = self.weaponContainerFactory:Create(plaeyr, model)
		local _containerList = self.containerList
		local _plaeyr = plaeyr
		_containerList[_plaeyr] = container
		return container
	end
	function WeaponManager:UnregisterWeapon()
	end
end
return {
	WeaponManager = WeaponManager,
}
