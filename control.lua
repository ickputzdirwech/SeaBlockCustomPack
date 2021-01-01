local function initialize()
  for i, force in pairs(game.forces) do
    local tech = force.technologies
    local recipe = force.recipes
    local function fix_tech_unlocks(name, tech_name)
      if recipe[name] and tech[tech_name] then
        recipe[name].enabled = false
      end
    end

    fix_tech_unlocks("angelsore5-crushed-smelting", "slag-processing-1")
    fix_tech_unlocks("angelsore6-crushed-smelting", "slag-processing-1")

    fix_tech_unlocks("copper-plate", "ore-crushing")
    fix_tech_unlocks("iron-plate", "ore-crushing")
    fix_tech_unlocks("lead-plate", "ore-crushing")
    fix_tech_unlocks("tin-plate", "ore-crushing")
    fix_tech_unlocks("quartz-glass", "ore-crushing")
    fix_tech_unlocks("silver-plate", "ore-floatation")

  end
end

script.on_configuration_changed(initialize)
