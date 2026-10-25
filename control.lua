local util = require("util")

local function isInStartingArea(resource)
	if game.active_mods["rso-mod"] then
		return remote.call("RSO", "isInStartingArea", resource.surface.index, resource.position.x, resource.position.y)
	else
		return util.distance({0,0}, resource.position) <= resource.surface.get_starting_area_radius()
	end
end

local function QualifiesForInfinite(resource)
	local startOnlySetting = settings.global["InfiniteResourcesWithOptionalDepletion_startOnly"].value
	if startOnlySetting == "All"
		or (startOnlySetting == "Starting Area Only" and isInStartingArea(resource))
		or (startOnlySetting == "All Except Starting Area" and not isInStartingArea(resource)) then
		return true
	end
	return false
end

local function loadResources()
	storage.infinite_resources = {}
	for _, effect in pairs(prototypes.technology.infiniteresourcenormalyielddepletion_infiniteresources.effects) do
		storage.infinite_resources[effect.item] = true
	end
end

local function onInitAndConfigChanged(event)
	loadResources()
	if event and event.mod_changes["InfiniteResourcesWithOptionalDepletion"] and event.mod_changes["InfiniteResourcesWithOptionalDepletion"].mod_startup_settings_changed then
		for _, surface in pairs(game.surfaces) do
			local resources = surface.find_entities_filtered{type = "resource"}
			for _, resource in pairs(resources) do
				if storage.infinite_resources[resource.name] then
					if not QualifiesForInfinite(resource) then
						resource.destroy()
					else
						if resource.initial_amount ~= settings.startup["InfiniteResourcesWithOptionalDepletion_normal"].value then
							resource.initial_amount = settings.startup["InfiniteResourcesWithOptionalDepletion_normal"].value
						end
						if resource.amount < resource.prototype.minimum_resource_amount then
							resource.amount = resource.prototype.minimum_resource_amount
						end
					end
				end
			end
		end
	end
end

local function onResourceDepleted(event)
	local resource = event.entity
	if not resource.prototype.infinite_resource and storage.infinite_resources[resource.name .. "-infinite"] and QualifiesForInfinite(resource) then
		resource.surface.create_entity({name = resource.name .. "-infinite", amount = settings.startup["InfiniteResourcesWithOptionalDepletion_normal"].value, position = resource.position, force = resource.force, raise_built = true})
	end
end

local function onPlayerSelectedArea(event)
	if event.item ~= "infinite-resource-remover" then return end
	for _, resource in pairs(event.entities) do
		if resource.prototype.infinite_resource then
			resource.destroy()
		end
	end
end

local function onRuntimeModSettingChanged(event)
	if event.setting ~= "InfiniteResourcesWithOptionalDepletion_startOnly" then return end
	for _, surface in pairs(game.surfaces) do
		local resources = surface.find_entities_filtered{type = "resource"}
		for _, resource in pairs(resources) do
			if resource.prototype.infinite_resource and storage.infinite_resources[resource.name] and not QualifiesForInfinite(resource) then
				resource.destroy()
			end
		end
	end
end

script.on_init(onInitAndConfigChanged)
script.on_configuration_changed(onInitAndConfigChanged)
script.on_event(defines.events.on_resource_depleted, onResourceDepleted)
script.on_event(defines.events.on_player_selected_area, onPlayerSelectedArea)
script.on_event(defines.events.on_runtime_mod_setting_changed, onRuntimeModSettingChanged)