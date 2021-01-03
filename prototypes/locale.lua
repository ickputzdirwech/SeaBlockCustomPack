local function change_name(name)
  if data.raw.recipe[name] then
    data.raw.recipe[name].localised_name = {"ick-name."..name}
  end
end

change_name("coolant-used-filtration-1")
change_name("coolant-used-filtration-2")

change_name("gas-carbon-dioxide-from-wood")
change_name("carbon-separation-2")
change_name("carbon-dioxide")

change_name("filter-ceramic-refurbish")

if data.raw.technology["diesel-generator"] then
  data.raw.technology["diesel-generator"].localised_name = {"fluid-name.diesel-fuel"}
end
