-- Compiled with roblox-ts v2.1.0
local Building
do
	Building = {}
	function Building:constructor(model)
		self.model = model
		self.buildingModelInstance = model.GetInstance()
	end
	function Building:OnDestroy()
		self.model.GetInstance():Destroy()
		self.model = nil
		table.clear(self)
	end
end
return {
	Building = Building,
}
