extends Area2D

var speed: int = 30
var direction: Vector2 
var random_value  = randi_range(1,5)
var random_angle

func _process(delta):
	
	if random_value ==1:
		random_angle = 0
	elif random_value == 2:
		random_angle = 100
	elif random_value == 3:
		random_angle = -100
	elif random_value ==4:
		random_angle = 25
	elif random_value ==5:
		random_angle = -25
	
	direction = Vector2.LEFT.rotated(random_angle)
	$Sprite2D.rotation = direction.angle()
	position += direction * speed * delta
