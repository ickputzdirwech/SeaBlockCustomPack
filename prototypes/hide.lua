-- FUNCTIONS
local function set_flag_hidden(name, type)
  local item = data.raw[type][name]
  if item.flags then
    table.insert(item.flags, "hidden")
  else
    item.flags = {"hidden"}
  end
end

local function set_hidden(name, type)
  if data.raw[type][name] then
    local hide_name = data.raw[type][name]
    hide_name.hidden = true
    if type == "technology" then
      for _, tech in pairs(data.raw.technology) do
        if tech.hidden ~= true and tech.prerequisites then
          for i, dependency in pairs(tech.prerequisites) do
            if dependency == name then
              table.remove(tech.prerequisites, i)
              if hide_name.prerequisites then
                for _, prerequisite in pairs(hide_name.prerequisites) do
                  ickputzdirwech = {}
                  ickputzdirwech.insert = true
                  for _, already_exists in pairs(tech.prerequisites) do
                    if prerequisite == already_exists then
                      ickputzdirwech.insert = false
                    end
                  end
                  if ickputzdirwech.insert == true then
                    table.insert(tech.prerequisites, prerequisite)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

local function remove_effect(name, tech_name, effect_type, key)
  if data.raw.technology[tech_name] and data.raw.technology[tech_name].effects then
    local tech = data.raw.technology[tech_name]
    for i, effect in pairs(tech.effects) do
      if effect.type == effect_type and effect[key] == name then
        table.remove(tech.effects, i)
      end
    end
  end
end

local function hide_stuff(name, item_type, entity_type, tech_name, effect_type)
  set_hidden(name, "recipe")
  if item_type then
    if item_type == "fluid" then
      set_hidden(name, "fluid")
    elseif data.raw[item_type][name] then
      set_flag_hidden(name, item_type)
    end
  end
  if entity_type and data.raw[entity_type][name] then
    set_flag_hidden(name, entity_type)
    data.raw[entity_type][name].next_upgrade = nil
  end
  if tech_name then
    if effect_type == "unlock-recipe" then
      remove_effect(name, tech_name, effect_type, "recipe")
    elseif effect_type == "landmine" then
      remove_effect("landmine", tech_name, "ammo-damage", "ammo_category")
    else
      set_hidden(tech_name, "technology")
    end
  end
end


-- HIDE MINING RECIPES
data:extend({{
		type = "resource-category",
		name = "nothing"
}})

for _, drill in pairs(data.raw["mining-drill"]) do
  drill.resource_categories = {"nothing"}
end

local function remove_ore(name)
  if data.raw["resource"][name] then
    data.raw["resource"][name] = nil
  end
end

remove_ore("angels-ore1")
remove_ore("angels-ore2")
remove_ore("angels-ore3")
remove_ore("angels-ore4")
remove_ore("angels-ore5")
remove_ore("angels-ore6")

if data.raw["offshore-pump"]["ground-water-pump"] then
  data.raw["offshore-pump"]["ground-water-pump"].fluid = "fluid-unknown"
end


-- LOGISTICS
hide_stuff("bob-armoured-locomotive", "item-with-entity-data", "locomotive", "bob-armoured-railway")
hide_stuff("bob-armoured-cargo-wagon", "item-with-entity-data", "cargo-wagon")
hide_stuff("bob-armoured-locomotive-2", "item-with-entity-data", "locomotive", "bob-armoured-railway-2")
hide_stuff("bob-armoured-cargo-wagon-2", "item-with-entity-data", "cargo-wagon")
hide_stuff("bob-armoured-fluid-wagon", "item-with-entity-data", "fluid-wagon", "bob-armoured-fluid-wagon")
hide_stuff("bob-armoured-fluid-wagon-2", "item-with-entity-data", "fluid-wagon", "bob-armoured-fluid-wagon-2")

