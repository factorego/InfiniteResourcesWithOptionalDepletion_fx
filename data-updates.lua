local infinitelist = {}
local exclusionlist = {}
for _, exclude in pairs(util.split(settings.startup["InfiniteResourcesWithOptionalDepletion_exclusions"].value, ",")) do
	exclusionlist[exclude] = true
end

local dummy_tech = {
	type = "technology",
	name = "infiniteresourcenormalyielddepletion_infiniteresources",
	icon = "__core__/graphics/icons/unknown.png",
	icon_size = 64,
	enabled = false,
	hidden = true,
	ignore_tech_cost_multiplier = true,
	effects = {},
	unit = {
		count = 1,
		ingredients = {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"military-science-pack", 1},
			{"chemical-science-pack", 1},
			{"production-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1}
		},
		time = 1
	}
}

for _, resource in pairs(data.raw.resource) do
	if not resource.infinite and not exclusionlist[resource.name] then
		local infiniteresource = table.deepcopy(resource)
		infiniteresource.name = resource.name .. "-infinite"
		infiniteresource.localised_name = {"entity-name." .. resource.name}
		infiniteresource.infinite = true
		infiniteresource.minimum = math.max(settings.startup["InfiniteResourcesWithOptionalDepletion_minimum"].value * (settings.startup["InfiniteResourcesWithOptionalDepletion_normal"].value / 100), 1)
		infiniteresource.normal = settings.startup["InfiniteResourcesWithOptionalDepletion_normal"].value
		infiniteresource.autoplace = nil

		local dummy_item = {
			type = "item",
			name = infiniteresource.name,
			icon = "__core__/graphics/icons/unknown.png",
			icon_size = 64,
			stack_size = 1,
			hidden = true
		}
		table.insert(dummy_tech.effects, {type = "give-item", item = dummy_item.name})

		table.insert(infinitelist, infiniteresource)
		table.insert(infinitelist, dummy_item)
	end
end

table.insert(infinitelist, dummy_tech)

data:extend(infinitelist)