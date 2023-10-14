extends Area2D

signal player_touched()

func _on_body_entered(body:Node2D):
	if body.name == 'PlayerMouse':
		player_touched.emit()
