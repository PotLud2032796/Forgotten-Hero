extends StaticBody2D

@export var bullet = preload("res://Enemie/Bullet.tscn")
@export var bullet_dammage = 1
var path_name
var current_targets = []
var curr

func _on_tower_enemie_body_entered(body):
	print("Voici le Body",body)
	pass # Replace with function body.


func _on_tower_enemie_body_exited(body):
	pass # Replace with function body.
