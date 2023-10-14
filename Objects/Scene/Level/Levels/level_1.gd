extends Node2D

func player_touched():
	print("DEAD")

func _on_area_2d_body_entered(body:Node2D):
	pass # Replace with function body.


func _on_finish_door_body_entered(body:Node2D):
	print("Changer de niveau")
