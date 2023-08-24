-- Compiled with roblox-ts v2.1.0
local FireModule
do
	FireModule = {}
	function FireModule:constructor(weaponData, weponModel)
		self.weaponData = weaponData
		self.weponModel = weponModel
		self.GetCurrentOwner = function()
			return self.currentOwner
		end
		self.CanFire = function()
			return self.currentOwner ~= nil
		end
	end
	function FireModule:OnChagneOwner(owner)
		self.currentOwner = owner
		return self
	end
	function FireModule:OnRemoveOwner()
		self.currentOwner = nil
	end
end
return {
	FireModule = FireModule,
}
