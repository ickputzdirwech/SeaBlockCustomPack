-- NEW DEPENDENCIES
local function new_dependencies(child_tech, mother_tech)
  if data.raw.technology[child_tech] and data.raw.technology[mother_tech] then
    if data.raw.technology[mother_tech].prerequisites then
      table.insert(data.raw.technology[mother_tech].prerequisites, child_tech)
    else
      data.raw.technology[mother_tech].prerequisites = {child_tech}
    end
  end
end

-- SILOS/WAREHOUSES
new_dependencies("ore-silos", "angels-warehouses")
new_dependencies("logistic-silos", "angels-logistic-warehouses")

-- MODULES
new_dependencies("sct-lab-modules", "speed-module")
new_dependencies("sct-lab-modules", "effectivity-module")
new_dependencies("sct-lab-modules", "productivity-module")


-- ALIEN SCIENCE PACKS
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

add_recipe_unlock("alien-science-pack-blue", "sct-alien-science-pack")
add_recipe_unlock("alien-science-pack-orange", "sct-alien-science-pack")
add_recipe_unlock("alien-science-pack-purple", "sct-alien-science-pack")
add_recipe_unlock("alien-science-pack-yellow", "sct-alien-science-pack")
add_recipe_unlock("alien-science-pack-green", "sct-alien-science-pack")
add_recipe_unlock("alien-science-pack-red", "sct-alien-science-pack")


-- REPLACE GOLD SCIENCE PACK
if settings.startup["ick-seablock-science-packs"].value == true then
  local function add_science_pack(tech, pack, amount)
    local insert = true
    for i, ingredient in pairs(tech) do
      if ingredient[1] == pack then
        insert = false
        ingredient[2] = ingredient[2] + amount
      elseif ingredient.name == pack then
        insert = false
        ingredient.amount = ingredient.amount + amount
      end
    end
    if insert then
      table.insert(tech, {pack, amount})
    end
  end

  local function replace_gold(tech)
    if tech.unit and tech.unit.ingredients then
      for i, ingredient in pairs(tech.unit.ingredients) do
        if ingredient[1] == "science-pack-gold" then
          add_science_pack(tech.unit.ingredients, "automation-science-pack", ingredient[2])
          add_science_pack(tech.unit.ingredients, "logistic-science-pack", ingredient[2])
          add_science_pack(tech.unit.ingredients, "chemical-science-pack", ingredient[2])
          add_science_pack(tech.unit.ingredients, "military-science-pack", ingredient[2])
          table.remove(tech.unit.ingredients, i)
        elseif ingredient.name == "science-pack-gold" then
          add_science_pack(tech.unit.ingredients, "automation-science-pack", ingredient.amount)
          add_science_pack(tech.unit.ingredients, "logistic-science-pack", ingredient.amount)
          add_science_pack(tech.unit.ingredients, "chemical-science-pack", ingredient.amount)
          add_science_pack(tech.unit.ingredients, "military-science-pack", ingredient.amount)
          table.remove(tech.unit.ingredients, i)
        end
      end
    end
  end

  for _, technology in pairs(data.raw.technology) do
    local tech = data.raw.technology[technology.name]
    if tech.unit then
      replace_gold(tech)
    end
    if tech.normal then
      replace_gold(tech.normal)
    end
    if tech.expensive then
      replace_gold(tech.expensive)
    end
  end

  if data.raw.lab["lab-alien"] and data.raw.lab["lab-alien"].inputs then
    local inputs = data.raw.lab["lab-alien"].inputs
    for i, item in pairs(inputs) do
      if item == "science-pack-gold" then
        table.remove(inputs, i)
      end
    end
    table.insert(inputs, 1, "automation-science-pack")
    table.insert(inputs, 2, "logistic-science-pack")
    table.insert(inputs, 3, "chemical-science-pack")
    table.insert(inputs, 4, "military-science-pack")
  end
end
