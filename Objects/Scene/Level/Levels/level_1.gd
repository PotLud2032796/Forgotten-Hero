extends Node2D

signal player_died

var laser_scene: PackedScene = preload("res://Enemie/laser.tscn")

func _on_player_touched():
	print("DEAD")

func _on_enemie_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	add_child(laser)

func _on_level_finished(_body):
	print("lvl")
	get_tree().change_scene_to_file("res://Objects/Scene/Level/Levels/level_2.tscn")
