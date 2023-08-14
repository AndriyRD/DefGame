-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local Reflection = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Reflection").Reflection
local RemoteInstance
do
	RemoteInstance = setmetatable({}, {
		__tostring = function()
			return "RemoteInstance"
		end,
	})
	RemoteInstance.__index = RemoteInstance
	function RemoteInstance.new(...)
		local self = setmetatable({}, RemoteInstance)
		return self:constructor(...) or self
	end
	function RemoteInstance:constructor(instance)
		self.instance = instance
		self.eventConnectionBuffer = nil
		self.keysOnCallProp = {
			Event = {
				Server = "OnServerEvent",
				Client = "OnClientEvent",
			},
			Function = {
				Server = "OnServerInvoke",
				Client = "OnClientInvoke",
			},
		}
	end
	function RemoteInstance:FindKeyOnCallInstance()
		if self.instance:IsA("RemoteEvent") then
			if RunService:IsClient() then
				return self.keysOnCallProp.Event.Client
			else
				return self.keysOnCallProp.Event.Server
			end
		elseif self.instance:IsA("RemoteFunction") then
			if RunService:IsClient() then
				return self.keysOnCallProp.Function.Client
			else
				return self.keysOnCallProp.Function.Server
			end
		end
		error("Not correct remote-instance: " .. tostring(self.instance))
	end
	function RemoteInstance:Connect(cb)
		local instanceMap = Reflection:ConvertObjectToMap(self.instance)
		if self.instance:IsA("RemoteEvent") then
			local _arg0 = self:FindKeyOnCallInstance()
			local onEvent = instanceMap[_arg0]
			self.eventConnectionBuffer = onEvent:Connect(function(...)
				local args = { ... }
				return cb(unpack(args))
			end)
		elseif self.instance:IsA("RemoteFunction") then
			local _arg0 = self:FindKeyOnCallInstance()
			local _cb = cb
			instanceMap[_arg0] = _cb
		end
		print(self:FindKeyOnCallInstance())
	end
	function RemoteInstance:Destroy()
		self.instance:Destroy()
		table.clear(self)
	end
end
return {
	RemoteInstance = RemoteInstance,
}
