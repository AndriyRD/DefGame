-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local EventHandlerParser = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "EventSystem", "EventHandlerParser").EventHandlerParser
local RemoteInstance = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "EventSystem", "RemoteInstance").RemoteInstance
local EventRegister
do
	EventRegister = setmetatable({}, {
		__tostring = function()
			return "EventRegister"
		end,
	})
	EventRegister.__index = EventRegister
	function EventRegister.new(...)
		local self = setmetatable({}, EventRegister)
		return self:constructor(...) or self
	end
	function EventRegister:constructor()
		self.listeners = {}
		self.mainDirectoryContainer = ReplicatedStorage
		self.eventHandlerParser = EventHandlerParser.new()
		self.remoteInstancesDirectoryName = "Remote"
	end
	function EventRegister:FindOrCreateRemoteInstanceDirectory(id)
		local dir = self.mainDirectoryContainer:FindFirstChild(id)
		if not dir or not dir:IsA("Folder") then
			warn("Not found remote-storage directory for: " .. id)
			dir = Instance.new("Folder")
			dir.Name = id
			dir.Parent = self.mainDirectoryContainer
		end
		local remoteInstancesDir = dir:FindFirstChild(self.remoteInstancesDirectoryName)
		if not remoteInstancesDir then
			warn("Not found " .. (self.remoteInstancesDirectoryName .. (" directory in: " .. id)))
			remoteInstancesDir = Instance.new("Folder")
			remoteInstancesDir.Parent = dir
			remoteInstancesDir.Name = self.remoteInstancesDirectoryName
		end
		return remoteInstancesDir
	end
	function EventRegister:FindOrCreateEventInstance(name, dir)
		local inst = dir:FindFirstChild(name)
		if not inst then
			inst = Instance.new("RemoteEvent")
			inst.Name = name
			inst.Parent = dir
		end
		return inst
	end
	function EventRegister:Register(listener)
		local dir = self:FindOrCreateRemoteInstanceDirectory(listener:GetId())
		for _, item in self.eventHandlerParser:Parse(listener) do
			local inst = self:FindOrCreateEventInstance(item.Name, dir)
			RemoteInstance.new(inst):Connect(item.Handle)
		end
		local _listeners = self.listeners
		local _listener = listener
		table.insert(_listeners, _listener)
		return self
	end
end
return {
	EventRegister = EventRegister,
}
