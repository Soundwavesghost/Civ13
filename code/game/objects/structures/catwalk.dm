/obj/structure/catwalk
	layer = TURF_LAYER + 0.5
	icon = 'icons/turf/catwalks.dmi'
	icon_state = "catwalk"
	name = "catwalk"
	desc = "Cats really don't like these things."
	density = FALSE
	anchored = 1.0

	New()
		..()
//		set_light(l_range = 1.4, l_power = 0.4, l_color = COLOR_ORANGE)
		spawn(4)
			if (src)
				for (var/obj/structure/catwalk/C in get_turf(src))
					if (C != src)
						qdel(C)
				update_icon()
				for (var/dir in list(1,2,4,8,5,6,9,10))
					if (locate(/obj/structure/catwalk, get_step(src, dir)))
						var/obj/structure/catwalk/L = locate(/obj/structure/catwalk, get_step(src, dir))
						L.update_icon() //so siding get updated properly
	proc
		is_catwalk()
			return TRUE




/obj/structure/catwalk/update_icon()
	var/connectdir = FALSE
	for (var/direction in cardinal)
		if (locate(/obj/structure/catwalk, get_step(src, direction)))
			connectdir |= direction
	//if (locate(/obj/structure/catwalk) in get_step(src, dir))
    //istype(get_step(src,direction),/turf/simulated/floor)
	//istype((locate(/obj/structure/catwalk) in get_step(src, dir)), /obj/structure/catwalk)

	//Check the diagonal connections for corners, where you have, for example, connections both north and east. In this case it checks for a north-east connection to determine whether to add a corner marker or not.
	var/diagonalconnect = FALSE //1 = NE; 2 = SE; 4 = NW; 8 = SW
	//NORTHEAST
	if (connectdir & NORTH && connectdir & EAST)
		if (locate(/obj/structure/catwalk, get_step(src, NORTHEAST)))
			diagonalconnect |= TRUE
	//SOUTHEAST
	if (connectdir & SOUTH && connectdir & EAST)
		if (locate(/obj/structure/catwalk, get_step(src, SOUTHEAST)))
			diagonalconnect |= 2
	//NORTHWEST
	if (connectdir & NORTH && connectdir & WEST)
		if (locate(/obj/structure/catwalk, get_step(src, NORTHWEST)))
			diagonalconnect |= 4
	//SOUTHWEST
	if (connectdir & SOUTH && connectdir & WEST)
		if (locate(/obj/structure/catwalk, get_step(src, SOUTHWEST)))
			diagonalconnect |= 8

	icon_state = "catwalk[connectdir]-[diagonalconnect]"


/obj/structure/catwalk/ex_act(severity)
	switch(severity)
		if (1.0)
			qdel(src)
			return
		if (2.0)
			qdel(src)
			return
		if (3.0)
			return
		else
	return
