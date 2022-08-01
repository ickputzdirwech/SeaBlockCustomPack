-- FIX BIO SCIENCE PACK ORDER
if data.raw.lab["sct-lab-t4"] and data.raw.lab["sct-lab-t4"].inputs then
	local inputs = data.raw.lab["sct-lab-t4"].inputs
	for i, item in pairs(inputs) do
		if item == "sct-bio-science-pack" then
			table.remove(inputs, i)
		end
	end
	table.insert(inputs, "sct-bio-science-pack")
end

-- ORDER_IN_RECIPE
local function order_in_recipe(name, new_order)
	if data.raw["item-group"][name] then
		data.raw["item-group"][name].order_in_recipe = new_order
	end
end

order_in_recipe("intermediate-products", "A[intermediate]-1")
order_in_recipe("bob-gems", "A[intermediate]-2")

order_in_recipe("angels-fluid-control", "B[mixed]-1")
order_in_recipe("angels-casting", "B[mixed]-2")
order_in_recipe("angels-smelting", "B[mixed]-3")
order_in_recipe("petrochem-refining", "B[mixed]-4")
order_in_recipe("resource-refining", "B[mixed]-5")
order_in_recipe("bio-processing-alien", "B[mixed]-6")
order_in_recipe("bio-processing-vegetables", "B[mixed]-7")
order_in_recipe("bio-processing-nauvis", "B[mixed]-8")
order_in_recipe("water-treatment", "B[mixed]-9")

order_in_recipe("sct-science", "C[endproduct]-1")
order_in_recipe("bobmodules", "C[endproduct]-2")
order_in_recipe("combat", "C[endproduct]-3")

order_in_recipe("logistics", "D[machines]-1")
order_in_recipe("bob-logistics", "D[machines]-2")
order_in_recipe("production", "D[machines]-3")


-- FUNCTIONS
local function change_order(type, name, new_order)
	if data.raw[type][name] then
		data.raw[type][name].order = new_order
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

-- ITEM-GROUPS
change_order("item-group", "angels-fluid-control", "aaa-b")
change_order("item-group", "environment", "y")
change_order("item-group", "signals", "z")

-- LOGISTICS
change_subgroup("item", "small-electric-pole", "storage")
change_subgroup("item", "steel-chest", "logistic-network")
change_subgroup("item", "brass-chest", "logistic-chests-2")
change_subgroup("item", "titanium-chest", "logistic-chests-3")

change_order("item-subgroup", "angels-silo", "g-4")
change_order("item-subgroup", "angels-warehouse", "g-5")

data:extend(
{
	{
		type = "item-subgroup",
		name = "power-poles-2",
		group = "logistics",
		order = "d-2"
	},
	{
		type = "item-subgroup",
		name = "power-poles-3",
		group = "logistics",
		order = "d-3"
	},
	{
		type = "item-subgroup",
		name = "artillery",
		group = "combat",
		order = "i"
	}
})

change_subgroup("item", "big-electric-pole", "power-poles-2")
change_subgroup("item", "big-electric-pole-2", "power-poles-2")
change_subgroup("item", "big-electric-pole-3", "power-poles-2")
change_subgroup("item", "big-electric-pole-4", "power-poles-2")

change_subgroup("item", "substation", "power-poles-3")
change_subgroup("item", "substation-2", "power-poles-3")
change_subgroup("item", "substation-3", "power-poles-3")
change_subgroup("item", "substation-4", "power-poles-3")

change_subgroup("item-with-entity-data", "cargo-wagon", "bob-locomotive")
change_subgroup("item-with-entity-data", "bob-cargo-wagon-2", "bob-locomotive")
change_subgroup("item-with-entity-data", "bob-cargo-wagon-3", "bob-locomotive")
change_subgroup("item-with-entity-data", "fluid-wagon", "bob-locomotive")
change_subgroup("item-with-entity-data", "bob-fluid-wagon-2", "bob-locomotive")
change_subgroup("item-with-entity-data", "bob-fluid-wagon-3", "bob-locomotive")

