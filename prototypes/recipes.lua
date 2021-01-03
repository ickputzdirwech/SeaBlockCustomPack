-- FUNCTIONS
local function change_crafting_category(name, new_category)
  if data.raw.recipe[name] then
    data.raw.recipe[name].category = new_category
  end
end

local function update_ingredient(recipe_name, item, new_count)
  if data.raw.recipe[recipe_name] then
    local recipe = data.raw.recipe[recipe_name].ingredients
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


-- LOGISTICS
update_ingredient("repair-pack-2", "repair-pack", 1)
update_ingredient("repair-pack-3", "repair-pack-2", 1)
update_ingredient("repair-pack-4", "repair-pack-3", 1)
update_ingredient("repair-pack-5", "repair-pack-4", 1)

update_ingredient("angels-warehouse", "silo", 1)
update_ingredient("angels-warehouse", "iron-plate", 80)
update_ingredient("angels-warehouse", "stone-brick", 80)
update_ingredient("angels-warehouse", "steel-plate", 40)

--[[
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
]]

-- BOBS-LOGISTICS
if settings.startup["ick-seablock-burner-inserter"].value == false then
  update_ingredient("inserter", "burner-inserter", 1)
  update_ingredient("inserter", "iron-plate", 0)
  update_ingredient("inserter", "iron-gear-wheel", 0)
end

if settings.startup["ick-seablock-walls-and-gates"].value == false then
  update_ingredient("reinforced-wall", "stone-wall", 1)
  update_ingredient("reinforced-wall", "steel-plate", 3)
  update_ingredient("reinforced-wall", "stone-brick", 0)

  update_ingredient("reinforced-gate", "gate", 1)
  update_ingredient("reinforced-gate", "steel-plate", 3)
  update_ingredient("reinforced-gate", "reinforced-wall", 0)
end


-- PRODUCTION
update_ingredient("steel-furnace", "stone-furnace", 1)

update_ingredient("electric-furnace", "steel-furnace", 1)
update_ingredient("electric-furnace", "steel-plate", 4)
update_ingredient("electric-furnace", "stone-brick", 0)


-- COMBAT
update_ingredient("heavy-armor", "light-armor", 1)
update_ingredient("heavy-armor", "steel-plate", 40)

update_ingredient("modular-armor", "heavy-armor", 1)
update_ingredient("modular-armor", "steel-plate", 0)

update_ingredient("power-armor", "modular-armor", 1)
update_ingredient("power-armor", "steel-plate", 0)

update_ingredient("power-armor-mk2", "power-armor", 1)
update_ingredient("power-armor-mk2", "processing-unit", 20)
update_ingredient("power-armor-mk2", "electric-engine-unit", 20)

update_ingredient("tankotron", "tank", 1)
update_ingredient("tankotron", "spidertron-cannon", 0)


-- CHEMICAL AND MIXING FURNACE RECIPES
change_crafting_category("lithium-cobalt-oxide", "chemical-smelting")
change_crafting_category("silicon-nitride", "chemical-smelting")

change_crafting_category("silicon-carbide", "sintering")
change_crafting_category("alien-blue-alloy", "sintering")
change_crafting_category("alien-orange-alloy", "sintering")
change_crafting_category("tungsten-carbide", "sintering")
change_crafting_category("tungsten-carbide-2", "sintering")
change_crafting_category("copper-tungsten-alloy", "sintering")
