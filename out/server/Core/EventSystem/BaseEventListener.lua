-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local BaseEventListener
do
	BaseEventListener = {}
	function BaseEventListener:constructor()
		self.remoteFolerName = "Remote"
		self.EventHandler = {}
		self.dir = ReplicatedStorage:WaitForChild(self:GetId()):WaitForChild(self.remoteFolerName)
	end
	function BaseEventListener:GetEventDirecotry()
		return self.dir
	end
end
return {
	BaseEventListener = BaseEventListener,
}
