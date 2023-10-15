extends StaticBody2D

signal player_touched()

func _on_body_entered(body):
	if body.name == 'PlayerMouse':
		player_touched.emit()
