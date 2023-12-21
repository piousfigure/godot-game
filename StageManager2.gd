extends CanvasLayer

const HOUSE = preload("res://Scenes/House/House.tscn")
const BASEMENT1 = preload("res://Scenes/Basements/Basement1/Basement1.tscn")
# const BASEMENT2 = preload("res://Scenes/Basements/Basement2/Basement2.tscn")
const TUTORIAL = preload("res://Scenes/Tutorial/Tutorial.tscn")
const END = preload("res://Scenes/End/End.tscn")

func _ready():
	get_node("ColorRect").hide()
	get_node("Label").hide()
	
func changeStage(stage_path, x, y):
	get_node("ColorRect").show()
	get_node("Label").show()
	get_node("anim").play("TransIn")
	await get_node("anim").animation_finished

	var stage = stage_path.instantiate()
	get_tree().get_root().get_child(3).free()
	get_tree().get_root().add_child(stage)
	stage.get_node("Player").position = Vector2(x, y)
	
	get_node("anim").play("TransOut")
	await get_node("anim").animation_finished
	get_node("ColorRect").hide()
