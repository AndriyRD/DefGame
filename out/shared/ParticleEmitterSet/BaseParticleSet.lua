-- Compiled with roblox-ts v2.1.0
local BaseParticleSet
do
	BaseParticleSet = setmetatable({}, {
		__tostring = function()
			return "BaseParticleSet"
		end,
	})
	BaseParticleSet.__index = BaseParticleSet
	function BaseParticleSet.new(...)
		local self = setmetatable({}, BaseParticleSet)
		return self:constructor(...) or self
	end
	function BaseParticleSet:constructor(attachment)
		self.attachment = attachment
		self.emitters = {}
	end
	function BaseParticleSet:Emit()
		local _emitters = self.emitters
		local _arg0 = function(options, emitter)
			return emitter:Emit(options.EmitParticleCount)
		end
		for _k, _v in _emitters do
			_arg0(_v, _k, _emitters)
		end
		return self
	end
	function BaseParticleSet:Add(emitter, options)
		local _emitters = self.emitters
		local _emitter = emitter
		local _options = options
		_emitters[_emitter] = _options
		return self
	end
	function BaseParticleSet:AddByOrigin(emitter, options)
		local newEmitter = emitter:Clone()
		self:Add(newEmitter, options)
		newEmitter.Parent = self.attachment
		return self
	end
	function BaseParticleSet:Enable()
		local _emitters = self.emitters
		local _arg0 = function(_, v)
			v.Enabled = true
			return v.Enabled
		end
		for _k, _v in _emitters do
			_arg0(_v, _k, _emitters)
		end
	end
	function BaseParticleSet:Disable()
		local _emitters = self.emitters
		local _arg0 = function(_, v)
			v.Enabled = false
			return v.Enabled
		end
		for _k, _v in _emitters do
			_arg0(_v, _k, _emitters)
		end
	end
	function BaseParticleSet:Dispose()
		local _emitters = self.emitters
		local _arg0 = function(options, emitter)
			return emitter:Destroy()
		end
		for _k, _v in _emitters do
			_arg0(_v, _k, _emitters)
		end
		table.clear(self.emitters)
		table.clear(self)
	end
end
return {
	BaseParticleSet = BaseParticleSet,
}
