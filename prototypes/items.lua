data:extend({
	{
		type = "selection-tool",
		name = "infinite-resource-remover",
		icon = "__InfiniteResourcesWithOptionalDepletion_fx__/graphics/icons/infinite-resource-remover.png",
		flags = {"only-in-cursor", "spawnable"},
		hidden = true,
		stack_size = 1,
		stackable = false,
		select = {
			border_color = {255, 24, 24},
			count_button_color = {195, 52, 52},
			mode = "any-entity",
			cursor_box_type = "not-allowed",
			entity_type_filters = {"resource"},
			entity_filter_mode = "whitelist",
		},
		alt_select = {
			border_color = {r = 1, b = 1},
			mode = {"nothing"},
			cursor_box_type = "not-allowed"
		}
	}
})