-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local RegenebleStat = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RegenebleStat").RegenebleStat
local CollectionService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local Entity
do
	Entity = setmetatable({}, {
		__tostring = function()
			return "Entity"
		end,
	})
	Entity.__index = Entity
	function Entity.new(...)
		local self = setmetatable({}, Entity)
		return self:constructor(...) or self
	end
	function Entity:constructor(model)
		self.model = model
		self.Events = {
			ChangeHealth = Instance.new("BindableEvent"),
			Died = Instance.new("BindableEvent"),
		}
		self.healthStat = RegenebleStat.new(self:GetHealthMaxValue())
		CollectionService:AddTag(self.model, GlobalConfig.TAGS.ENTITY)
	end
	function Entity:GetHealthMaxValue()
		return self.model:GetAttribute(GlobalConfig.ATTRIBUTES_NAMES.MAX_HEALTH_ATTRIBUTE_NAME)
	end
	function Entity:GetModel()
		return self.model
	end
	function Entity:TakeDamage(value)
		self.healthStat:RegenPause(GlobalConfig.REGEN_HEALTH_PAUSE_AFTER_DAMAGE)
		self.healthStat:Update(function(v)
			return v - value
		end)
		if self.healthStat:GetValue() <= 0 then
			self.Events.Died:Fire(self.model)
		else
			self.Events.ChangeHealth:Fire(self.model, self.healthStat:GetValue())
		end
		return self
	end
end
return {
	Entity = Entity,
}
