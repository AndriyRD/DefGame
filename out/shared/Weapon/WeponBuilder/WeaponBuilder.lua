-- Compiled with roblox-ts v2.1.0
local WeaponBuilder
do
	WeaponBuilder = {}
	function WeaponBuilder:constructor()
		self.buildData = {}
	end
	function WeaponBuilder:ParseModel(model)
		self.buildData.WeaponModel = self.modelParser:Parse(model)
		return self
	end
	function WeaponBuilder:SetConfig(config)
		self.buildData.Config = config
		return self
	end
	function WeaponBuilder:SetFireModuleFactory(factory)
		self.createFireModule = factory
		return self
	end
	function WeaponBuilder:Build()
		local weaponModel = self.buildData.WeaponModel
		local config = self.buildData.Config
		if not weaponModel or (not config or not self.createFireModule) then
			error("Not inited parameters for " .. (script.Name .. ".Build()"))
		end
		table.clear(self.buildData)
		return self:CreateWeapon(weaponModel, config)
	end
end
return {
	WeaponBuilder = WeaponBuilder,
}
