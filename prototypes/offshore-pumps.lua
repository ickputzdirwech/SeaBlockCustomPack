for _, pump in pairs(data.raw["offshore-pump"]) do
  pump.adjacent_tile_collision_test = { "ground-tile", "water-tile", "object-layer" }
  pump.adjacent_tile_collision_mask = nil
  pump.placeable_position_visualization = nil
  pump.flags = {"placeable-neutral", "player-creation"}
  pump.adjacent_tile_collision_box = { { -0.5, -0.25}, {0.5, 0.25} }
end
