-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponContainer = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponContainer").WeaponContainer
local WeaponFactory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponFactory").WeaponFactory
local WeaponContainerFactory
do
	WeaponContainerFactory = setmetatable({}, {
		__tostring = function()
			return "WeaponContainerFactory"
		end,
	})
	WeaponContainerFactory.__index = WeaponContainerFactory
	function WeaponContainerFactory.new(...)
		local self = setmetatable({}, WeaponContainerFactory)
		return self:constructor(...) or self
	end
	function WeaponContainerFactory:constructor(factories)
		self.factories = factories
		self.weaponFactory = WeaponFactory.new()
	end
	function WeaponContainerFactory:Create(owner, model)
		local weapon = self.weaponFactory:CreateByModel(owner, model)
		local _factories = self.factories
		local _handlerType = weapon:GetConfig().HandlerType
		local handlerFactory = _factories[_handlerType]
		if not handlerFactory then
			error("Not found weapon handler-factory: (" .. (weapon:GetName() .. ")"))
		end
		local hitHandler = handlerFactory.CreateHitHandler(weapon)
		return WeaponContainer.new(weapon, handlerFactory.CreateFireHandler(weapon, hitHandler), hitHandler)
	end
end
return {
	WeaponContainerFactory = WeaponContainerFactory,
}
