-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local Equipment = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Equipment").Equipment
local EQUIPMENT_CONFIG_LIST = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENT_CONFIG_LIST")
local GetCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetCharacter")
local equipmentDir = ReplicatedStorage:WaitForChild("Equipment")
local models = equipmentDir:WaitForChild("Models")
local EquipmentFactory
do
	EquipmentFactory = setmetatable({}, {
		__tostring = function()
			return "EquipmentFactory"
		end,
	})
	EquipmentFactory.__index = EquipmentFactory
	function EquipmentFactory.new(...)
		local self = setmetatable({}, EquipmentFactory)
		return self:constructor(...) or self
	end
	function EquipmentFactory:constructor()
	end
	function EquipmentFactory:Create(owner, name, option)
		local equipmentModel = nil
		if not option then
			local originModel = models:FindFirstChild(name)
			if not originModel then
				error("Not found equipment-model for: " .. name)
			end
			equipmentModel = originModel:Clone()
			equipmentModel.Parent = GetCharacter(owner)
		else
			equipmentModel = option.Model
		end
		local grip = nil
		if not option then
			grip = Instance.new("Motor6D", equipmentModel.PrimaryPart)
			if not grip then
				error("Not found grip in equipment: " .. name)
			end
		else
			grip = option.Grip
		end
		local _name = name
		local config = EQUIPMENT_CONFIG_LIST[_name]
		if not config then
			error("Not found config for equipment: " .. name)
		end
		return Equipment.new(name, owner, equipmentModel, config, grip)
	end
end
return {
	EquipmentFactory = EquipmentFactory,
}