change_order("item", "silo-buffer", "a[silo]-i[buffer]")
change_order("item", "silo-storage", "a[silo]-n[storage]")
change_order("item", "angels-warehouse-buffer", "a[warehouse]-i[buffer]")
change_order("item", "angels-warehouse-storage", "a[warehouse]-n[storage]")
change_order("recipe", "angels-warehouse-buffer", "b2")
change_order("recipe", "angels-warehouse-storage", "g")

change_subgroup_group("transport", "combat")

change_subgroup("item-with-entity-data", "artillery-wagon", "artillery")
change_subgroup("item-with-entity-data", "bob-artillery-wagon-2", "artillery")

change_order("item-subgroup", "tool", "h")

-- BOB-LOGISTICS and ANGELS-FLUID-CONTROL
change_subgroup_group("pipe", "angels-fluid-control")
change_subgroup_group("pipe-to-ground", "angels-fluid-control")

-- ANGELS-FLUID-CONTROL
change_order("item-subgroup", "pipe", "a-a")
change_order("item-subgroup", "pipe-to-ground", "a-b")

data:extend(
{
	{
		type = "item-subgroup",
		name = "pipe-2",
		group = "angels-fluid-control",
		order = "a-c"
	},
	{
		type = "item-subgroup",
		name = "pipe-to-ground-2",
		group = "angels-fluid-control",
		order = "a-d"
	},
	{
		type = "item-subgroup",
		name = "barreling",
		group = "angels-fluid-control",
		order = "c"
	}
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

change_subgroup("item", "barreling-pump", "barreling")
change_subgroup("item", "empty-barrel", "barreling")
change_subgroup("recipe", "empty-barrel", "barreling")
change_subgroup("item", "empty-canister", "barreling")
change_subgroup("recipe", "empty-canister", "barreling")
change_subgroup("item", "gas-canister", "barreling")
change_subgroup("recipe", "gas-canister", "barreling")

-- PRODUCTION
change_subgroup_group("tool", "logistics")

data:extend({{
	type = "item-subgroup",
	name = "wind-power",
	group = "production",
	order = "a"
}})

change_subgroup("item", "wind-turbine-2", "wind-power")

-- MODULES
data:extend({{
	type = "item-subgroup",
	name = "module-intermediates-2",
	group = "bobmodules",
	order = "f-0"
}})

change_subgroup("tool", "speed-processor", "module-intermediates-2")
change_subgroup("item", "speed-processor-2", "module-intermediates-2")
change_subgroup("item", "speed-processor-3", "module-intermediates-2")
change_subgroup("tool", "effectivity-processor", "module-intermediates-2")
change_subgroup("item", "effectivity-processor-2", "module-intermediates-2")
change_subgroup("item", "effectivity-processor-3", "module-intermediates-2")
change_subgroup("tool", "productivity-processor", "module-intermediates-2")
change_subgroup("item", "productivity-processor-2", "module-intermediates-2")
change_subgroup("item", "productivity-processor-3", "module-intermediates-2")

-- INTERMEDIATE-PRODUCTS
change_subgroup_group("bob-intermediates", "intermediate-products")
change_subgroup_group("bob-electronic-components", "intermediate-products")
change_subgroup_group("bob-boards", "intermediate-products")
change_subgroup_group("bob-electronic-boards", "intermediate-products")
change_subgroup_group("sb-circuit-board", "intermediate-products")
change_subgroup_group("bob-gears", "intermediate-products")
change_subgroup_group("bob-bearings", "intermediate-products")
change_subgroup_group("bob-roboport-parts-antenna", "intermediate-products")
change_subgroup_group("bob-roboport-parts-door", "intermediate-products")
change_subgroup_group("bob-roboport-parts-charge", "intermediate-products")
change_subgroup_group("bob-robot-parts", "intermediate-products")

change_order("recipe", "angels-glass-fiber-board", "c-a3[glass-fiber-board]")

change_subgroup("item", "circuit-board", "bob-boards")
change_subgroup("item", "superior-circuit-board", "bob-boards")
change_subgroup("item", "multi-layer-circuit-board", "bob-boards")

change_subgroup("item", "electronic-circuit", "bob-electronic-boards")
change_subgroup("item", "advanced-circuit", "bob-electronic-boards")
change_subgroup("item", "processing-unit", "bob-electronic-boards")
change_subgroup("item", "advanced-processing-unit", "bob-electronic-boards")

change_order("item-subgroup", "intermediate-product", "e-c2")

data:extend(
{
	{
		type = "item-subgroup",
		name = "fuel-cells",
		group = "intermediate-products",
		order = "h"
	},
	{
		type = "item-subgroup",
		name = "radioactive-materials",
		group = "intermediate-products",
		order = "i"
	},
	{
		type = "item-subgroup",
		name = "bob-robot-parts-2",
		group = "intermediate-products",
		order = "e-e2"
	},
	{
		type = "item-subgroup",
		name = "bob-robot-parts-3",
		group = "intermediate-products",
		order = "e-e3"
	}
})

change_subgroup("item", "robot-brain-construction", "bob-robot-parts-2")
change_subgroup("item", "robot-brain-construction-2", "bob-robot-parts-2")
change_subgroup("item", "robot-brain-construction-3", "bob-robot-parts-2")
change_subgroup("item", "robot-brain-construction-4", "bob-robot-parts-2")
change_subgroup("item", "robot-brain-logistic", "bob-robot-parts-2")
change_subgroup("item", "robot-brain-logistic-2", "bob-robot-parts-2")
change_subgroup("item", "robot-brain-logistic-3", "bob-robot-parts-2")
change_subgroup("item", "robot-brain-logistic-4", "bob-robot-parts-2")
change_subgroup("item", "robot-tool-construction", "bob-robot-parts-3")
change_subgroup("item", "robot-tool-construction-2", "bob-robot-parts-3")
change_subgroup("item", "robot-tool-construction-3", "bob-robot-parts-3")
change_subgroup("item", "robot-tool-construction-4", "bob-robot-parts-3")
change_subgroup("item", "robot-tool-logistic", "bob-robot-parts-3")
change_subgroup("item", "robot-tool-logistic-2", "bob-robot-parts-3")
change_subgroup("item", "robot-tool-logistic-3", "bob-robot-parts-3")
change_subgroup("item", "robot-tool-logistic-4", "bob-robot-parts-3")

change_subgroup("item", "empty-nuclear-fuel-cell", "fuel-cells")
change_subgroup("item", "uranium-fuel-cell", "fuel-cells")
change_subgroup("item", "plutonium-fuel-cell", "fuel-cells")
change_subgroup("item", "used-up-uranium-fuel-cell", "fuel-cells")
change_subgroup("item", "thorium-fuel-cell", "fuel-cells")
change_subgroup("item", "thorium-plutonium-fuel-cell", "fuel-cells")
change_subgroup("item", "used-up-thorium-fuel-cell", "fuel-cells")
change_subgroup("item", "deuterium-fuel-cell", "fuel-cells")
change_subgroup("item", "deuterium-fuel-cell-2", "fuel-cells")
change_subgroup("item", "used-up-deuterium-fuel-cell", "fuel-cells")

change_order("item", "plutonium-fuel-cell", "r[uranium-processing]-b[plutonium-fuel-cell]")

change_subgroup("item", "uranium-238", "radioactive-materials")
change_subgroup("item", "uranium-235", "radioactive-materials")
change_subgroup("item", "thorium-232", "radioactive-materials")
change_subgroup("item", "plutonium-239", "radioactive-materials")
change_subgroup("item", "fusion-catalyst", "radioactive-materials")

change_order("item", "uranium-238", "j[uranium-238]")
change_order("item", "uranium-235", "k[uranium-235]")
change_order("item", "thorium-232", "l[thorium-232]")
change_order("item", "plutonium-239", "m[plutonium-239]")
change_order("item", "fusion-catalyst", "n[fusion-catalyst]")

change_subgroup("recipe", "uranium-processing", "radioactive-materials")
change_subgroup("recipe", "thorium-processing", "radioactive-materials")
change_subgroup("recipe", "nuclear-fuel-reprocessing", "radioactive-materials")
change_subgroup("recipe", "kovarex-enrichment-process", "radioactive-materials")
change_subgroup("recipe", "bobingabout-enrichment-process", "radioactive-materials")
change_subgroup("recipe", "plutonium-nucleosynthesis", "radioactive-materials")
change_subgroup("recipe", "thorium-fuel-reprocessing", "radioactive-materials")
change_subgroup("recipe", "deuterium-fuel-reprocessing", "radioactive-materials")

change_order("recipe", "nuclear-fuel-reprocessing", "s[plutonium-processing]-e[nuclear-fuel-reprocessing]")

change_subgroup("item", "satelite", "sct-sciencepack-space")
change_order("item", "satelite", "z[space]-a2")


-- COMBAT
data:extend(
{
	{
		type = "item-subgroup",
		name = "battery-equipment",
		group = "combat",
		order = "e[equipment]-b[battery]"
	},
	{
		type = "item-subgroup",
		name = "equipment-2",
		group = "combat",
		order = "e[equipment]-c[equipment-2]"
	},
	{
		type = "item-subgroup",
		name = "robot-equipment-1",
		group = "combat",
		order = "e[equipment]-d[robot-1]"
	},
	{
		type = "item-subgroup",
		name = "robot-equipment-2",
		group = "combat",
		order = "e[equipment]-e[robot-2]"
	},
	{
		type = "item-subgroup",
		name = "radars",
		group = "combat",
		order = "j"
	}
})

change_order("ammo", "artillery-shell", "e[artillery-shell]-a")

change_subgroup("item", "battery-equipment", "battery-equipment")
change_subgroup("item", "battery-mk2-equipment", "battery-equipment")
change_subgroup("item", "battery-mk3-equipment", "battery-equipment")
change_subgroup("item", "battery-mk4-equipment", "battery-equipment")
change_subgroup("item", "battery-mk5-equipment", "battery-equipment")
change_subgroup("item", "battery-mk6-equipment", "battery-equipment")

change_subgroup("item", "belt-immunity-equipment", "equipment-2")
change_subgroup("item", "exoskeleton-equipment", "equipment-2")
change_subgroup("item", "exoskeleton-equipment-2", "equipment-2")
change_subgroup("item", "exoskeleton-equipment-3", "equipment-2")
change_subgroup("item", "night-vision-equipment", "equipment-2")
change_subgroup("item", "night-vision-equipment-2", "equipment-2")
change_subgroup("item", "night-vision-equipment-3", "equipment-2")

change_subgroup("item", "personal-roboport-antenna-equipment", "robot-equipment-1")
change_subgroup("item", "personal-roboport-antenna-equipment-2", "robot-equipment-1")
change_subgroup("item", "personal-roboport-antenna-equipment-3", "robot-equipment-1")
change_subgroup("item", "personal-roboport-antenna-equipment-4", "robot-equipment-1")
change_subgroup("item", "personal-roboport-chargepad-equipment", "robot-equipment-1")
change_subgroup("item", "personal-roboport-chargepad-equipment-2", "robot-equipment-1")
change_subgroup("item", "personal-roboport-chargepad-equipment-3", "robot-equipment-1")
change_subgroup("item", "personal-roboport-chargepad-equipment-4", "robot-equipment-1")

change_subgroup("item", "personal-roboport-robot-equipment", "robot-equipment-2")
change_subgroup("item", "personal-roboport-robot-equipment-2", "robot-equipment-2")
change_subgroup("item", "personal-roboport-robot-equipment-3", "robot-equipment-2")
change_subgroup("item", "personal-roboport-robot-equipment-4", "robot-equipment-2")
change_subgroup("item", "personal-roboport-equipment", "robot-equipment-2")
change_subgroup("item", "personal-roboport-mk2-equipment", "robot-equipment-2")
change_subgroup("item", "personal-roboport-mk3-equipment", "robot-equipment-2")
change_subgroup("item", "personal-roboport-mk4-equipment", "robot-equipment-2")

change_order("item-with-entity-data", "spidertron", "b[personal-transport]-c[spidertron]-d[spidertron]")
change_order("spidertron-remote", "spidertron-remote", "c[spidertron-remote]")

change_order("item", "bob-sniper-turret-1", "b[turret]-a[sniper-turret-1]")
change_order("item", "bob-sniper-turret-2", "b[turret]-a[sniper-turret-2]")

change_subgroup("item", "artillery-turret", "artillery")
change_subgroup("item", "bob-artillery-turret-2", "artillery")
change_subgroup("capsule", "artillery-targeting-remote", "artillery")

change_order("item", "artillery-turret", "a[artillery-turret]-1")
change_order("item", "bob-artillery-turret-2", "a[artillery-turret]-2")

change_subgroup("item", "radar", "radars")
change_subgroup("item", "radar-2", "radars")
change_subgroup("item", "radar-3", "radars")
change_subgroup("item", "radar-4", "radars")
change_subgroup("item", "radar-5", "radars")

change_subgroup("item", "rocket-engine", "sct-sciencepack-space")
change_order("item", "rocket-engine", "z[space]-c[rocket-engine]")

-- RESOURCE-REFINING
change_order("item-subgroup", "angels-ores", "b[angels-ore]")
change_order("item-subgroup", "processing-crafting", "d[catalysts]")

change_subgroup("item", "uranium-ore", "radioactive-materials")
change_subgroup("item", "thorium-ore", "radioactive-materials")

data:extend({{
	type = "item-subgroup",
	name = "thermal",
	group = "water-treatment",
	order = "z[building]-d"
}})

change_subgroup("item", "thermal-bore", "thermal")
change_subgroup("item", "thermal-extractor", "thermal")

-- ANGELS-SMELTING
change_subgroup("item", "angels-plate-hot-iron", "angels-steel-casting")

-- ANGELS-CASTING
change_subgroup("recipe", "angels-glass-fiber-board", "bob-boards")

change_order("recipe", "angels-glass-fiber-board", "c-b2[glass-fiber-board")
change_order("item", "fibreglass-bord", "c-b2[glass-fiber-board")

-- WATER-TREATMENT
change_order("recipe", "solid-salt-from-saline", "d[solid-salt-from-saline]")

change_order("item", "mud", "a[mud]-a")
change_order("item", "solid-clay", "a[mud]-b")
change_order("item", "solid-limestone", "a[mud]-c")
change_order("item", "solid-sand", "a[mud]-d")
change_order("item", "solid-salt", "b[salt]-a")
change_order("item", "solid-lithium", "b[salt]-b")

change_subgroup("recipe", "coolant-cool-steam", "water-boiling")
change_order("recipe", "coolant-cool-steam", "b")

change_order("item", "offshore-pump", "a")

-- PETROCHEM-REFINING
change_order("recipe", "sb-wood-bricks-charcoal", "c[charcoal]")
change_order("item", "wood-charcoal", "c[charcoal]")

data:extend({{
	type = "item-subgroup",
	name = "petrochem-rocket-fuel",
	group = "petrochem-refining",
	order = "ab"
}})

change_subgroup("recipe", "rocket-oxidizer-capsule", "petrochem-rocket-fuel")
change_subgroup("recipe", "rocket-fuel-capsule", "petrochem-rocket-fuel")
change_subgroup("recipe", "rocket-fuel", "petrochem-rocket-fuel")
change_subgroup("recipe", "rocket-booster-1", "petrochem-rocket-fuel")
change_subgroup("recipe", "rocket-booster-2", "petrochem-rocket-fuel")
change_subgroup("recipe", "nuclear-fuel", "petrochem-rocket-fuel")
