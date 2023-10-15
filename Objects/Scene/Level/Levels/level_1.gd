extends Node2D

signal level_finished
signal player_died

func _on_finish_door_body_entered(body:Node2D):
	if body.name == 'PlayerMouse':
		print('mouse_reach_obj')
		level_finished.emit()



func _on_player_touched():
	print("DEAD")
