-- Compiled with roblox-ts v2.1.0
local EntityStorageUnpacked
do
	EntityStorageUnpacked = setmetatable({}, {
		__tostring = function()
			return "EntityStorageUnpacked"
		end,
	})
	EntityStorageUnpacked.__index = EntityStorageUnpacked
	function EntityStorageUnpacked.new(...)
		local self = setmetatable({}, EntityStorageUnpacked)
		return self:constructor(...) or self
	end
	function EntityStorageUnpacked:constructor(storage)
		self.storage = storage
		storage.AddedEntity.Event:Connect(function(m)
			return self:UnpackEntityModel(m)
		end)
	end
	function EntityStorageUnpacked:UnpackEntityModel(model)
		local _exp = model:GetDescendants()
		local _arg0 = function(item)
			item.Parent = model
			return item.Parent
		end
		for _k, _v in _exp do
			_arg0(_v, _k - 1, _exp)
		end
		print("Added new entity: " .. tostring(model))
	end
	function EntityStorageUnpacked:GetEntityByDescendant(inst)
		local entityModel = inst.Parent
		if entityModel then
			if entityModel:HasTag(self.storage:GetTagMarker()) then
				return {
					Result = true,
					Entity = self.storage:TryGetByEntityModel(entityModel),
				}
			end
		end
		return {
			Result = false,
			Entity = nil,
		}
	end
end
return {
	EntityStorageUnpacked = EntityStorageUnpacked,
}
