--[[if data.raw["item-group"]["logistics"] then
  data.raw["item-group"]["logistics"].icon = "__base__/graphics/technology/electric-energy-distribution-1.png"
  data.raw["item-group"]["logistics"].icon_size = 256
  data.raw["item-group"]["logistics"].icon_mipmaps = 2
end]]
if data.raw["item-group"]["logistics"] then
  data.raw["item-group"]["logistics"].icon = nil
  data.raw["item-group"]["logistics"].icon_size = nil
  data.raw["item-group"]["logistics"].icon_mipmaps = nil
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
    },
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
