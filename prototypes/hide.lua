-- FUNCTIONS
local function set_flag(type, name, flag)
  local item = data.raw[type][name]
  if item.flags then
    table.insert(item.flags, flag)
  else
    item.flags = {flag}
  end
end

local function set_hidden(name, type)
  if data.raw[type][name] then
    local hide_name = data.raw[type][name]
    hide_name.hidden = true
    if type == "recipe" then
      for _, difficulty in pairs({"normal", "expensive"}) do
        if hide_name[difficulty] then
          hide_name[difficulty].hidden = true
        end
      end
    end
    if type == "technology" then
      for _, tech in pairs(data.raw.technology) do
        if tech.hidden ~= true and tech.prerequisites then
          for i, dependency in pairs(tech.prerequisites) do
            if dependency == name then
              table.remove(tech.prerequisites, i)
              if hide_name.prerequisites then
                for _, prerequisite in pairs(hide_name.prerequisites) do
                  local already_exists = false
                  for _, element in pairs(tech.prerequisites) do
                    if prerequisite == element then
                      already_exists = true
                      break
                    end
                  end
                  if already_exists == false then
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
      if data.raw.item[name.."-barrel"] then
        set_flag("item", name.."-barrel", "hidden")
      end
    elseif data.raw[item_type][name] then
      set_flag(item_type, name, "hidden")
      set_flag(item_type, name, "hide-from-bonus-gui")
    end
  end
  if entity_type and data.raw[entity_type][name] then
    set_flag(entity_type, name, "hidden")
    data.raw[entity_type][name].next_upgrade = nil
    if effect_type == "not-deconstructable" then
      set_flag(entity_type, name, "not-deconstructable")
    end
  end
  if tech_name then
    if effect_type == "unlock-recipe" then
      remove_effect(name, tech_name, effect_type, "recipe")
    elseif effect_type == "landmine" or effect_type == "grenade" or effect_type == "laser-rifle" or effect_type == "beam" then
      remove_effect(effect_type, tech_name, "ammo-damage", "ammo_category")
      remove_effect(effect_type, tech_name, "gun-speed", "ammo_category")
    else
      set_hidden(tech_name, "technology")
    end
  end
end

-- HIDE GROUND WATER PUMP
if data.raw["offshore-pump"]["ground-water-pump"] then
  data.raw["offshore-pump"]["ground-water-pump"].fluid = "fluid-unknown"
end

-- BOBS-LOGISTICS
if settings.startup["ick-seablock-burner-inserter"].value == true then
  hide_stuff("burner-inserter", "item", "inserter", "sb-startup2", "unlock-recipe")
end

-- ANGELS-FLUID-CONTROL
hide_stuff("angels-storage-tank-3", "item", nil, "angels-fluid-control", "unlock-recipe")
hide_stuff("angels-storage-tank-2", "item", nil, "angels-oil-processing", "unlock-recipe")
hide_stuff("angels-storage-tank-1", "item", nil, "gas-processing", "unlock-recipe")

-- PRODUCTION
hide_stuff("accumulator", "item", "accumulator", nil, "electric-energy-accumulators", "unlock-recipe")
if data.raw.technology["electric-energy-accumulators"] and data.raw.recipe["large-accumulator"] then
  table.insert(data.raw.technology["electric-energy-accumulators"].effects, {type = "unlock-recipe", recipe = "large-accumulator"})
  bobmods.lib.tech.remove_recipe_unlock("bob-electric-energy-accumulators-2", "large-accumulator")
end

-- COMBAT
hide_stuff("spidertron-cannon", "item", nil, "tankotron", "unlock-recipe")

if settings.startup["ick-seablock-walls-and-gates"].value == true then
  hide_stuff("stone-wall", "item", nil, "stone-wall")
  hide_stuff("gate", "item", nil, "gate")
  hide_stuff("reinforced-wall", "item", nil, "reinforced-wall")
  hide_stuff("reinforced-gate", "item")
end

hide_stuff("discharge-defense-equipment", "item", nil, "discharge-defense-equipment")
hide_stuff("discharge-defense-remote", "capsule")

hide_stuff("personal-laser-defense-equipment", "item", nil, "personal-laser-defense-equipment")
hide_stuff("personal-laser-defense-equipment-2", "item", nil, "personal-laser-defense-equipment-2")
hide_stuff("personal-laser-defense-equipment-3", "item", nil, "personal-laser-defense-equipment-3")
hide_stuff("personal-laser-defense-equipment-4", "item", nil, "personal-laser-defense-equipment-4")
hide_stuff("personal-laser-defense-equipment-5", "item", nil, "personal-laser-defense-equipment-5")
hide_stuff("personal-laser-defense-equipment-6", "item", nil, "personal-laser-defense-equipment-6")

hide_stuff("grenade", "capsule", nil, "military-2", "unlock-recipe")

hide_stuff(nil, nil, nil, "stronger-explosives-1")
hide_stuff(nil, nil, nil, "stronger-explosives-2")
hide_stuff(nil, nil, nil, "stronger-explosives-3", "grenade")
hide_stuff(nil, nil, nil, "stronger-explosives-4", "grenade")
hide_stuff(nil, nil, nil, "stronger-explosives-5", "grenade")
hide_stuff(nil, nil, nil, "stronger-explosives-6", "grenade")
hide_stuff(nil, nil, nil, "stronger-explosives-7", "grenade")

-- WATER-TREATMENT
hide_stuff("ground-water-pump", "item", nil, "water-treatment", "unlock-recipe")

-- PETROCHEM-REFINING
hide_stuff("nitroglycerin", "fluid", nil, "nitroglycerin-processing")
