extends Node2D

# BASEMENT1 ITEM VISIBILITY

func _process(delta):
	if global.found_princess_letter_1 == true:
		$Letter1.visible = false
	if global.found_princess_letter_2 == true:
		$Letter2.visible = false
	if global.found_princess_letter_3 == true:
		$Letter3.visible = false

	if global.found_princess_potion_1 == true:
		$Potion1.visible = false
	if global.found_princess_potion_2 == true:
		$Potion2.visible = false
	if global.found_princess_potion_3 == true:
		$Potion3.visible = false
	if global.found_princess_potion_4 == true:
		$Potion4.visible = false
	if global.found_princess_potion_5 == true:
		$Potion5.visible = false
		
	if global.found_princess_shard_1 == true:
		$Shard1.visible = false
	if global.found_princess_shard_2 == true:
		$Shard2.visible = false
