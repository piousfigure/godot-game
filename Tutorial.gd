extends Node2D


func _process(delta):
	if global.touch_lit_statue == true:
		$Statue.visible = true
		$StatueLit.visible = false
		
	if global.touch_statue == true:
		$Statue.visible = false
		$StatueLit.visible = true
