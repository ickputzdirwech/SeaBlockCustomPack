-- HIDE RECIPES AND ITEMS
local function hide_item(type, name)
  if data.raw.recipe[name] then
    data.raw.recipe[name].hidden = true
  end
  if data.raw[type][name] then
    if data.raw[type][name].flags then
      table.insert(data.raw[type][name].flags, "hidden")
    else
      data.raw[type][name].flags = {"hidden"}
    end
  end
end

hide_item("item-with-entity-data", "bob-armoured-locomotive")
hide_item("item-with-entity-data", "bob-armoured-locomotive-2")
hide_item("item-with-entity-data", "bob-armoured-cargo-wagon")
hide_item("item-with-entity-data", "bob-armoured-cargo-wagon-2")
hide_item("item-with-entity-data", "bob-armoured-fluid-wagon")
hide_item("item-with-entity-data", "bob-armoured-fluid-wagon-2")

hide_item("item", "silo-ore1")
hide_item("item", "silo-ore2")
hide_item("item", "silo-ore3")
hide_item("item", "silo-ore4")
hide_item("item", "silo-ore5")
hide_item("item", "silo-ore6")
hide_item("item", "silo-coal")

hide_item("item", "burner-inserter")
hide_item("item", "steam-inserter")
hide_item("item", "valve-converter")

hide_item("tool", "pollution-clean-processor")
hide_item("item", "pollution-clean-processor-2")
hide_item("item", "pollution-clean-processor-3")
hide_item("tool", "pollution-create-processor")
hide_item("item", "pollution-create-processor-2")
hide_item("item", "pollution-create-processor-3")

hide_item("item", "accumulator")
hide_item("item", "burner-generator")
hide_item("item", "big-burner-generator")
hide_item("item", "burner-reactor")
hide_item("item", "burner-reactor-2")
hide_item("item", "burner-reactor-3")
hide_item("item", "fluid-reactor")
hide_item("item", "fluid-reactor-from-fluid-furnace")
hide_item("item", "fluid-reactor-2")
hide_item("item", "fluid-reactor-3")
hide_item("item", "petroleum-generator")
hide_item("item", "oil-steam-boiler")

hide_item("item", "robot-brain-combat")
hide_item("item", "robot-brain-combat-2")
hide_item("item", "robot-brain-combat-3")
hide_item("item", "robot-brain-combat-4")
hide_item("item", "robot-tool-combat")
hide_item("item", "robot-tool-combat-2")
hide_item("item", "robot-tool-combat-3")
hide_item("item", "robot-tool-combat-4")
hide_item("capsule", "defender-capsule")
hide_item("capsule", "distractor-capsule")
hide_item("capsule", "destroyer-capsule")
hide_item("capsule", "bob-laser-robot-capsule")
hide_item("item", "defender-robot")
hide_item("item", "distractor-robot")
hide_item("item", "destroyer-robot")
hide_item("item", "bob-laser-robot")
hide_item("item", "bob-robot-gun-drone")
hide_item("item", "bob-robot-laser-drone")
hide_item("item", "bob-robot-flamethrower-drone")
hide_item("item", "bob-robot-plasma-drone")

-- HIDE ENTITIES
local function hide_entity(type, name)
  if data.raw[type][name] then
    if data.raw[type][name].flags then
      table.insert(data.raw[type][name].flags, "hidden")
    else
      data.raw[type][name].flags = {"hidden"}
    end
    data.raw[type][name].next_upgrade = nil
  end
end

hide_entity("inserter", "burner-inserter")
hide_entity("inserter", "steam-inserter")
hide_entity("accumulator", "accumulator")

hide_entity("mining-drill", "burner-mining-drill")
hide_entity("mining-drill", "electric-mining-drill")
hide_entity("mining-drill", "pumpjack")

hide_entity("locomotive", "bob-armoured-locomotive")
hide_entity("locomotive", "bob-armoured-locomotive-2")
hide_entity("cargo-wagon", "bob-armoured-cargo-wagon")
hide_entity("cargo-wagon", "bob-armoured-cargo-wagon-2")
hide_entity("fluid-wagon", "bob-armoured-fluid-wagon")
hide_entity("fluid-wagon", "bob-armoured-fluid-wagon-2")

hide_entity("reactor", "burner-reactor")
hide_entity("reactor", "burner-reactor-2")
hide_entity("reactor", "burner-reactor-3")
hide_entity("reactor", "fluid-reactor")
hide_entity("reactor", "fluid-reactor-2")
hide_entity("reactor", "fluid-reactor-3")

-- HIDE TECHNOLOGIES
local tech_list = {
  "bob-armoured-railway",
  "bob-armoured-railway-2",
  "bob-armoured-fluid-wagon",
  "bob-armoured-fluid-wagon-2",
  "big-burner-generator",
  "burner-reactor-1",
  "fluid-reactor-1",
  "burner-reactor-2",
  "fluid-reactor-2",
  "burner-reactor-3",
  "fluid-reactor-3",
  "OilBurning",
  "defender",
  "distractor",
  "destroyer",
  "bob-laser-robot",
  "bob-robot-gun-drones",
  "bob-robot-laser-drones",
  "bob-robot-flamethrower-drones",
  "bob-robot-plasma-drones",
  "follower-robot-count-1",
  "follower-robot-count-2",
  "follower-robot-count-3",
  "follower-robot-count-4",
  "follower-robot-count-5",
  "follower-robot-count-6",
  "follower-robot-count-7",
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
  bobmods.lib.tech.remove_recipe_unlock("sct-automation-science-pack", "burner-generator")
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

if data.raw.technology["petroleum-generator"] then
  data.raw.technology["petroleum-generator"].effects = {{type = "unlock-recipe", recipe = "petroleum-generator"}}
end
