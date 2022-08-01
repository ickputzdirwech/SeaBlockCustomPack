-- FUNCTION
local function update_ingredient(recipe_name, item, new_count)
	if data.raw.recipe[recipe_name] then
		local recipe = data.raw.recipe[recipe_name].ingredients
		for _, difficulty in pairs({"normal", "expensive"}) do
			if data.raw.recipe[recipe_name][difficulty] and data.raw.recipe[recipe_name][difficulty].ingredients then
				recipe = data.raw.recipe[recipe_name][difficulty].ingredients
				break
			end
		end
		if recipe then
			for i, ingredient in pairs(recipe) do
				if ingredient.name == item then
					table.remove(recipe, i)
				end
			end
			if new_count >= 1 then
				table.insert(recipe, {type = "item", name = item, amount = new_count})
			end
		end
	end
end

-- LOGISTICS
update_ingredient("repair-pack-2", "repair-pack", 1)
update_ingredient("repair-pack-3", "repair-pack-2", 1)
update_ingredient("repair-pack-4", "repair-pack-3", 1)
update_ingredient("repair-pack-5", "repair-pack-4", 1)

update_ingredient("angels-warehouse", "silo", 1)
update_ingredient("angels-warehouse", "iron-plate", 80)
update_ingredient("angels-warehouse", "stone-brick", 80)
update_ingredient("angels-warehouse", "steel-plate", 40)

if mods["WireShortcuts"] then else
	update_ingredient("arithmetic-combinator", "red-wire", 2)
	update_ingredient("arithmetic-combinator", "green-wire", 1)
	update_ingredient("arithmetic-combinator", "electronic-circuit", 2)
	update_ingredient("arithmetic-combinator", "copper-cable", 2)

	update_ingredient("decider-combinator", "red-wire", 1)
	update_ingredient("decider-combinator", "green-wire", 2)
	update_ingredient("decider-combinator", "electronic-circuit", 2)
	update_ingredient("decider-combinator", "copper-cable", 2)

	update_ingredient("constant-combinator", "red-wire", 1)
	update_ingredient("constant-combinator", "green-wire", 1)
	update_ingredient("constant-combinator", "electronic-circuit", 0)
	update_ingredient("constant-combinator", "copper-cable", 3)

	update_ingredient("spacex-combinator", "constant-combinator", 1)
	update_ingredient("spacex-combinator", "electronic-circuit", 3)
	update_ingredient("spacex-combinator", "copper-cable", 0)

	update_ingredient("power-switch", "red-wire", 1)
	update_ingredient("power-switch", "green-wire", 1)
	update_ingredient("power-switch", "electronic-circuit", 0)
	update_ingredient("power-switch", "copper-cable", 3)

	update_ingredient("programmable-speaker", "red-wire", 2)
	update_ingredient("programmable-speaker", "green-wire", 2)
	update_ingredient("programmable-speaker", "electronic-circuit", 0)
	update_ingredient("programmable-speaker", "copper-cable", 1)
end

-- BOBS-LOGISTICS
if settings.startup["ick-seablock-burner-inserter"].value == false then
	update_ingredient("inserter", "burner-inserter", 1)
	update_ingredient("inserter", "iron-plate", 0)
	update_ingredient("inserter", "iron-gear-wheel", 0)
end

-- PRODUCTION
update_ingredient("steel-furnace", "stone-furnace", 1)
update_ingredient("steel-furnace", "stone-brick", 8)

update_ingredient("electric-furnace", "steel-furnace", 1)
update_ingredient("electric-furnace", "steel-plate", 4)
update_ingredient("electric-furnace", "stone-brick", 0)

-- COMBAT
update_ingredient("submachine-gun", "pistol", 1)
update_ingredient("submachine-gun", "iron-plate", 5)
update_ingredient("submachine-gun", "copper-plate", 0)

update_ingredient("sniper-rifle", "submachine-gun", 1)
update_ingredient("sniper-rifle", "steel-plate", 5)

update_ingredient("atomic-bomb", "rocket", 1)
update_ingredient("atomic-bomb", "rocket-booster", 0)
update_ingredient("atomic-bomb", "explosives", 9)

update_ingredient("explosive-cannon-shell", "cannon-shell", 1)
update_ingredient("explosive-cannon-shell", "steel-plate", 0)
update_ingredient("explosive-cannon-shell", "plastic-bar", 0)
update_ingredient("explosive-cannon-shell", "explosives", 1)

update_ingredient("heavy-armor", "light-armor", 1)
update_ingredient("heavy-armor", "steel-plate", 44)

update_ingredient("modular-armor", "heavy-armor", 1)
update_ingredient("modular-armor", "steel-plate", 0)

update_ingredient("power-armor", "modular-armor", 1)
update_ingredient("power-armor", "steel-plate", 0)

update_ingredient("power-armor-mk2", "power-armor", 1)
update_ingredient("power-armor-mk2", "processing-unit", 20)
update_ingredient("power-armor-mk2", "electric-engine-unit", 20)

update_ingredient("tank", "car", 1)
update_ingredient("tank", "engine-unit", 24)
update_ingredient("tank", "steel-plate", 45)
update_ingredient("tank", "iron-gear-wheel", 5)

update_ingredient("tankotron", "tank", 1)
update_ingredient("tankotron", "spidertron-cannon", 0)

if settings.startup["ick-seablock-walls-and-gates"].value == false then
	update_ingredient("reinforced-wall", "stone-wall", 1)
	update_ingredient("reinforced-wall", "stone-brick", 0)

	update_ingredient("reinforced-gate", "gate", 1)
	update_ingredient("reinforced-gate", "steel-plate", 3)
	update_ingredient("reinforced-gate", "reinforced-wall", 0)
end

-- PETROCHEM-REFINING
update_ingredient("cliff-explosives", "grenade", 0)
update_ingredient("cliff-explosives", "iron-plate", 5)
update_ingredient("cliff-explosives", "wood-charcoal", 10)
