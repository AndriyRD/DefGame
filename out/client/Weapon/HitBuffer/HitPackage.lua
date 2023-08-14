-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local LifeCicle = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Loop", "LifeCicle").LifeCicle
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
		self.lifeHanlder = LifeCicle.new()
		self.OnReady = Instance.new("BindableEvent")
		self.firstItemLifeTime = 0
		self.maxLifeTime = if _maxLifeTime ~= 0 and (_maxLifeTime == _maxLifeTime and _maxLifeTime) then _maxLifeTime else 1
		self.packageSize = if _packageSize ~= 0 and (_packageSize == _packageSize and _packageSize) then _packageSize else 4
		self:Init()
	end
	function HitPackage:Send()
		self.OnReady:Fire()
		table.clear(self.results)
		self.firstItemLifeTime = 0
	end
	function HitPackage:OnTick(dt)
		if #self.results <= 0 then
			return nil
		end
		self.firstItemLifeTime += dt
		if self.firstItemLifeTime >= self.maxLifeTime then
			self:Send()
		end
	end
	function HitPackage:Init()
		self.lifeHanlder:AddTask("main", function(dt)
			return self:OnTick(dt)
		end)
		self.lifeHanlder:Run()
	end
	function HitPackage:Reset()
		table.clear(self.results)
		self.firstItemLifeTime = 0
	end
	function HitPackage:Push(res)
		local _results = self.results
		local _res = res
		table.insert(_results, _res)
		if #_results >= self.packageSize then
			self:Send()
		end
	end
	function HitPackage:GetResults()
		return self.results
	end
end
return {
	HitPackage = HitPackage,
}
