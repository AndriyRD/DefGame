-- Compiled with roblox-ts v2.1.0
local Magazine
do
	Magazine = setmetatable({}, {
		__tostring = function()
			return "Magazine"
		end,
	})
	Magazine.__index = Magazine
	function Magazine.new(...)
		local self = setmetatable({}, Magazine)
		return self:constructor(...) or self
	end
	function Magazine:constructor(size)
		self.size = size
		self.currentAmmo = 0
		self.Changed = Instance.new("BindableEvent")
		self.currentAmmo = size
	end
	function Magazine:Reload()
		self.currentAmmo = self.size
		self.Changed:Fire(self.currentAmmo)
	end
	function Magazine:GetCurrentAmmo()
		return self.currentAmmo
	end
	function Magazine:Take()
		self.currentAmmo -= 1
		self.Changed:Fire(self.currentAmmo)
	end
	function Magazine:AddAmmo(value)
		self.currentAmmo += value
		self.Changed:Fire(self.currentAmmo)
	end
	function Magazine:GetSize()
		return self.size
	end
end
return {
	Magazine = Magazine,
}
