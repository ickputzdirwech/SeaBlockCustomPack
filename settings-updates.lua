-- FUNCTIONS
local function force_value(name, new_value)
  if data.raw["bool-setting"][name] then
    data.raw["bool-setting"][name].forced_value = new_value
    data.raw["bool-setting"][name].hidden = true
  end
end

local function change_default(type, name, new_value)
  if data.raw[type][name] then
    data.raw[type][name].default_value = new_value
  end
end

-- ANGELSADDONS-STORAGE
change_default("bool-setting", "angels-enable-oresilos", false)
force_value("angels-enable-pressure-tank", false)

-- ANGELSREFINING
change_default("string-setting", "angels-enable-auto-barreling", "Enabled+Hidden")

-- RESKINS ANGELS
change_default("bool-setting", "reskins-angels-use-item-variations", true)

-- BOBASSEMBLY
force_value("bobmods-assembly-multipurposefurnaces", false)
force_value("bobmods-assembly-oilfurnaces", false)

-- BOBLOGISTICS
change_default("int-setting", "bobmods-logistics-fluidwagonbase", 50)
change_default("int-setting", "bobmods-logistics-storagetankbase", 50)

-- BOBPOWER
change_default("bool-setting", "bobmods-power-accumulators", true)
force_value("bobmods-power-heatsources", false)

-- SHORTCUTS-ICK
force_value("discharge-defense-remote", false)
force_value("active-defense-equipment", false)