hide_stuff("silo-ore1", "item", nil, "ore-silos", "unlock-recipe")
hide_stuff("silo-ore2", "item", nil, "ore-silos", "unlock-recipe")
hide_stuff("silo-ore3", "item", nil, "ore-silos", "unlock-recipe")
hide_stuff("silo-ore4", "item", nil, "ore-silos", "unlock-recipe")
hide_stuff("silo-ore5", "item", nil, "ore-silos", "unlock-recipe")
hide_stuff("silo-ore6", "item", nil, "ore-silos", "unlock-recipe")
hide_stuff("silo-coal", "item", nil, "ore-silos", "unlock-recipe")


-- BOBS-LOGISTICS
hide_stuff("steam-inserter", "item", "inserter", "sct-automation-science-pack", "unlock-recipe")

if settings.startup["ick-seablock-burner-inserter"].value == true then
  hide_stuff("burner-inserter", "item", "inserter", "sb-startup2", "unlock-recipe")
end


-- ANGELS-FLUID-CONTROL
hide_stuff("valve-converter", "item", nil, "angels-fluid-control", "unlock-recipe")

hide_stuff("angels-storage-tank-3", "item", nil, "angels-fluid-control", "unlock-recipe")
hide_stuff("angels-storage-tank-2", "item", nil, "angels-oil-processing", "unlock-recipe")
hide_stuff("angels-storage-tank-1", "item", nil, "gas-processing", "unlock-recipe")
hide_stuff("angels-pressure-tank-1", "item", nil, "pressure-tanks")


-- PRODUCTION
hide_stuff("burner-mining-drill", nil, "mining-drill")
hide_stuff("electric-mining-drill", nil, "mining-drill")
hide_stuff("pumpjack", nil, "mining-drill")

hide_stuff("accumulator", "item", "accumulator", nil, "electric-energy-accumulators", "unlock-recipe")
if data.raw.technology["electric-energy-accumulators"] and data.raw.recipe["large-accumulator"] then
  table.insert(data.raw.technology["electric-energy-accumulators"].effects, {type = "unlock-recipe", recipe = "large-accumulator"})
  bobmods.lib.tech.remove_recipe_unlock("bob-electric-energy-accumulators-2", "large-accumulator")
end

hide_stuff("burner-generator", "item", nil, "sct-automation-science-pack", "unlock-recipe")
hide_stuff("big-burner-generator", "item", nil, "big-burner-generator")
hide_stuff("petroleum-generator", "item", nil, "petroleum-generator", "unlock-recipe")
hide_stuff("oil-steam-boiler", "item", nil, "OilBurning")

hide_stuff("burner-reactor", "item", "reactor", "burner-reactor-1")
hide_stuff("burner-reactor-2", "item", "reactor", "burner-reactor-2")
hide_stuff("burner-reactor-3", "item", "reactor", "burner-reactor-3")
hide_stuff("fluid-reactor", "item", "reactor", "fluid-reactor-1")
hide_stuff("fluid-reactor-from-fluid-furnace")
hide_stuff("fluid-reactor-2", "item", "reactor", "fluid-reactor-2")
hide_stuff("fluid-reactor-3", "item", "reactor", "fluid-reactor-3")

hide_stuff("stone-chemical-furnace", "item", "assembling-machine", "chemical-processing-1")
hide_stuff("steel-chemical-furnace", "item", "assembling-machine", "steel-chemical-furnace")
hide_stuff("electric-chemical-furnace", "item", "assembling-machine", "electric-chemical-furnace")

hide_stuff("stone-mixing-furnace", "item", "assembling-machine", "alloy-processing", "unlock-recipe")
hide_stuff("steel-mixing-furnace", "item", "assembling-machine", "steel-mixing-furnace")
hide_stuff("electric-mixing-furnace", "item", "assembling-machine", "electric-mixing-furnace")

hide_stuff("electrolyser", nil, "assembling-machine")


-- MODULES
hide_stuff("pollution-clean-processor", "tool")
hide_stuff("pollution-clean-processor-2", "item")
hide_stuff("pollution-clean-processor-3", "item")
hide_stuff("pollution-create-processor", "tool")
hide_stuff("pollution-create-processor-2", "item")
hide_stuff("pollution-create-processor-3", "item")


