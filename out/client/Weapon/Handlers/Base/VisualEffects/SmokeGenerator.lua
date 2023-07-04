-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Debris = _services.Debris
local TweenService = _services.TweenService
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
math.randomseed(time())
local SmokeGenerator
do
	SmokeGenerator = setmetatable({}, {
		__tostring = function()
			return "SmokeGenerator"
		end,
	})
	SmokeGenerator.__index = SmokeGenerator
	function SmokeGenerator.new(...)
		local self = setmetatable({}, SmokeGenerator)
		return self:constructor(...) or self
	end
	function SmokeGenerator:constructor()
		self.MAX_PARTICLES_COUNT_ON_STUD = 5
		self.MIN_PARTICLE_OFFSET = -1
		self.MAX_PARTICLE_OFFSET = 1
		self.SMOKE_COLORS = { Color3.fromHex("#676668"), Color3.fromHex("#848486"), Color3.fromHex("#393939") }
		self.PRATICLE_SIZE = Vector3.new(.17, .17, .17)
		self.PARTICLE_MATERIAL = Enum.Material.SmoothPlastic
	end
	function SmokeGenerator:GetParticleAxisOffset()
		return math.random(self.MIN_PARTICLE_OFFSET, self.MAX_PARTICLE_OFFSET) / 10
	end
	function SmokeGenerator:GetParticleAnimtionSize()
		return Vector3.new(math.random(), math.random(), math.random())
	end
	function SmokeGenerator:GetParticleColor()
		return self.SMOKE_COLORS[math.random(0, 2) + 1]
	end
	function SmokeGenerator:GetParticleOffset()
		return Vector3.new(self:GetParticleAxisOffset(), self:GetParticleAxisOffset(), self:GetParticleAxisOffset())
	end
	function SmokeGenerator:CraeteSmokeParticleModel(pos)
		local part = Instance.new("Part")
		part.Anchored = true
		part.Parent = GlobalConfig.DEBRIS
		local _pos = pos
		local _arg0 = self:GetParticleOffset()
		part.Position = _pos + _arg0
		part.CanCollide = false
		part.BrickColor = BrickColor.Gray()
		part.Size = self.PRATICLE_SIZE
		part.Color = self:GetParticleColor()
		part.Material = self.PARTICLE_MATERIAL
		Debris:AddItem(part, 1.5)
		return part
	end
	function SmokeGenerator:AnimateParticle(particle, dir)
		local _time = math.random() * 2
		local _fn = TweenService
		local _exp = particle
		local _exp_1 = TweenInfo.new(_time)
		local _object = {
			Position = particle.Position,
			Transparency = 1,
		}
		local _left = "Size"
		local _size = particle.Size
		local _arg0 = self:GetParticleAnimtionSize()
		_object[_left] = _size + _arg0
		_fn:Create(_exp, _exp_1, _object):Play()
	end
	function SmokeGenerator:Generate(start, length)
		do
			local i = 0
			local _shouldIncrement = false
			while true do
				if _shouldIncrement then
					i += 1
				else
					_shouldIncrement = true
				end
				if not (i < self.MAX_PARTICLES_COUNT_ON_STUD) then
					break
				end
				do
					local j = 0
					local _shouldIncrement_1 = false
					while true do
						if _shouldIncrement_1 then
							j += 1
						else
							_shouldIncrement_1 = true
						end
						if not (j < length) then
							break
						end
						if math.random() > 0.5 then
							local offset = start:PointToWorldSpace(Vector3.new(0, 0, -j))
							self:AnimateParticle(self:CraeteSmokeParticleModel(offset), start.RightVector)
						end
					end
				end
			end
		end
	end
end
return {
	SmokeGenerator = SmokeGenerator,
}
