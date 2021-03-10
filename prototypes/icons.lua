-- ITEM-GROUP
if data.raw["item-group"]["logistics"] then
  data.raw["item-group"]["logistics"].icons = {
    {
      icon = "__base__/graphics/icons/medium-electric-pole.png",
      icon_size = 64,
      icon_mipmaps = 4,
      shift = {-8, 0}
    },
    {
      icon = "__base__/graphics/icons/logistic-chest-storage.png",
      icon_size = 64,
      icon_mipmaps = 4,
      scale = 0.5,
      shift = {16, 16}
    }
  }
end

if data.raw["item-group"]["bob-logistics"] then
  data.raw["item-group"]["bob-logistics"].icon = "__base__/graphics/item-group/logistics.png"
  data.raw["item-group"]["bob-logistics"].icon_size = 128
  data.raw["item-group"]["bob-logistics"].icon_mipmaps = 2
end

if data.raw["item-group"]["bob-resource-products"] then
  data.raw["item-group"]["bob-resource-products"].icon = "__bobplates__/graphics/icons/technology/gems.png"
  data.raw["item-group"]["bob-resource-products"].icon_size = 64
  data.raw["item-group"]["bob-resource-products"].icon_mipmaps = 1
end


-- ITEM
if data.raw.item["spacex-combinator"] then
  data.raw.item["spacex-combinator"].icon = "__SeaBlockCustomPack__/graphics/spacex-combinator.png"
  data.raw.item["spacex-combinator"].icon_size = 64
  data.raw.item["spacex-combinator"].icon_mipmaps = 4
end


-- RECIPE
if data.raw.recipe["enriched-fuel-from-liquid-fuel"] then
  data.raw.recipe["enriched-fuel-from-liquid-fuel"].icons = angelsmods.functions.create_solid_recipe_icon(
    {"liquid-fuel"},
    "enriched-fuel"
  )
end

if data.raw.recipe["diesel-fuel"] then
  data.raw.recipe["diesel-fuel"].icon = "__KS_Power__/graphics/diesel-fuel.png"
end

if data.raw.item["rocket-booster"] and data.raw.recipe["rocket-booster-1"] and data.raw.recipe["rocket-booster-2"] then
  data.raw.recipe["rocket-booster-1"].icons = {
    {
      icon = "__angelspetrochem__/graphics/icons/rocket-booster.png",
      icon_size = 32
    },
    {
      icon = "__angelsrefining__/graphics/icons/num_1.png",
      tint = angelsmods.petrochem.number_tint,
      icon_size = 32,
      scale = 0.32,
      shift = {-12, -12}
    }
  }
  data.raw.recipe["rocket-booster-2"].icons = {
    {
      icon = "__angelspetrochem__/graphics/icons/rocket-booster.png",
      icon_size = 32
    },
    {
      icon = "__angelsrefining__/graphics/icons/num_2.png",
      tint = angelsmods.petrochem.number_tint,
      icon_size = 32,
      scale = 0.32,
      shift = {-12, -12}
    }
  }
end

if data.raw.recipe["gas-carbon-dioxide-from-wood"] and data.raw.recipe["carbon-separation-2"] then
  data.raw.recipe["gas-carbon-dioxide-from-wood"].icons = angelsmods.functions.create_gas_recipe_icon(
    {{"__angelspetrochem__/graphics/icons/molecules/carbon-dioxide.png", 72}},
    "ccc",
    {{{
     icon = "__angelsrefining__/graphics/icons/num_1.png",
     icon_size = 32,
     tint = angelsmods.petrochem.number_tint
    }}}
  )
  data.raw.recipe["carbon-separation-2"].icons = angelsmods.functions.create_gas_recipe_icon(
    {{"__angelspetrochem__/graphics/icons/molecules/carbon-dioxide.png", 72}},
    "ccc",
    {{{
     icon = "__angelsrefining__/graphics/icons/num_2.png",
     icon_size = 32,
     tint = angelsmods.petrochem.number_tint
    }}}
  )
end

if data.raw.recipe["thermal-bore-water"] and data.raw.recipe["thermal-extractor-water"] then
  data.raw.recipe["thermal-bore-water"].icons = angelsmods.functions.create_liquid_recipe_icon(
    {},
    {{238, 113, 022}, {203, 099, 015}, {167, 078, 013}},
    {{{
      icon = "__angelsrefining__/graphics/icons/num_1.png",
      icon_size = 32,
      tint = angelsmods.refining.number_tint
    }}}
  )
  data.raw.recipe["thermal-extractor-water"].icons = angelsmods.functions.create_liquid_recipe_icon(
    {
      "steam"
    },
    {{238, 113, 022}, {203, 099, 015}, {167, 078, 013}},
    {{{
      icon = "__angelsrefining__/graphics/icons/num_2.png",
      icon_size = 32,
      tint = angelsmods.refining.number_tint
    }}}
  )
end

if data.raw.recipe["coolant-used-filtration-1"] and data.raw.recipe["coolant-used-filtration-2"] then
  data.raw.recipe["coolant-used-filtration-1"].icons = {
    {
      icon = "__angelssmelting__/graphics/icons/liquid-coolant.png"
    },
    {
      icon = "__angelsrefining__/graphics/icons/filter-coal.png",
      scale = 0.4375,
      shift = {-10, -10}
    }
  }
  data.raw.recipe["coolant-used-filtration-1"].icon_size = 32
  data.raw.recipe["coolant-used-filtration-2"].icons = {
    {
      icon = "__angelssmelting__/graphics/icons/liquid-coolant.png"
    },
    {
      icon = "__angelsrefining__/graphics/icons/filter-ceramic.png",
      scale = 0.4375,
      shift = {-10, -10}
    }
  }
  data.raw.recipe["coolant-used-filtration-2"].icon_size = 32
end

if data.raw.recipe["filter-ceramic-refurbish"] then
  data.raw.recipe["filter-ceramic-refurbish"].icon = "__angelsrefining__/graphics/icons/filter-ceramic-used.png"
end


-- ENTITY
if data.raw.lab["lab-2"] and data.raw.item["lab-2"] then
  data.raw.lab["lab-2"].icons = data.raw.item["lab-2"].icons
end


-- TECHNOLOGIES
if data.raw.technology["modules-2"] and data.raw.technology["modules-3"] then
  data.raw.technology["modules-2"].icon_size = 256
  data.raw.technology["modules-3"].icon_size = 256
end

if data.raw.technology["bob-infinite-worker-robots-storage-1"] and data.raw.technology["worker-robots-storage-1"] then
  data.raw.technology["bob-infinite-worker-robots-storage-1"].icons = data.raw.technology["worker-robots-storage-1"].icons
end

-- FIX ALIEN SCIENCE PACK ICONS
local inputs = {
  mod = "bobs",
  group = "technology",
  type = "tool",
  icon_name = "science-pack",
  tier_labels = false,
}

local items = {
  ["alien-science-pack"] = {subgroup = "alien-science-pack", flat_icon = true},
  ["alien-science-pack-blue"] = {subgroup = "alien-science-pack", flat_icon = true},
  ["alien-science-pack-orange"] = {subgroup = "alien-science-pack", flat_icon = true},
  ["alien-science-pack-purple"] = {subgroup = "alien-science-pack", flat_icon = true},
  ["alien-science-pack-yellow"] = {subgroup = "alien-science-pack", flat_icon = true},
  ["alien-science-pack-green"] = {subgroup = "alien-science-pack", flat_icon = true},
  ["alien-science-pack-red"] = {subgroup = "alien-science-pack", flat_icon = true}
}
reskins.lib.create_icons_from_list(items, inputs)
