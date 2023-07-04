-- Compiled with roblox-ts v2.1.0
local EquipmentGlobalConfig
do
	EquipmentGlobalConfig = setmetatable({}, {
		__tostring = function()
			return "EquipmentGlobalConfig"
		end,
	})
	EquipmentGlobalConfig.__index = EquipmentGlobalConfig
	function EquipmentGlobalConfig.new(...)
		local self = setmetatable({}, EquipmentGlobalConfig)
		return self:constructor(...) or self
	end
	function EquipmentGlobalConfig:constructor()
	end
	function EquipmentGlobalConfig:GetBindData()
		local dataList = {}
		local _arg0 = {
			Action = "OneSlotAction",
			Input = Enum.KeyCode.One,
		}
		table.insert(dataList, _arg0)
		local _arg0_1 = {
			Action = "TwoSlotAction",
			Input = Enum.KeyCode.Two,
		}
		table.insert(dataList, _arg0_1)
		local _arg0_2 = {
			Action = "ThreeSlotAction",
			Input = Enum.KeyCode.Three,
		}
		table.insert(dataList, _arg0_2)
		return dataList
	end
	EquipmentGlobalConfig.WEAPON_GRIP_NAME_POSTFIX = "Grip"
	EquipmentGlobalConfig.HOT_INVENTORY_SIZE = 3
end
return {
	EquipmentGlobalConfig = EquipmentGlobalConfig,
}
