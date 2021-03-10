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


-- HIDE GROUND WATER RECIPE
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


-- PRODUCTION
hide_stuff("accumulator", "item", "accumulator", nil, "electric-energy-accumulators", "unlock-recipe")
if data.raw.technology["electric-energy-accumulators"] and data.raw.recipe["large-accumulator"] then
  table.insert(data.raw.technology["electric-energy-accumulators"].effects, {type = "unlock-recipe", recipe = "large-accumulator"})
  bobmods.lib.tech.remove_recipe_unlock("bob-electric-energy-accumulators-2", "large-accumulator")
end

hide_stuff("burner-generator", "item", nil, "sct-automation-science-pack", "unlock-recipe")
hide_stuff("big-burner-generator", "item", nil, "big-burner-generator")
hide_stuff("petroleum-generator", "item", nil, "petroleum-generator", "unlock-recipe")
hide_stuff("oil-steam-boiler", "item", nil, "OilBurning")

hide_stuff("electrolyser", nil, "assembling-machine")


-- SCIENCE
hide_stuff("science-pack-gold", "tool", nil, "sct-science-pack-gold")
hide_stuff(nil, nil, nil, "alien-research")


-- COMBAT
hide_stuff("spidertron-cannon", "item", nil, "tankotron", "unlock-recipe")

hide_stuff("laser-rifle", "gun", nil, "bob-laser-rifle")
hide_stuff("laser-rifle-battery-case", "item")
hide_stuff("laser-rifle-battery", "ammo")
hide_stuff("laser-rifle-battery-ruby", "ammo", nil, "bob-laser-rifle-ammo-1")
hide_stuff("laser-rifle-battery-sapphire", "ammo", nil, "bob-laser-rifle-ammo-2")
hide_stuff("laser-rifle-battery-emerald", "ammo", nil, "bob-laser-rifle-ammo-3")
hide_stuff("laser-rifle-battery-amethyst", "ammo", nil, "bob-laser-rifle-ammo-4")
hide_stuff("laser-rifle-battery-topaz", "ammo", nil, "bob-laser-rifle-ammo-5")
hide_stuff("laser-rifle-battery-diamond", "ammo", nil, "bob-laser-rifle-ammo-6")

hide_stuff(nil, nil, nil, "energy-weapons-damage-1", "laser-rifle")
hide_stuff(nil, nil, nil, "energy-weapons-damage-2", "laser-rifle")
hide_stuff(nil, nil, nil, "energy-weapons-damage-3", "laser-rifle")
hide_stuff(nil, nil, nil, "energy-weapons-damage-4", "laser-rifle")
hide_stuff(nil, nil, nil, "energy-weapons-damage-5", "laser-rifle")
hide_stuff(nil, nil, nil, "energy-weapons-damage-6", "laser-rifle")
hide_stuff(nil, nil, nil, "energy-weapons-damage-7", "laser-rifle")

hide_stuff(nil, nil, nil, "weapon-shooting-speed-3", "laser-rifle")
hide_stuff(nil, nil, nil, "weapon-shooting-speed-4", "laser-rifle")
hide_stuff(nil, nil, nil, "weapon-shooting-speed-5", "laser-rifle")
hide_stuff(nil, nil, nil, "weapon-shooting-speed-6", "laser-rifle")

hide_stuff("acid-bullet-magazine", "ammo", nil, "bob-acid-bullets")
hide_stuff("acid-bullet-projectile", "item")
hide_stuff("acid-bullet", "item")
hide_stuff("ap-bullet-magazine", "ammo", nil, "bob-ap-bullets")
hide_stuff("ap-bullet-projectile", "item")
hide_stuff("ap-bullet", "item")
hide_stuff("electric-bullet-magazine", "ammo", nil, "bob-electric-bullets")
hide_stuff("electric-bullet-projectile", "item")
hide_stuff("electric-bullet", "item")
hide_stuff("flame-bullet-magazine", "ammo", nil, "bob-flame-bullets")
hide_stuff("flame-bullet-projectile", "item")
hide_stuff("flame-bullet", "item")
hide_stuff("he-bullet-magazine", "ammo", nil, "bob-he-bullets")
hide_stuff("he-bullet-projectile", "item")
hide_stuff("he-bullet", "item")
hide_stuff("plasma-bullet-magazine", "ammo", nil, "bob-plasma-bullets")
hide_stuff("plasma-bullet-projectile", "item")
hide_stuff("plasma-bullet", "item")
hide_stuff("poison-bullet-magazine", "ammo", nil, "bob-poison-bullets")
hide_stuff("poison-bullet-projectile", "item")
hide_stuff("poison-bullet", "item")
hide_stuff("uranium-bullet-projectile", "item", nil, "uranium-ammo", "unlock-recipe")
hide_stuff("uranium-bullet", "item", nil, "uranium-ammo", "unlock-recipe")

