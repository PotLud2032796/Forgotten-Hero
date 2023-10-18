extends Node2D

signal player_died

var laser_scene: PackedScene = preload("res://entities/projectiles/humans/scenes/human_bullet.tscn")
var laser_robot_scene: PackedScene = preload("res://entities/projectiles/robots/scenes/robot_laser.tscn")

func _on_enemie_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	add_child(laser)

func _on_enemie_robot_laser(pos):
	var laser = laser_robot_scene.instantiate()
	laser.position = pos
	add_child(laser)
	

func _on_level_finished(_body):
	Transition.change_scene("res://menus/scenes/main_menu.tscn")

