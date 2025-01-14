//In this document: Rifle calibre cartridges values for damage and penetration.

//////////////////////
// AMMUNITION TYPES //
//////////////////////
/*
FMJ (full metal jacket)		=	Baseline
AP (armor piercing)			=	-20% damage. AP increased by 0.2. Wound bonus -50%
JHP (jacketed hollow point)	=	+15% damage. AP reduced by 0.2 (not below zero). Wound bonus + 50%
SWC (semi wadcutter)		=	AP reduced by 0.1. Wound bonus +50%
P+ (overpressure)			=	extra speed 500. AP +25%
Match						=	extra speed 200. AP +10%. Wound bonus -10%
Civilian round				=	-10% damage for .223. AP reduced by 50%
*/

// Explanation: Two major ammo stats, AP and Damage. Bullets placed in classes. Light rounds for example balanced with each other, one more AP, one more Damage.
// Balance between classes mostly done on the gun end, bigger rounds typically fire slower and have more recoil. They are not supposed to be totally equal either.

////////////////////
// 7.62 MM & .308 //
////////////////////			- heavy rifle round, powerful but high recoil and less rof in the guns that can use it. .308 civilian version for hunting.

/obj/item/projectile/bullet/a762
	name = "7.62 FMJ bullet"
	damage = 38
	armour_penetration = 0.22
	wound_bonus = 20
	bare_wound_bonus = -20

/obj/item/projectile/bullet/a762/ap
	name = "7.62 AP bullet"
	damage = 32
	armour_penetration = 0.4
	wound_bonus = 10
	bare_wound_bonus = -10

/obj/item/projectile/bullet/a762/jhp
	name = "7.62 JHP bullet"
	damage = 46
	armour_penetration = 0.1
	wound_bonus = -30
	bare_wound_bonus = 30

/obj/item/projectile/bullet/a762/match
	name = "7.62 match bullet"
	damage = 40
	armour_penetration = 0.2
	wound_bonus = 20
	bare_wound_bonus = -20
	pixels_per_second = TILES_TO_PIXELS(20)

/obj/item/projectile/bullet/a762/sport //.308 Winchester
	name = ".308 bullet"
	damage = 36
	armour_penetration = 0.1
	wound_bonus = 10
	bare_wound_bonus = -10

/obj/item/projectile/bullet/a762/sport/simple //for simple mobs, separate to allow balancing
	name = ".308 bullet"


////////////////////
// 5.56 MM & .223 //
////////////////////		- Moderate damage, pretty good AP. .223 civilian version for hunting/sport.

/obj/item/projectile/bullet/a556
	name = "5.56 FMJ bullet"
	damage = 33
	armour_penetration = 0.18
	wound_bonus = 18
	bare_wound_bonus = -18

/obj/item/projectile/bullet/a556/ap
	name = "5.56 AP bullet"
	damage = 26
	armour_penetration = 0.32
	wound_bonus = 9
	bare_wound_bonus = -9

/obj/item/projectile/bullet/a556/jhp
	name = "5.56 JHP bullet"
	damage = 39
	armour_penetration = 0
	wound_bonus = -25
	bare_wound_bonus = 25

/obj/item/projectile/bullet/a556/match
	name = "5.56 match bullet"
	damage = 33
	armour_penetration = 0.21
	wound_bonus = 16
	bare_wound_bonus = -16
	pixels_per_second = TILES_TO_PIXELS(20)

/obj/item/projectile/bullet/a556/rubber
	name = "5.56 rubber bullet"
	damage = 5
	stamina = 38

/obj/item/projectile/bullet/a556/sport
	name = ".223 FMJ bullet"
	damage = 30
	armour_penetration = 0.1
	wound_bonus = 18
	bare_wound_bonus = -18

/obj/item/projectile/bullet/a556/simple //for simple mobs, separate to allow balancing
	name = "5.56 bullet"

/obj/item/projectile/bullet/a556/ap/simple //for simple mobs, separate to allow balancing
	name = "5.56 bullet"


/////////
// .50 //
/////////			-Very heavy rifle round.

/obj/item/projectile/bullet/a50MG
	damage = 53
	armour_penetration = 0.8
	pixels_per_second = TILES_TO_PIXELS(33.33)

/obj/item/projectile/bullet/a50MG/incendiary
	damage = 40
	armour_penetration = 0.5
	var/fire_stacks = 4

/obj/item/projectile/bullet/a50MG/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/obj/item/projectile/bullet/a50MG/explosive
	damage = 30
	armour_penetration = 0.6

/obj/item/projectile/bullet/a50MG/explosive/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, 0, 1, 1, 1)

//////////////////////
// 4.73 MM CASELESS //
//////////////////////				-Small rifle bullet

/obj/item/projectile/bullet/a473
	name = "4.73 FMJ bullet"
	damage = 38
	armour_penetration = 0.2
	wound_bonus = 20
	bare_wound_bonus = -20


//////////////////////////
// 5 MM minigun special //
//////////////////////////			-Small round, big AP, low payload.

/obj/item/projectile/bullet/c5mm
	damage = 20
	armour_penetration = 0.5
	wound_bonus = -5
	bare_wound_bonus = 5


/////////////////////////
//2 MM ELECTROMAGNETIC //
/////////////////////////			- Gauss rifle

/obj/item/projectile/bullet/c2mm
	damage = 55
	armour_penetration = 0.85
	pixels_per_second = TILES_TO_PIXELS(100)
