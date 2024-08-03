-- 4360 warnings of unused prototype definitions

for _, types in pairs(data.raw) do
	for _, thing in pairs(types) do
		-- 28 x
		if thing.icons and thing.icon then
			thing.icon = nil
		end
		-- 109 x
		-- made pull request
		-- https://github.com/BobsMods/bobsmods/pull/54
		if thing.minable and thing.minable.hardness then
			thing.minable.hardness = nil
		end
	end
end

--[[
	Made a pull request to CircuitProcessing regarding
	category, tier, effect, art_style, beacon_tint, requires_beacon_alt_mode, limitation and limitation_message_key
	https://github.com/KiwiHawk/CircuitProcessing/pull/24
]]

for  _, item in pairs(data.raw.item) do
	-- 12 x
	if item.category then
		item.category = nil
	end
	-- 12 x
	if item.tier then
		item.tier = nil
	end
	-- 12 x
	if item.effect then
		item.effect = nil
	end
	-- 12 x
	if item.art_style then
		item.art_style = nil
	end
	-- 12 x
	if item.beacon_tint then
		item.beacon_tint = nil
	end
	--[[ 12 x for some reason doesn't work
	if item.requires_beacon_alt_mode then
		item.requires_beacon_alt_mode = nil
		log("property \'requires_beacon_alt_mode\' was removed from " .. item.name)
	end]]
	-- 1696 x
	if item.limitation then
		item.limitation = nil
	end
	-- 4 x
	if item.limitation_message_key then
		item.limitation_message_key = nil
	end
end

--[[
	Send a message to Saienai regarding
	allow_decomposition, always_show_made_in, always_show_products and show_amount_in_title
	https://mods.factorio.com/mod/baraws/discussion/62ed1d90291ccef688680453
]]

--
for _, recipe in pairs(data.raw.recipe) do
	if recipe.normal or recipe.expensive then
		--[[ 5 x doesn't work (baraws 454 x)
		if recipe.allow_decomposition then
			recipe.allow_decomposition = nil
			log("property \'allow_decomposition\' was removed from " .. recipe.name)
		end]]
		--[[ 4 x doesn't work (baraws 454 x)
		if recipe.always_show_made_in then
			recipe.always_show_made_in = nil
			log("property \'always_show_made_in\' was removed from " .. recipe.name)
		end]]
		--[[
		-- (baraws 454 x)
		if recipe.always_show_products then
			recipe.always_show_products = nil
			log("property \'always_show_products\' was removed from " .. recipe.name)
		end
		-- (baraws 454 x)
		if recipe.show_amount_in_title then
			recipe.show_amount_in_title = nil
			log("property \'show_amount_in_title\' was removed from " .. recipe.name)
		end]]
	end
end

--[[
	Send a message to kirazy regarding equipment icons
	https://github.com/kirazy/reskins-bobs/issues/38
]]

for _, types in pairs({"night-vision-equipment", "energy-shield-equipment", "battery-equipment", "solar-panel-equipment", "generator-equipment", "active-defense-equipment", "movement-bonus-equipment", "roboport-equipment"}) do
	for _, thing in pairs(data.raw[types]) do
		if thing.icons then
			-- 51 x
			thing.icons = nil
		end
	end
end
