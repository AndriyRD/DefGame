-- Compiled with roblox-ts v2.1.0
local Building
do
	Building = {}
	function Building:constructor(model)
		self.model = model
	end
	function Building:OnDestroy()
		self.model:Destroy()
		self.model = nil
		table.clear(self)
	end
end
return {
	Building = Building,
}
