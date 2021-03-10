local function change_name(type, name)
  if data.raw.recipe[name] then
    data.raw.recipe[name].localised_name = {type.."."..name}
  end
end

change_name("recipe-name", "coolant-used-filtration-1")
change_name("recipe-name", "coolant-used-filtration-2")

change_name("recipe-name", "gas-carbon-dioxide-from-wood")
change_name("recipe-name", "carbon-separation-2")

change_name("recipe-name", "filter-ceramic-refurbish")

if data.raw.technology["petroleum-generator"] then
  data.raw.technology["petroleum-generator"].localised_name = {"fluid-name.diesel-fuel"}
end

for _, item in pairs(data.raw.item) do
  if string.sub(item.name, -7) == "-barrel" and item.name ~= "empty-barrel" then
    local fluid = string.sub(item.name, 1, string.len(item.name)-7)
    item.localised_description = {"", {"item-description.filled-barrel"}, " [fluid="..fluid.."] ", {"fluid-name."..fluid}, "."}
  end
end