hide_stuff("bullet-magazine", "ammo", nil, "bob-bullets")
hide_stuff("magazine", "item")
hide_stuff("bullet", "item")
hide_stuff("bullet-projectile", "item")
hide_stuff("bullet-casing", "item")

hide_stuff("shotgun-acid-shell", "ammo", nil, "bob-shotgun-acid-shells")
hide_stuff("shotgun-ap-shell", "ammo", nil, "bob-shotgun-ap-shells")
hide_stuff("shotgun-electric-shell", "ammo", nil, "bob-shotgun-electric-shells")
hide_stuff("shotgun-flame-shell", "ammo", nil, "bob-shotgun-flame-shells")
hide_stuff("shotgun-explosive-shell", "ammo", nil, "bob-shotgun-explosive-shells")
hide_stuff("shotgun-plasma-shell", "ammo", nil, "bob-shotgun-plasma-shells")
hide_stuff("shotgun-poison-shell", "ammo", nil, "bob-shotgun-poison-shells")
hide_stuff("shotgun-uranium-shell", "ammo", nil, "uranium-ammo", "unlock-recipe")

hide_stuff("scatter-cannon-shell", "ammo", nil, "bob-scatter-cannon-shells")

hide_stuff("better-shotgun-shell", "ammo", nil, "bob-shotgun-shells")
hide_stuff("shotgun-shell-casing", "item")
hide_stuff("shot", "item")

hide_stuff("cordite", "item", nil, "cordite-processing")
hide_stuff("petroleum-jelly", "item")
hide_stuff("gun-cotton", "item")

hide_stuff("bob-acid-rocket", "ammo", nil, "bob-acid-rocket")
hide_stuff("acid-rocket-warhead", "item")
hide_stuff("bob-electric-rocket", "ammo", nil, "bob-electric-rocket")
hide_stuff("electric-rocket-warhead", "item")
hide_stuff("bob-explosive-rocket", "ammo", nil, "bob-explosive-rocket")
hide_stuff("explosive-rocket-warhead", "item")
hide_stuff("bob-flame-rocket", "ammo", nil, "bob-flame-rocket")
hide_stuff("flame-rocket-warhead", "item")
hide_stuff("bob-piercing-rocket", "ammo", nil, "bob-piercing-rocket")
hide_stuff("piercing-rocket-warhead", "item")
hide_stuff("bob-plasma-rocket", "ammo", nil, "bob-plasma-rocket")
hide_stuff("plasma-rocket-warhead", "item")
hide_stuff("bob-poison-rocket", "ammo", nil, "bob-poison-rocket")
hide_stuff("poison-rocket-warhead", "item")
hide_stuff("bob-rocket", "ammo", nil, "bob-rocket")
hide_stuff("rocket-warhead", "item")
hide_stuff("rocket-body", "item")
hide_stuff("rocket-engine", "item", nil, "rocketry", "unlock-recipe")

hide_stuff("land-mine", "item", "land-mine", "land-mine")
hide_stuff("distractor-mine", "item", "land-mine", "distractor-mine")
hide_stuff("poison-mine", "item", "land-mine", "poison-mine")
hide_stuff("slowdown-mine", "item", "land-mine", "slowdown-mine")

hide_stuff("atomic-artillery-shell", "ammo", nil, "bob-atomic-artillery-shell")
hide_stuff("distractor-artillery-shell", "ammo", nil, "bob-distractor-artillery-shells")
hide_stuff("explosive-artillery-shell", "ammo", nil, "bob-explosive-artillery-shells")
hide_stuff("fire-artillery-shell", "ammo", nil, "bob-fire-artillery-shells")
hide_stuff("poison-artillery-shell", "ammo", nil, "bob-poison-artillery-shells")

hide_stuff(nil, nil, nil, "stronger-explosives-2", "landmine")
hide_stuff(nil, nil, nil, "stronger-explosives-3", "landmine")
hide_stuff(nil, nil, nil, "stronger-explosives-4", "landmine")
hide_stuff(nil, nil, nil, "stronger-explosives-5", "landmine")
hide_stuff(nil, nil, nil, "stronger-explosives-6", "landmine")
hide_stuff(nil, nil, nil, "stronger-explosives-7", "landmine")

hide_stuff("defender-capsule", "capsule")
hide_stuff("distractor-capsule", "capsule")
hide_stuff("destroyer-capsule", "capsule")
hide_stuff("defender", nil, "combat-robot", "defender")
hide_stuff("distractor", nil, "combat-robot", "distractor")
hide_stuff("destroyer", nil, "combat-robot", "destroyer")

