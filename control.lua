local tech_list = {
  "physical-projectile-damage-1",
  "physical-projectile-damage-2",
  "physical-projectile-damage-3",
  "physical-projectile-damage-4",
  "physical-projectile-damage-5",
  "physical-projectile-damage-6",
  "physical-projectile-damage-7",
}

local function fix_turret_modifiers(force)
  for _, tech in pairs(tech_list) do
    if force.technologies[tech] and force.technologies["hidden-"..tech] then
      if tech == "physical-projectile-damage-7" then
        force.technologies["hidden-physical-projectile-damage-7"].level = force.technologies[tech].level
      else
        force.technologies["hidden-"..tech].researched = force.technologies[tech].researched
      end
    end
  end
end

script.on_event(defines.events.on_research_finished, function(event)
  fix_turret_modifiers(event.research.force)
end)

script.on_event(defines.events.on_research_reversed, function(event)
  fix_turret_modifiers(event.research.force)
end)

script.on_event(defines.events.on_technology_effects_reset, function(event)
  fix_turret_modifiers(event.force)
end)
