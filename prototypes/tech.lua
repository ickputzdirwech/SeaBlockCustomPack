--[[
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


local function add_dependency(child_tech, mother_tech)
  if data.raw.technology[child_tech] and data.raw.technology[mother_tech] then
    table.insert(data.raw.technology[mother_tech].prerequisites, child_tech)
  end
end
]]


local function new_dependencies(child_tech, mother_tech)
  if data.raw.technology[child_tech] and data.raw.technology[mother_tech] then
    data.raw.technology[mother_tech].prerequisites = {child_tech}
  end
end

new_dependencies("ore-silos", "angels-warehouses")
new_dependencies("logistic-silos", "angels-logistic-warehouses")
