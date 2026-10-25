data:extend({
	{
		type = "int-setting",
		name = "InfiniteResourcesWithOptionalDepletion_minimum",
		description = "InfiniteResourcesWithOptionalDepletion_minimum",
		setting_type = "startup",
		default_value = 100,
		minimum_value = 1,
		maximum_value = 100,
		order = "a"
	},
	{
		type = "int-setting",
		name = "InfiniteResourcesWithOptionalDepletion_normal",
		description = "InfiniteResourcesWithOptionalDepletion_normal",
		setting_type = "startup",
		default_value = 100,
		minimum_value = 1,
		maximum_value = 4294967295,
		order = "b"
	},
	{
		type = "string-setting",
		name = "InfiniteResourcesWithOptionalDepletion_exclusions",
		description = "InfiniteResourcesWithOptionalDepletion_exclusions",
		setting_type = "startup",
		allow_blank = true,
		default_value = "",
		order = "c"
	},
	{
		type = "string-setting",
		name = "InfiniteResourcesWithOptionalDepletion_startOnly",
		description = "InfiniteResourcesWithOptionalDepletion_startOnly",
		setting_type = "runtime-global",
		allow_blank = false,
		default_value = "All",
		allowed_values = {"All", "Starting Area Only", "All Except Starting Area"},
		order = "a"
	}
})