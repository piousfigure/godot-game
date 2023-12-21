extends CharacterBody2D

@export var speed: int = 100
@onready var animations = $AnimationPlayer
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

var in_lit_statue_detection = false
var in_statue_detection = false

var in_letter_1_detection = false
var in_letter_2_detection = false
var in_letter_3_detection = false

var in_potion_1_detection = false
var in_potion_2_detection = false
var in_potion_3_detection = false
var in_potion_4_detection = false
var in_potion_5_detection = false

var in_shard_1_detection = false
var in_shard_2_detection = false



func handleInput():
	# actionable
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
	
	
	# movement
	var moveDirection = Input.get_vector("left", "right", "up", "down")
	velocity = moveDirection * speed

func updateAnimation():
	if velocity. length() == 0:
		animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
		animations.play("walk" + direction)

# func _physics_process(delta):
func _physics_process(_delta):
	handleInput()
	move_and_slide()
	updateAnimation()
	
	if in_lit_statue_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.touch_lit_statue = true
	if in_statue_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.touch_statue = true
	
	
	
	# letters
	if in_letter_1_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.found_princess_letter_1 = true
	if in_letter_2_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.found_princess_letter_2 = true
	if in_letter_3_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.found_princess_letter_3 = true
	if (global.found_princess_letter_1 == true) and (global.found_princess_letter_2 == true) and (global.found_princess_letter_3 == true):
		global.found_all_princess_letters = true
	
	# potions
	if in_potion_1_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.found_princess_potion_1 = true
	if in_potion_2_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.found_princess_potion_2 = true
	if in_potion_3_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.found_princess_potion_3 = true
	if in_potion_4_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.found_princess_potion_4 = true
	if in_potion_5_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.found_princess_potion_5 = true
	if (global.found_princess_potion_1 == true) and (global.found_princess_potion_2 == true) and (global.found_princess_potion_3 == true) and (global.found_princess_potion_4 == true) and (global.found_princess_potion_5 == true):
		global.found_all_princess_potions = true
	
	# shards 
	if in_shard_1_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.found_princess_shard_1 = true
	if in_shard_2_detection == true:
		if Input.is_action_just_pressed("ui_accept"):
			global.found_princess_shard_2 = true
	if (global.found_princess_shard_1 == true) and (global.found_princess_shard_2 == true):
		global.found_all_princess_shards = true
	
	
	




func player():
	pass


# lit statue
func _on_lit_detection_body_entered(body):
	if body.has_method("player"):
		in_lit_statue_detection = true
func _on_lit_detection_body_exited(body):
	if body.has_method("player"):
		in_lit_statue_detection = false

# statue
func _on_statue_detection_body_entered(body):
	if body.has_method("player"):
		in_statue_detection = true
func _on_statue_detection_body_exited(body):
	if body.has_method("player"):
		in_statue_detection = false



# letter 1
func _on_letter_detection_1_body_entered(body):
	if body.has_method("player"):
		in_letter_1_detection = true
func _on_letter_detection_1_body_exited(body):
	if body.has_method("player"):
		in_letter_1_detection = false

# letter 2
func _on_letter_detection_2_body_entered(body):
	if body.has_method("player"):
		in_letter_2_detection = true
func _on_letter_detection_2_body_exited(body):
	if body.has_method("player"):
		in_letter_2_detection = false

# letter 3
func _on_letter_detection_3_body_entered(body):
	if body.has_method("player"):
		in_letter_3_detection = true
func _on_letter_detection_3_body_exited(body):
	if body.has_method("player"):
		in_letter_3_detection = false

# potion 1
func _on_potion_detection_1_body_entered(body):
	if body.has_method("player"):
		in_potion_1_detection = true
func _on_potion_detection_1_body_exited(body):
	if body.has_method("player"):
		in_potion_1_detection = false

# potion 2
func _on_potion_detection_2_body_entered(body):
	if body.has_method("player"):
		in_potion_2_detection = true
func _on_potion_detection_2_body_exited(body):
	if body.has_method("player"):
		in_potion_2_detection = false

# potion 3
func _on_potion_detection_3_body_entered(body):
	if body.has_method("player"):
		in_potion_3_detection = true
func _on_potion_detection_3_body_exited(body):
	if body.has_method("player"):
		in_potion_3_detection = false

# potion 4
func _on_potion_detection_4_body_entered(body):
	if body.has_method("player"):
		in_potion_4_detection = true
func _on_potion_detection_4_body_exited(body):
	if body.has_method("player"):
		in_potion_4_detection = false

# potion 5
func _on_potion_detection_5_body_entered(body):
	if body.has_method("player"):
		in_potion_5_detection = true
func _on_potion_detection_5_body_exited(body):
	if body.has_method("player"):
		in_potion_5_detection = false



# shard 1
func _on_shard_detection_1_body_entered(body):
	if body.has_method("player"):
		in_shard_1_detection = true
func _on_shard_detection_1_body_exited(body):
	if body.has_method("player"):
		in_shard_1_detection = false


# shard 2
func _on_shard_detection_2_body_entered(body):
	if body.has_method("player"):
		in_shard_2_detection = true
func _on_shard_detection_2_body_exited(body):
	if body.has_method("player"):
		in_shard_2_detection = false