hide_stuff(nil, nil, nil, "energy-weapons-damage-5", "beam")
hide_stuff(nil, nil, nil, "energy-weapons-damage-6", "beam")
hide_stuff(nil, nil, nil, "energy-weapons-damage-7", "beam")

hide_stuff("bob-robot-gun-drone", "item", "unit", "bob-robot-gun-drones")
hide_stuff("bob-robot-laser-drone", "item", "unit", "bob-robot-laser-drones")
hide_stuff("bob-robot-flamethrower-drone", "item", "unit", "bob-robot-flamethrower-drones")
hide_stuff("bob-robot-plasma-drone", "item", "unit", "bob-robot-plasma-drones")

hide_stuff("robot-drone-frame", "item", nil, "robotics", "unlock-recipe")
hide_stuff("robot-drone-frame-large", "item", nil, "robotics", "unlock-recipe")

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

hide_stuff("discharge-defense-equipment", "item", nil, "discharge-defense-equipment")
hide_stuff("discharge-defense-remote", "capsule")

hide_stuff("personal-laser-defense-equipment", "item", nil, "personal-laser-defense-equipment")
hide_stuff("personal-laser-defense-equipment-2", "item", nil, "personal-laser-defense-equipment-2")
hide_stuff("personal-laser-defense-equipment-3", "item", nil, "personal-laser-defense-equipment-3")
hide_stuff("personal-laser-defense-equipment-4", "item", nil, "personal-laser-defense-equipment-4")
hide_stuff("personal-laser-defense-equipment-5", "item", nil, "personal-laser-defense-equipment-5")
hide_stuff("personal-laser-defense-equipment-6", "item", nil, "personal-laser-defense-equipment-6")

hide_stuff("flamethrower", "gun", nil, "flamethrower")
hide_stuff("flamethrower-ammo", "ammo")
hide_stuff("flamethrower-turret", "item", "fluid-turret")

hide_stuff(nil, nil, nil, "refined-flammables-1")
hide_stuff(nil, nil, nil, "refined-flammables-2")
hide_stuff(nil, nil, nil, "refined-flammables-3")
hide_stuff(nil, nil, nil, "refined-flammables-4")
hide_stuff(nil, nil, nil, "refined-flammables-5")
hide_stuff(nil, nil, nil, "refined-flammables-6")
hide_stuff(nil, nil, nil, "refined-flammables-7")

hide_stuff("cluster-grenade", "capsule", nil, "military-4", "unlock-recipe")
hide_stuff("grenade", "capsule", nil, "military-2", "unlock-recipe")
hide_stuff("fire-capsule", "capsule", nil, "military-3", "unlock-recipe")
hide_stuff("poison-capsule", "capsule", nil, "military-3", "unlock-recipe")
hide_stuff("slowdown-capsule", "capsule", nil, "military-3", "unlock-recipe")

hide_stuff(nil, nil, nil, "stronger-explosives-1")
hide_stuff(nil, nil, nil, "stronger-explosives-2")
hide_stuff(nil, nil, nil, "stronger-explosives-3", "grenade")
hide_stuff(nil, nil, nil, "stronger-explosives-4", "grenade")
hide_stuff(nil, nil, nil, "stronger-explosives-5", "grenade")
hide_stuff(nil, nil, nil, "stronger-explosives-6", "grenade")
hide_stuff(nil, nil, nil, "stronger-explosives-7", "grenade")


-- ANGELS-CASTING
hide_stuff("angels-rod-stack-iron", "item")
hide_stuff("angels-rod-iron", "item")

hide_stuff("gunmetal-alloy", "item", nil, "angels-gunmetal-smelting-1")
hide_stuff("angels-plate-gunmetal")
hide_stuff("angels-gunmetal-smelting-1")
hide_stuff("liquid-molten-gunmetal", "fluid")


-- WATER-TREATMENT
hide_stuff("lithia-water", "fluid")
hide_stuff("ground-water-pump", "item", nil, "water-treatment", "unlock-recipe")


-- PETROCHEM-REFINING
hide_stuff("nitroglycerin", "fluid", nil, "nitroglycerin-processing")


-- BOB-ALIEN-RESOURCE
hide_stuff("alien-blue-alloy", "item", nil, "alien-blue-research")
hide_stuff("alien-orange-alloy", "item", nil, "alien-orange-research")
hide_stuff("alien-acid", "fluid", nil, "alien-purple-research")
hide_stuff("alien-explosive", "fluid", nil, "alien-yellow-research")
hide_stuff("alien-poison", "fluid", nil, "alien-green-research")
hide_stuff("alien-fire", "fluid", nil, "alien-red-research")
