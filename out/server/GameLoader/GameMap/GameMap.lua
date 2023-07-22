-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local GameMap
do
	GameMap = setmetatable({}, {
		__tostring = function()
			return "GameMap"
		end,
	})
	GameMap.__index = GameMap
	function GameMap.new(...)
		local self = setmetatable({}, GameMap)
		return self:constructor(...) or self
	end
	function GameMap:constructor(id)
		self.id = id
		self.ParentContainer = Workspace
		self.SpawnCF = CFrame.new()
		self.options = {
			TeamOptions = nil,
		}
		local origin = GlobalConfig.MAP_MODEL_STORAGE:WaitForChild(id)
		self.model = origin:Clone()
	end
	function GameMap:GetModel()
		return self.model
	end
	function GameMap:GetOptions()
		return self.options
	end
	function GameMap:Sapwn()
		self.model.Parent = Workspace
		self.model:PivotTo(self.SpawnCF)
	end
	function GameMap:Destory()
		self.model:Destroy()
		table.clear(self)
	end
end
return {
	GameMap = GameMap,
}