-- INTERMEDIATE-PRODUCTS
hide_stuff("robot-brain-combat", "item")
hide_stuff("robot-tool-combat", "item")
hide_stuff("robot-brain-combat-2", "item")
hide_stuff("robot-tool-combat-2", "item")
hide_stuff("robot-brain-combat-3", "item")
hide_stuff("robot-tool-combat-3", "item")
hide_stuff("robot-brain-combat-4", "item")
hide_stuff("robot-tool-combat-4", "item")


-- COMBAT
hide_stuff("spidertron-cannon", "item", nil, "tankotron", "unlock-recipe")

hide_stuff("land-mine", "item", "land-mine", "land-mine")
hide_stuff("distractor-mine", "item", "land-mine", "distractor-mine")
hide_stuff("poison-mine", "item", "land-mine", "poison-mine")
hide_stuff("slowdown-mine", "item", "land-mine", "slowdown-mine")
hide_stuff(nil, nil, nil, "stronger-explosives-2", "landmine")
hide_stuff(nil, nil, nil, "stronger-explosives-3", "landmine")
hide_stuff(nil, nil, nil, "stronger-explosives-4", "landmine")
hide_stuff(nil, nil, nil, "stronger-explosives-5", "landmine")
hide_stuff(nil, nil, nil, "stronger-explosives-6", "landmine")
hide_stuff(nil, nil, nil, "stronger-explosives-7", "landmine")

hide_stuff("defender-robot", "item", nil, "defender")
hide_stuff("distractor-robot", "item", nil, "distractor")
hide_stuff("destroyer-robot", "item", nil, "destroyer")
hide_stuff("bob-laser-robot", "item", "combat-robot", "bob-laser-robot")
hide_stuff("defender-capsule", "capsule")
hide_stuff("distractor-capsule", "capsule")
hide_stuff("destroyer-capsule", "capsule")
hide_stuff("bob-laser-robot-capsule", "capsule")
hide_stuff("defender", nil, "combat-robot")
hide_stuff("distractor", nil, "combat-robot")
hide_stuff("destroyer", nil, "combat-robot")

hide_stuff("bob-robot-gun-drone", "item", "unit", "bob-robot-gun-drones")
hide_stuff("bob-robot-laser-drone", "item", "unit", "bob-robot-laser-drones")
hide_stuff("bob-robot-flamethrower-drone", "item", "unit", "bob-robot-flamethrower-drones")
hide_stuff("bob-robot-plasma-drone", "item", "unit", "bob-robot-plasma-drones")

hide_stuff("robot-drone-frame", "item", nil, "robotics", "remove-unlock")
hide_stuff("robot-drone-frame-large", "item", nil, "robotics", "remove-unlock")

hide_stuff("combat-robot-dispenser-equipment", "item")

hide_stuff(nil, nil, nil, "follower-robot-count-1")
hide_stuff(nil, nil, nil, "follower-robot-count-2")
hide_stuff(nil, nil, nil, "follower-robot-count-3")
hide_stuff(nil, nil, nil, "follower-robot-count-4")
hide_stuff(nil, nil, nil, "follower-robot-count-5")
hide_stuff(nil, nil, nil, "follower-robot-count-6")
hide_stuff(nil, nil, nil, "follower-robot-count-7")

hide_stuff("heavy-armor-2", "armor", nil, "bob-armor-making-3")
hide_stuff("heavy-armor-3", "armor", nil, "bob-armor-making-4")

if settings.startup["ick-seablock-walls-and-gates"].value == true then
  hide_stuff("stone-wall", "item", nil, "stone-wall")
  hide_stuff("gate", "item", nil, "gate")
  hide_stuff("reinforced-wall", "item", nil, "reinforced-wall")
  hide_stuff("reinforced-gate", "item")
end


-- WATER-TREATMENT
hide_stuff("lithia-water", "fluid")
hide_stuff("ground-water-pump", "item", nil, "water-treatment", "unlock-recipe")
