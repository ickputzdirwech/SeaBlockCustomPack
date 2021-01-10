-- CHANGE DEFAULT
local function change_default(type, name, new_value)
  if data.raw[type][name] then
     data.raw[type][name].default_value = new_value
  end
end

-- ANGELSADDONS-STORAGE
change_default("bool-setting", "angels-enable-pressure-tank", false)

-- ANGELSREFINING
change_default("bool-setting", "angels-enable-auto-barreling", true)

-- BARAWS
change_default("bool-setting", "baraws-all-made-in", true)
change_default("bool-setting", "baraws-all-products", true)

-- BOBASSEMBLY
change_default("bool-setting", "bobmods-assembly-oilfurnaces", false)
change_default("bool-setting", "bobmods-assembly-multipurposefurnaces", false)

-- BOBLOGISTICS
change_default("int-setting", "bobmods-logistics-fluidwagonbase", 50)
change_default("int-setting", "bobmods-logistics-storagetankbase", 50)

-- BOBPLATES
change_default("bool-setting", "bobmods-plates-convert-recipes", false)

-- BOBPOWER
change_default("bool-setting", "bobmods-power-heatsources", false)

-- SHORTCUTS-ICK
change_default("bool-setting", "discharge-defense-remote", false)
change_default("bool-setting", "active-defense-equipment", false)
change_default("string-setting", "spidertron-remote", "enabled-hidden")


-- HIDE SETTINGS
local function hide_setting(type, name)
  if data.raw[type][name] then
     data.raw[type][name].hidden = true
  end
end

-- ANGELSADDONS-STORAGE
hide_setting("bool-setting", "angels-enable-pressure-tank")

-- ANGELSREFINING
hide_setting("bool-setting", "angels-starting-resource-ore1")
hide_setting("bool-setting", "angels-starting-resource-ore2")
hide_setting("bool-setting", "angels-starting-resource-ore3")
hide_setting("bool-setting", "angels-starting-resource-ore4")
hide_setting("bool-setting", "angels-starting-resource-ore5")
hide_setting("bool-setting", "angels-starting-resource-ore6")
hide_setting("double-setting", "angels-starting-resource-base")

-- BOBASSEMBLY
hide_setting("bool-setting", "bobmods-assembly-multipurposefurnaces")

-- BOBORES
hide_setting("bool-setting", "bobmods-ores-enablewaterores")
hide_setting("bool-setting", "bobmods-ores-infiniteore")

-- BOBPLATES
hide_setting("bool-setting", "bobmods-plates-convert-recipes")
hide_setting("bool-setting", "bobmods-plates-expensive-electrolysis")

-- BOBPOWER
hide_setting("bool-setting", "bobmods-power-heatsources")

-- BOBTECH
hide_setting("bool-setting", "bobmods-tech-colorupdate")
hide_setting("bool-setting", "bobmods-burnerphase")

-- SHORTCUTS-ICK
hide_setting("bool-setting", "active-defense-equipment")
hide_setting("bool-setting", "discharge-defense-remote")
