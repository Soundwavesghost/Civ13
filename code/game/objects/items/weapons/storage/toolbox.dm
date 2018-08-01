/obj/item/weapon/storage/toolbox
	name = "toolbox"
	desc = "Danger. Very robust."
	icon = 'icons/obj/storage.dmi'
	icon_state = "red"
	item_state = "toolbox_red"
	flags = CONDUCT
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = TRUE
	throw_range = 7
	w_class = 4
	max_w_class = 3
	max_storage_space = 14 //enough to hold all starting contents
//	origin_tech = list(TECH_COMBAT = TRUE)
	attack_verb = list("robusted")


/obj/item/weapon/storage/toolbox/mechanical
	name = "mechanical toolbox"
	icon_state = "blue"
	item_state = "toolbox_blue"

	New()
		..()
		new /obj/item/weapon/screwdriver(src)
		new /obj/item/weapon/wrench(src)
		new /obj/item/weapon/crowbar/prybar(src)
	//	new /obj/item/analyzer(src)
		new /obj/item/weapon/wirecutters/boltcutters(src)

/obj/item/weapon/storage/toolbox/electrical
	name = "electrical toolbox"
	icon_state = "yellow"
	item_state = "toolbox_yellow"

	New()
		..()
		var/color = pick("red","yellow","green","blue","pink","orange","cyan","white")
		new /obj/item/weapon/screwdriver(src)
		new /obj/item/weapon/wirecutters/boltcutters(src)
		new /obj/item/weapon/crowbar/prybar(src)
		new /obj/item/stack/cable_coil(src,30,color)
		new /obj/item/stack/cable_coil(src,30,color)
		if (prob(5))
			new /obj/item/clothing/gloves/insulated(src)
		else
			new /obj/item/stack/cable_coil(src,30,color)