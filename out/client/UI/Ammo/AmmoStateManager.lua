-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflection = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Reflection").Reflection
local AmmoStateManager
do
	AmmoStateManager = setmetatable({}, {
		__tostring = function()
			return "AmmoStateManager"
		end,
	})
	AmmoStateManager.__index = AmmoStateManager
	function AmmoStateManager.new(...)
		local self = setmetatable({}, AmmoStateManager)
		return self:constructor(...) or self
	end
	function AmmoStateManager:constructor()
		self.connections = {
			ChangeMag = nil,
			ChangeAmmo = nil,
		}
		self.Changed = Instance.new("BindableEvent")
	end
	function AmmoStateManager:OnUpdate(state)
		self.Changed:Fire(state)
	end
	function AmmoStateManager:Clear()
		for _k, _v in Reflection:ConvertObjectToMap(self.connections) do
			local conn = { _k, _v }
			conn[2]:Disconnect()
			conn[2] = nil
		end
	end
	function AmmoStateManager:SetAmmoContainer(ammoContainer)
		if self.ammoContainer then
			self:Clear()
		end
		self.ammoContainer = ammoContainer
		self.connections.ChangeAmmo = self.ammoContainer.Events.ChangeAmmo.Event:Connect(function(state)
			return self:OnUpdate(state)
		end)
		self.connections.ChangeMag = self.ammoContainer.Events.ChangeMagazine.Event:Connect(function(state)
			return self:OnUpdate(state)
		end)
		return self
	end
end
return {
	AmmoStateManager = AmmoStateManager,
}
