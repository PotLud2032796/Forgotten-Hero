extends CharacterBody2D

# Variables exposées
@export var max_speed : float = 125
@export var accel : float = 1000
@export var friction : float = 1250
@export var dash_speed : float = 400
@export var dash_cooldown : float = 1

# Variables internes
var can_dash : bool = true
var dash_timer : Timer

func _ready():
	dash_timer = $DashTimer

func _physics_process(delta):
	player_movement(delta)

func get_input():
	var input = Vector2.ZERO
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return input.normalized()

func player_movement(delta):
	var input = get_input()

	if input == Vector2.ZERO:
		var friction_force = velocity.normalized() * (friction * delta)
		velocity = velocity.move_toward(Vector2.ZERO, friction_force.length())
	else:
		velocity = velocity.move_toward(input * max_speed, accel * delta)

	move_and_slide()

	if Input.is_action_just_pressed("dash") and can_dash:
		dash()


func dash():
	var dash_direction = velocity.normalized()
	velocity = dash_direction * dash_speed
	dash_timer.start(dash_cooldown)
	can_dash = false

func _on_dash_timer_timeout():
	can_dash = true
