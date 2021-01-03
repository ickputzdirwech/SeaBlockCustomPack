local function add_recipe_unlock(name, tech_name)
  if data.raw.recipe[name] and data.raw.technology[tech_name] then
    data.raw.recipe[name].enabled = false
    local tech = data.raw.technology[tech_name]
    if tech.effects then
      table.insert(tech.effects, {type = "unlock-recipe", recipe = name})
    else
      tech.effects = {{type = "unlock-recipe", recipe = name}}
    end
  end
end

add_recipe_unlock("bob-ruby-3", "geode-crystallization-1")
add_recipe_unlock("bob-sapphire-3", "geode-crystallization-1")
add_recipe_unlock("bob-emerald-3", "geode-crystallization-1")
add_recipe_unlock("bob-amethyst-3", "geode-crystallization-1")
add_recipe_unlock("bob-topaz-3", "geode-crystallization-1")
add_recipe_unlock("bob-diamond-3", "geode-crystallization-1")


add_recipe_unlock("alien-artifact-red-from-small", "bio-processing-alien-3")
add_recipe_unlock("alien-artifact-yellow-from-small", "bio-processing-alien-3")
add_recipe_unlock("alien-artifact-orange-from-small", "bio-processing-alien-3")
add_recipe_unlock("alien-artifact-blue-from-small", "bio-processing-alien-3")
add_recipe_unlock("alien-artifact-purple-from-small", "bio-processing-alien-3")
add_recipe_unlock("alien-artifact-green-from-small", "bio-processing-alien-3")
add_recipe_unlock("alien-artifact-from-small", "bio-processing-alien-3")


add_recipe_unlock("angelsore5-crushed", "slag-processing-1")
add_recipe_unlock("angelsore6-crushed", "slag-processing-1")

-- The following eight recipes need a migration. Unfortunately this can't be done during the migration phase, because some other mods mess with it in control.lua script.on_configuration_changed(). This means I have to do it there as well which has the side effect, that it doesn't work if the configuration didn't change.
add_recipe_unlock("angelsore5-crushed-smelting", "slag-processing-1")
add_recipe_unlock("angelsore6-crushed-smelting", "slag-processing-1")


add_recipe_unlock("copper-plate", "ore-crushing")
add_recipe_unlock("iron-plate", "ore-crushing")
add_recipe_unlock("lead-plate", "ore-crushing")
add_recipe_unlock("tin-plate", "ore-crushing")
add_recipe_unlock("quartz-glass", "ore-crushing")
add_recipe_unlock("silver-plate", "ore-floatation")


local function add_dependency(child_tech, mother_tech)
  if data.raw.technology[child_tech] and data.raw.technology[mother_tech] then
    table.insert(data.raw.technology[mother_tech].prerequisites, child_tech)
  end
end

add_dependency("slag-processing-1", "angels-lead-smelting-1")
add_dependency("slag-processing-1", "angels-tin-smelting-1")


local function new_dependencies(child_tech, mother_tech)
  if data.raw.technology[child_tech] and data.raw.technology[mother_tech] then
    data.raw.technology[mother_tech].prerequisites = {child_tech}
  end
end

new_dependencies("ore-silos", "angels-warehouses")
new_dependencies("logistic-silos", "angels-logistic-warehouses")
