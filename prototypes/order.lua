local function change_order(type, item_name, new_order)
  if data.raw[type][item_name] then
    data.raw[type][item_name].order = new_order
  end
end

local function change_subgroup(type, item_name, new_subgroup)
  if data.raw[type][item_name] then
    data.raw[type][item_name].subgroup = new_subgroup
  end
end

local function change_subgroup_group(subgroup_name, new_group)
  if data.raw["item-subgroup"][subgroup_name] then
    data.raw["item-subgroup"][subgroup_name].group = new_group
  end
end

-- LOGISTICS
change_subgroup("item", "small-electric-pole", "storage")
change_subgroup("item", "steel-chest", "logistic-network")
change_subgroup("item", "brass-chest", "logistic-chests-2")
change_subgroup("item", "titanium-chest", "logistic-chests-3")

change_order("item-subgroup", "logistic-chests-2", "g-2")
change_order("item-subgroup", "logistic-chests-3", "g-3")
change_order("item-subgroup", "angels-silo", "g-4")
change_order("item-subgroup", "angels-warehouse", "g-5")

data:extend(
{
	{
		type = "item-subgroup",
		name = "power-poles-2",
		group = "logistics",
		order = "d-2",
	},
	{
		type = "item-subgroup",
		name = "power-poles-3",
		group = "logistics",
		order = "d-3",
	},
	{
		type = "item-subgroup",
		name = "artillery",
		group = "combat",
		order = "h",
	},
})

change_subgroup("item", {"big-electric-pole", "power-poles-2")
change_subgroup("item", "big-electric-pole-2", "power-poles-2")
change_subgroup("item", "big-electric-pole-3", "power-poles-2")
change_subgroup("item", "big-electric-pole-4", "power-poles-2")

change_subgroup("item", "substation", "power-poles-3")
change_subgroup("item", "substation-2", "power-poles-3")
change_subgroup("item", "substation-3", "power-poles-3")
change_subgroup("item", "substation-4", "power-poles-3")

change_subgroup("item", "artillery-turret", "artillery")
change_subgroup("item", "bob-artillery-turret-2", "artillery")
change_subgroup("item", "bob-artillery-turret-3", "artillery")

change_subgroup_group("transport", "combat")

-- BOB-LOGISTICS
data:extend(
{
	{
		type = "item-subgroup",
		name = "pipe-2",
		group = "bob-logistics",
		order = "d-a-3",
	},
	{
		type = "item-subgroup",
		name = "pipe-to-ground-2",
		group = "bob-logistics",
		order = "d-a-4",
	},
})

change_subgroup("item", "titanium-pipe", "pipe-2")
change_subgroup("item", "ceramic-pipe", "pipe-2")
change_subgroup("item", "tungsten-pipe", "pipe-2")
change_subgroup("item", "nitinol-pipe", "pipe-2")
change_subgroup("item", "copper-tungsten-pipe", "pipe-2")

change_subgroup("item", "titanium-pipe-to-ground", "pipe-to-ground-2")
change_subgroup("item", "ceramic-pipe-to-ground", "pipe-to-ground-2")
change_subgroup("item", "tungsten-pipe-to-ground", "pipe-to-ground-2")
change_subgroup("item", "nitinol-pipe-to-ground", "pipe-to-ground-2")
change_subgroup("item", "copper-tungsten-pipe-to-ground", "pipe-to-ground-2")

-- PRODUCTION
change_subgroup_group("tool", "logistics")
change_order("item-subgroup", "tool", "i")

data:extend(
{
	{
		type = "item-subgroup",
		name = "nuclear-power",
		group = "production",
		order = "b-a",
	},
	{
		type = "item-subgroup",
		name = "bob-smelting-machine-2",
		group = "production",
		order = "d-a",
	},
})

change_subgroup("item", "centrifuge", "nuclear-power")
change_subgroup("item", "centrifuge-2", "nuclear-power")
change_subgroup("item", "centrifuge-3", "nuclear-power")
change_subgroup("item", "nuclear-reactor", "nuclear-power")
change_subgroup("item", "nuclear-reactor-2", "nuclear-power")
change_subgroup("item", "nuclear-reactor-3", "nuclear-power")
change_subgroup("item", "heat-pipe", "nuclear-power")
change_subgroup("item", "heat-pipe-2", "nuclear-power")
change_subgroup("item", "heat-pipe-3", "nuclear-power")

change_order("item", "centrifuge-2", "f[nuclear-energy]-a[centrifuge]")
change_order("item", "centrifuge-3", "f[nuclear-energy]-a[centrifuge]")

change_subgroup("item", "stone-mixing-furnace", "bob-smelting-machine-2")
change_subgroup("item", "steel-mixing-furnace", "bob-smelting-machine-2")
change_subgroup("item", "fluid-mixing-furnace", "bob-smelting-machine-2")
change_subgroup("item", "electric-mixing-furnace", "bob-smelting-machine-2")

-- COMBAT
change_subgroup("item-with-entity-data", "artillery-wagon", "artillery")
change_subgroup("item-with-entity-data", "bob-artillery-wagon-2", "artillery")
change_subgroup("item-with-entity-data", "bob-artillery-wagon-3", "artillery")

change_subgroup("capsule", "artillery-targeting-remote", "artillery")
