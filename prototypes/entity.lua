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


-- DUMMY TURRET
local t = data.raw.technology
local n = "physical-projectile-damage-"
if t[n.."1"] and t[n.."2"] and t[n.."3"] and t[n.."4"] and t[n.."5"] and t[n.."6"] and t[n.."7"] then

  local turret_list = {}

  for _, turret in pairs(data.raw["ammo-turret"]) do
    table.insert(turret_list, turret.name)
  end

  data:extend({
    {
      name = "ammo-turret-dummy",
      type = "ammo-turret",
      icons = {
        {
          icon = "__base__/graphics/icons/gun-turret.png",
          icon_mipmaps = 4,
        },
        {
          icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-damage.png",
          icon_mipmaps = 2,
        }
      },
      icon_size = 64,
      localised_description = {"", "\n"},
      attack_parameters = {type = "projectile", range = 0, cooldown = 0},
      call_for_help_radius = 0,
      folded_animation = data.raw["ammo-turret"][turret_list[1]].folded_animation,
      automated_ammo_count= 0,
      inventory_size = 0,
    }
  })

  local tech_list = {
    {name = "physical-projectile-damage-1", value = 0.1},
    {name = "physical-projectile-damage-2", value = 0.1},
    {name = "physical-projectile-damage-3", value = 0.2},
    {name = "physical-projectile-damage-4", value = 0.2},
    {name = "physical-projectile-damage-5", value = 0.2},
    {name = "physical-projectile-damage-6", value = 0.4},
    {name = "physical-projectile-damage-7", value = 0.7},
  }

  for _, tech in pairs(tech_list) do
    local visible_tech = data.raw.technology[tech.name]
    local hidden_tech = table.deepcopy(visible_tech)
      hidden_tech.name = "hidden-"..tech.name
      hidden_tech.localised_name = {"", {"technology-name.physical-projectile-damage"}, " "..string.sub(tech.name, 28).." - HIDDEN COPY"}
      hidden_tech.effects = {}
      for _, turret in pairs(turret_list) do
        table.insert(hidden_tech.effects, {type = "turret-attack", turret_id = turret, modifier = tech.value})
        for i, effect in pairs(visible_tech.effects) do
          if effect.type == "turret-attack" and effect.turret_id == turret then
            table.remove(visible_tech.effects, i)
          end
        end
      end
      hidden_tech.hidden = true
    data:extend({hidden_tech})

    table.insert(visible_tech.effects, {type = "turret-attack", turret_id = "ammo-turret-dummy", modifier = tech.value})

  end

  for _, turret in pairs(turret_list) do
    if data.raw["ammo-turret"][turret].flags then
      table.insert(data.raw["ammo-turret"][turret].flags, "hidden")
    else
      data.raw["ammo-turret"][turret].flags = {"hidden"}
    end
  end

  for i, turret in pairs(turret_list) do
    local description = data.raw["ammo-turret"]["ammo-turret-dummy"].localised_description
    if i == 1 then
      table.insert(description, 2, "\n[font=heading-1][entity="..turret.."] [.font]")
      table.insert(description, 3, {"entity-name."..turret})
    elseif i < 10 then
      table.insert(description, i*2, "\n\n[font=heading-1][entity="..turret.."] [.font]")
      table.insert(description, i*2+1, {"entity-name."..turret})
    else
      local size = table_size(turret_list)-9
      table.remove(description, 20)
      table.insert(description, 20, "\n\n and "..size.." more")
      break
    end
  end

end
