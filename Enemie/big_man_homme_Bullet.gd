extends Area2D
@onready var animation_player = $AnimationPlayer

var speed: int = 100
var direction: Vector2 = Vector2.RIGHT



func _process(delta):

	position += direction * speed * delta * 0
	animation_player.play("Bullet_shoot")
	
