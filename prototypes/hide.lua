-- LIST OF ALL ITEMS AND RECIPES TO HIDE
local item_list = {
  "burner-inserter",
  "steam-inserter",
  "valve-converter",
  "accumulator",
  "silo-ore1",
  "silo-ore2",
  "silo-ore3",
  "silo-ore4",
  "silo-ore5",
  "silo-ore6",
  "silo-coal",
}

-- HIDE RECIPES AND ITEMS
for _, name in pairs(item_list) do
  if data.raw.recipe[name] then
    data.raw.recipe[name].hidden = true
  end
  if data.raw.item[name] then
    if data.raw.item[name].flags then
      table.insert(data.raw.item[name].flags, "hidden")
    else
      data.raw.item[name].flags = {"hidden"}
    end
  end
end

-- HIDE ENTITIES
local function hide_entity(type, name)
  if data.raw.type[name] then
    if data.raw.type[name].flags then
      table.insert(data.raw.type[name].flags, "hidden")
    else
      data.raw.type[name].flags = {"hidden"}
    end
    data.raw.type[name].next_upgrade = nil
  end
end

hide_entity("inserter", "burner-inserter")
hide_entity("inserter", "steam-inserter")
hide_entity("accumulator", "accumulator")

hide_entity("mining-drill", "burner-mining-drill")
hide_entity("mining-drill", "electric-mining-drill")
hide_entity("mining-drill", "pumpjack")

-- HIDE TECHNOLOGIES
local tech_list = {
  
}

for _, name in pairs(tech_list) do
  if data.raw.technology[name] then
    data.raw.technology[name].hidden = true
  end
end

-- REMOVE RECIPE UNLOCKS
if data.raw.technology["sct-automation-science-pack"] then
  bobmods.lib.tech.remove_recipe_unlock("sct-automation-science-pack", "electric-mining-drill")
  bobmods.lib.tech.remove_recipe_unlock("sct-automation-science-pack", "steam-mining-drill")
  bobmods.lib.tech.remove_recipe_unlock("sct-automation-science-pack", "steam-inserter")
end

if data.raw.technology["oil-gas-extraction"] then
  bobmods.lib.tech.remove_recipe_unlock("oil-gas-extraction", "pumpjack")
end

if data.raw.technology["sb-startup2"] then
  bobmods.lib.tech.remove_recipe_unlock("sb-startup2", "burner-inserter")
end

if data.raw.technology["angels-fluid-control"] then
  bobmods.lib.tech.remove_recipe_unlock("angels-fluid-control", "valve-converter")
end

if data.raw.technology["ore-silos"] then
  data.raw.technology["ore-silos"].effects = {{type = "unlock-recipe", recipe = "silo"}}
end

if data.raw.technology["electric-energy-accumulators"] and data.raw.technology["bob-electric-energy-accumulators-2"] then
  data.raw.technology["electric-energy-accumulators"].effects = {{type = "unlock-recipe", recipe = "large-accumulator"}}
  bobmods.lib.tech.remove_recipe_unlock("bob-electric-energy-accumulators-2", "large-accumulator")
end
