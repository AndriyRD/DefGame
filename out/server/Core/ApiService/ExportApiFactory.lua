-- Compiled with roblox-ts v2.1.0
local ExportApiFactory
do
	ExportApiFactory = setmetatable({}, {
		__tostring = function()
			return "ExportApiFactory"
		end,
	})
	ExportApiFactory.__index = ExportApiFactory
	function ExportApiFactory.new(...)
		local self = setmetatable({}, ExportApiFactory)
		return self:constructor(...) or self
	end
	function ExportApiFactory:constructor()
	end
	function ExportApiFactory:Create(apiService)
		return {}
	end
end
return {
	ExportApiFactory = ExportApiFactory,
}
