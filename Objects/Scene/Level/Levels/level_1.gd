extends Node2D

signal level_finished
signal player_died

var laser_scene: PackedScene = preload("res://Enemie/laser.tscn")

func _on_finish_door_body_entered(body:Node2D):
	if body.name == 'PlayerMouse':
		print('mouse_reach_obj')
		level_finished.emit()



func _on_player_touched():
	print("DEAD")

func _on_enemie_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Elements/Bullets.add_child(laser)
