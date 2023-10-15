extends CharacterBody2D

# Variables exposées
@export var max_speed : float = 125
@export var accel : float = 1000
@export var friction : float = 1250
@export var dash_speed : float = 400
@export var dash_cooldown : float = 1
@export var starting_direction : Vector2 = Vector2(0, 1)
@onready var hurt_box = $HurtBox
var isHurt: bool = false

# parameters/idle/blend_position

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

# Variables internes
var can_dash : bool = true
var dash_timer : Timer
var is_dashing : bool = false

func _ready():
	dash_timer = $DashTimer
	update_animation_paramaters(starting_direction)

func _physics_process(delta):
	player_movement(delta)
	if !isHurt:
		for area in hurt_box.get_overlapping_areas():
			get_tree().change_scene_to_file("res://HUD/game_over.tscn")

func get_input():
	var input = Vector2.ZERO
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	update_animation_paramaters(input)
	pick_new_state()
	return input.normalized()

func player_movement(delta):
	var input = get_input()

	if input == Vector2.ZERO:
		var friction_force = velocity.normalized() * (friction * delta)
		velocity = velocity.move_toward(Vector2.ZERO, friction_force.length())
	else:	
		velocity = velocity.move_toward(input * max_speed, accel * delta)

	if Input.is_action_just_pressed("dash") and can_dash:
		dash()

	move_and_slide()

func dash():
	$DashAnimationTimer.start()
	is_dashing = true
	var dash_direction = velocity.normalized()
	velocity = dash_direction * dash_speed
	dash_timer.start(dash_cooldown)




func _on_dash_timer_timeout():
	can_dash = true
	

func update_animation_paramaters(move_input : Vector2):
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/run/blend_position", move_input)
		animation_tree.set("parameters/idle/blend_position", move_input)
		animation_tree.set("parameters/dash/blend_position", move_input)
		
func pick_new_state():
	if(velocity != Vector2.ZERO) and is_dashing == true:
		state_machine.travel("dash")
		print("dashAnimation")
	if(velocity != Vector2.ZERO) and is_dashing == false:
		state_machine.travel("run")
	elif(is_dashing == false):
		state_machine.travel("idle")

func _on_dash_animation_timer_timeout():
	is_dashing = false
