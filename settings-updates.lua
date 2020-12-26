local function change_default(type, name, new_value)
  if data.raw[type][name] then
     data.raw[type][name].default_value = new_value
  end
end

change_default("bool-setting", "angels-enable-auto-barreling", true)
change_default("bool-setting", "bobmods-mining-steamminingdrills", false)
change_default("string-setting", "spidertron-remote", "enabled-hidden")

local function hide_setting(type, name)
  if data.raw[type][name] then
     data.raw[type][name].hidden = true
  end
end

hide_setting("bool-setting", "bobmods-mining-steamminingdrills")
hide_setting("bool-setting", "angels-starting-resource-ore1")
hide_setting("bool-setting", "angels-starting-resource-ore2")
hide_setting("bool-setting", "angels-starting-resource-ore3")
hide_setting("bool-setting", "angels-starting-resource-ore4")
hide_setting("bool-setting", "angels-starting-resource-ore5")
hide_setting("bool-setting", "angels-starting-resource-ore6")
hide_setting("double-setting", "angels-starting-resource-base")
