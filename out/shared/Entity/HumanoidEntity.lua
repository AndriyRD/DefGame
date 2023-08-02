-- Compiled with roblox-ts v2.1.0
local HumanoidEntity
do
	HumanoidEntity = {}
	function HumanoidEntity:constructor(model)
		self.model = model
		self.Events = {
			ChangeHealth = Instance.new("BindableEvent"),
			Died = Instance.new("BindableEvent"),
		}
		self.model = model
		self.humanoid = self.model:FindFirstChildOfClass("Humanoid")
		if not self.humanoid then
			error("Not found Humanoid instance in entity: " .. tostring(model))
		end
		self:SetEventsHandles()
	end
	function HumanoidEntity:OnDied()
		self.Events.Died:Fire(self.model)
	end
	function HumanoidEntity:OnChangeHealth()
		self.Events.ChangeHealth:Fire(self.model)
	end
	function HumanoidEntity:SetEventsHandles()
		self.humanoid.Died:Connect(function()
			return self:OnDied()
		end)
		self.humanoid:GetPropertyChangedSignal("Health"):Connect(function()
			return self:OnChangeHealth()
		end)
	end
	function HumanoidEntity:Dispose()
		self.Events.ChangeHealth:Destroy()
		self.Events.Died:Destroy()
		self.humanoid = nil
		self.model = nil
		table.clear(self)
	end
	function HumanoidEntity:GetModel()
		return self.model
	end
	function HumanoidEntity:TakeDamage(value)
		self.humanoid:TakeDamage(value)
		return self
	end
end
return {
	HumanoidEntity = HumanoidEntity,
}
