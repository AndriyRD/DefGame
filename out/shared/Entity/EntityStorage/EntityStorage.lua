-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local CollectionService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local EntityFactory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "EntityFactory").EntityFactory
local EntityStorage
do
	EntityStorage = setmetatable({}, {
		__tostring = function()
			return "EntityStorage"
		end,
	})
	EntityStorage.__index = EntityStorage
	function EntityStorage.new(...)
		local self = setmetatable({}, EntityStorage)
		return self:constructor(...) or self
	end
	function EntityStorage:constructor(entityTag, startEntitiesModels)
		if startEntitiesModels == nil then
			startEntitiesModels = {}
		end
		self.entityTag = entityTag
		self.entities = {}
		self.connections = {
			addEntity = nil,
			removeEntity = nil,
		}
		self.AddedEntity = Instance.new("BindableEvent")
		for _, entityModel in startEntitiesModels do
			if self:IsEntityModel(entityModel) then
				self:AddEntity(entityModel)
			end
		end
	end
	function EntityStorage:IsEntityDescendant(inst)
		for _k, _v in self.entities do
			local e = { _k, _v }
			if inst:IsDescendantOf(e[2]:GetModel()) then
				return { true, e[2] }
			end
		end
		return { false, nil }
	end
	function EntityStorage:IsEntityModel(model)
		return model:HasTag(self.entityTag)
	end
	function EntityStorage:AddEntity(model)
		local entity = EntityFactory:Create(model)
		local _entities = self.entities
		local _model = model
		_entities[_model] = entity
		self.AddedEntity:Fire(entity:GetModel())
	end
	function EntityStorage:RemoveEntity(model)
		local _entities = self.entities
		local _model = model
		_entities[_model] = nil
	end
	function EntityStorage:EnableAutoRegister()
		self.connections.addEntity = CollectionService:GetInstanceAddedSignal(self.entityTag):Connect(function(inst)
			return self:AddEntity(inst)
		end)
		self.connections.removeEntity = CollectionService:GetInstanceAddedSignal(self.entityTag):Connect(function(inst)
			return self:RemoveEntity(inst)
		end)
	end
	function EntityStorage:DisableAutoRegister()
		self.connections.addEntity:Disconnect()
		self.connections.removeEntity:Disconnect()
	end
	function EntityStorage:GetTagMarker()
		return self.entityTag
	end
	function EntityStorage:AddIfIsEntity(models)
		for _, item in models do
			if self:IsEntityModel(item) then
				self:AddEntity(item)
			end
		end
		return self
	end
	function EntityStorage:AddFromInstanceChildren(inst)
		for _, item in inst:GetChildren() do
			if item:IsA("Model") and self:IsEntityModel(item) then
				self:AddEntity(item)
			end
		end
		return self
	end
	function EntityStorage:GetEntityByDescendant(inst)
		local res = self:IsEntityDescendant(inst)
		return {
			Result = res[1],
			Entity = res[2],
		}
	end
	function EntityStorage:TryGetByEntityModel(model)
		local _entities = self.entities
		local _model = model
		return _entities[_model]
	end
	function EntityStorage:AutoRegisterMode(enable)
		if enable then
			self:EnableAutoRegister()
		else
			self:DisableAutoRegister()
		end
		return self
	end
end
return {
	EntityStorage = EntityStorage,
}
