-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseGameLoop = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Loop", "BaseGameLoop").BaseGameLoop
local HitPackage
do
	HitPackage = setmetatable({}, {
		__tostring = function()
			return "HitPackage"
		end,
	})
	HitPackage.__index = HitPackage
	function HitPackage.new(...)
		local self = setmetatable({}, HitPackage)
		return self:constructor(...) or self
	end
	function HitPackage:constructor(_packageSize, _maxLifeTime)
		self.results = {}
		self.tickRate = 1 / 20
		self.lifeHanlder = BaseGameLoop.new()
		self.resultList = {}
		self.OnReady = Instance.new("BindableEvent")
		self.firstItemLifeTime = 0
		self.maxLifeTime = if _maxLifeTime ~= 0 and (_maxLifeTime == _maxLifeTime and _maxLifeTime) then _maxLifeTime else 1
		self.packageSize = if _packageSize ~= 0 and (_packageSize == _packageSize and _packageSize) then _packageSize else 4
		self:Init()
	end
	function HitPackage:OnTick()
		if #self.resultList <= 0 then
			return nil
		end
		self.firstItemLifeTime += self.tickRate
		if self.firstItemLifeTime >= self.maxLifeTime then
			self.OnReady:Fire(self)
		end
	end
	function HitPackage:Init()
		self.lifeHanlder:AddTask("main", function()
			return self:OnTick()
		end)
		self.lifeHanlder:SetTickRate(self.tickRate)
		self.lifeHanlder:StartAsync()
	end
	function HitPackage:Reset()
		table.clear(self.results)
		self.firstItemLifeTime = 0
	end
	function HitPackage:Push(res)
		local _resultList = self.resultList
		local _res = res
		table.insert(_resultList, _res)
		if #_resultList >= self.packageSize then
			self.OnReady:Fire(self)
		end
	end
	function HitPackage:GetResults()
		return self.resultList
	end
end
return {
	HitPackage = HitPackage,
}
