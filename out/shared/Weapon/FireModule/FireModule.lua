-- Compiled with roblox-ts v2.1.0
local FireModule
do
	FireModule = {}
	function FireModule:constructor(currentOwner, weaponData, weponModel)
		self.currentOwner = currentOwner
		self.weaponData = weaponData
		self.weponModel = weponModel
	end
end
return {
	FireModule = FireModule,
}
