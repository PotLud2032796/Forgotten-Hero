extends Node2D

signal level_finished

func player_touched():
	print("DEAD")

func _on_area_2d_body_entered(body:Node2D):
	pass # Replace with function body.


func _on_finish_door_body_entered(body:Node2D):
	if body.name == 'PlayerMouse':
		level_finished.emit();
