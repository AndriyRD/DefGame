-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflection = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Reflection").Reflection
local ASSET_INSTANCES
do
	local _inverse = {}
	ASSET_INSTANCES = setmetatable({}, {
		__index = _inverse,
	})
	ASSET_INSTANCES.Animation = "Animation"
	_inverse.Animation = "Animation"
	ASSET_INSTANCES.Sound = "Sound"
	_inverse.Sound = "Sound"
end
local AssetInstance
do
	AssetInstance = setmetatable({}, {
		__tostring = function()
			return "AssetInstance"
		end,
	})
	AssetInstance.__index = AssetInstance
	function AssetInstance.new(...)
		local self = setmetatable({}, AssetInstance)
		return self:constructor(...) or self
	end
	function AssetInstance:constructor()
	end
	function AssetInstance:CreateByURI(uri, className)
		local inst = Reflection:ConvertObjectToMap(Instance.new(className))
		local _arg0 = className .. "Id"
		local _uri = uri
		inst[_arg0] = _uri
		return inst
	end
	function AssetInstance:CreateByID(id, className)
		return AssetInstance:CreateByURI(AssetInstance.ASSET_URI_PREFIX .. id, className)
	end
	AssetInstance.ASSET_URI_PREFIX = "rbxassetid://"
end
return {
	ASSET_INSTANCES = ASSET_INSTANCES,
	AssetInstance = AssetInstance,
}
