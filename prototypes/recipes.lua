if settings.startup["ick-seablock-burner-inserter"].value == false then
  data.raw.recipe.inserter.ingredients = {{"basic-circuit-board", 1}, {"burner-inserter", 1}}
end

if settings.startup["ick-seablock-walls-and-gates"].value == false then
  data.raw.recipe["reinforced-wall"].ingredients = {{"stone-wall", 1}, {"steel-plate", 3}}
  data.raw.recipe["reinforced-gate"].ingredients = {{"gate", 1}, {"steel-plate", 3}}
end

local function new_ingredient(recipe_name, ingredient, count)
  if data.raw.recipe[recipe_name] then
    table.insert(data.raw.recipe[recipe_name].ingredients, {ingredient, count})
  end
end

new_ingredient("repair-pack-2", "repair-pack", 1)
new_ingredient("repair-pack-3", "repair-pack-2", 1)
new_ingredient("repair-pack-4", "repair-pack-3", 1)
new_ingredient("repair-pack-5", "repair-pack-4", 1)

new_ingredient("heavy-armor", "light-armor", 1)
new_ingredient("modular-armor", "heavy-armor", 1)
bobmods.lib.recipe.remove_ingredient("modular-armor", "steel-plate")
new_ingredient("power-armor", "modular-armor", 1)
bobmods.lib.recipe.remove_ingredient("power-armor", "steel-plate")
new_ingredient("power-armor-mk2", "power-armor", 1)
bobmods.lib.recipe.remove_ingredient("power-armor-mk2", "processing-unit")
bobmods.lib.recipe.remove_ingredient("power-armor-mk2", "electric-engine-unit")
new_ingredient("power-armor-mk2", "processing-unit", 20)
new_ingredient("power-armor-mk2", "electric-engine-unit", 20)

new_ingredient("tankotron", "tank", 1)
bobmods.lib.recipe.remove_ingredient("tankotron", "spidertron-cannon")


--bobmods.lib.recipe.replace_ingredient(recipe, old, new)
