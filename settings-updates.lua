-- FUNCTIONS
local function force_value(name, new_value)
  if data.raw["bool-setting"][name] then
    data.raw["bool-setting"][name].forced_value = new_value
    data.raw["bool-setting"][name].hidden = true
  end
end

local function hide_setting(type, name)
  if data.raw[type][name] then
    data.raw[type][name].hidden = true
  end
end

local function change_default(type, name, new_value)
  if data.raw[type][name] then
    data.raw[type][name].default_value = new_value
  end
end


-- ANGELSADDONS-STORAGE
force_value("angels-enable-pressure-tank", false)


-- ANGELSREFINING
change_default("bool-setting", "angels-enable-auto-barreling", true)

force_value("angels-starting-resource-ore1", false)
force_value("angels-starting-resource-ore2", false)
force_value("angels-starting-resource-ore3", false)
force_value("angels-starting-resource-ore4", false)
force_value("angels-starting-resource-ore5", false)
force_value("angels-starting-resource-ore6", false)

hide_setting("double-setting", "angels-starting-resource-base")


-- BARAWS
change_default("bool-setting", "baraws-all-made-in", true)
change_default("bool-setting", "baraws-all-products", true)


-- BOBASSEMBLY
force_value("bobmods-assembly-multipurposefurnaces", false)
force_value("bobmods-assembly-oilfurnaces", false)


-- BOBLOGISTICS
change_default("int-setting", "bobmods-logistics-fluidwagonbase", 50)
change_default("int-setting", "bobmods-logistics-storagetankbase", 50)


-- BOBORES
force_value("bobmods-ores-enablewaterores", false)
force_value("bobmods-ores-infiniteore", false)


-- BOBPLATES
force_value("bobmods-plates-convert-recipes", false)
force_value("bobmods-plates-expensive-electrolysis", false)


-- BOBPOWER
force_value("bobmods-power-heatsources", false)
force_value("bobmods-burnerphase", false)


-- BOBTECH
force_value("bobmods-tech-colorupdate", false)


-- BOWWARFARE
force_value("bobmods-warfare-robotupdate", false)

-- SHORTCUTS-ICK
force_value("discharge-defense-remote", false)
force_value("active-defense-equipment", false)

change_default("string-setting", "spidertron-remote", "enabled-hidden")
