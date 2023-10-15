extends Node2D

var laser_scene: PackedScene = preload("res://Enemie/laser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_enemie_ludo_style_player_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	# update laser position
	# move the laser
	# add laser to a special node 2D
	add_child(laser)


func _on_enemie_ludo_style_2_player_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	# update laser position
	# move the laser
	# add laser to a special node 2D
	add_child(laser)
