-- OFFSHORE PUMPS
for _, pump in pairs(data.raw["offshore-pump"]) do
  pump.adjacent_tile_collision_test = { "ground-tile", "water-tile", "object-layer" }
  pump.adjacent_tile_collision_mask = nil
  pump.placeable_position_visualization = nil
  pump.flags = {"placeable-neutral", "player-creation"}
  pump.adjacent_tile_collision_box = { { -0.5, -0.25}, {0.5, 0.25} }
end


-- SMALL STORAGE TANKS
if data.raw["storage-tank"]["bob-small-storage-tank"] and data.raw["storage-tank"]["bob-small-inline-storage-tank"] then
  data.raw["storage-tank"]["bob-small-storage-tank"].fluid_box.base_area = 50
  data.raw["storage-tank"]["bob-small-inline-storage-tank"].fluid_box.base_area = 50
end
