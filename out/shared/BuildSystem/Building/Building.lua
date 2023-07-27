-- Compiled with roblox-ts v2.1.0
local Building
do
	Building = {}
	function Building:constructor(data)
		self.model = data.Model
		self.globalID = data.ID
	end
	function Building:OnDestroy()
		self.model:Destroy()
		self.model = nil
		table.clear(self)
	end
	function Building:GetGlobalID()
		return self.globalID
	end
end
return {
	Building = Building,
}
