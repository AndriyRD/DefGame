-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EquipmentWrappManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EquipmentWrappManager").EquipmentWrappManager
local EquipmentRegister
do
	EquipmentRegister = setmetatable({}, {
		__tostring = function()
			return "EquipmentRegister"
		end,
	})
	EquipmentRegister.__index = EquipmentRegister
	function EquipmentRegister.new(...)
		local self = setmetatable({}, EquipmentRegister)
		return self:constructor(...) or self
	end
	function EquipmentRegister:constructor()
		self.wrapManager = EquipmentWrappManager.new()
	end
	function EquipmentRegister:RegsiterItem(equipment)
		return self.wrapManager:Wrap(equipment)
	end
	function EquipmentRegister:UnregisterItem(equipment)
		-- TODO: Unregister equipment
		return self
	end
end
return {
	EquipmentRegister = EquipmentRegister,
}
