-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local GameMap
do
	GameMap = {}
	function GameMap:constructor(id)
		self.id = id
		self.ParentContainer = Workspace
		self.SpawnCF = CFrame.new()
		local origin = GlobalConfig.MAP_MODEL_STORAGE:WaitForChild(id)
		self.model = origin:Clone()
	end
	function GameMap:GetModel()
		return self.model
	end
	function GameMap:Sapwn()
		self.model.Parent = Workspace
		self.model:PivotTo(self.SpawnCF)
		self.model.Name = GlobalConfig.LAODED_MAP_NAME
	end
	function GameMap:GetID()
		return self.id
	end
	function GameMap:Destory()
		self.model:Destroy()
		table.clear(self)
	end
end
return {
	GameMap = GameMap,
}
