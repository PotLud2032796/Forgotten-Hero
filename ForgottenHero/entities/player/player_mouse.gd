extends CharacterBody2D

# Exported variables that can be tweaked in the Godot editor
@export var speed: float = 150
@export var friction: float = 0.3
@export var acceleration: float = 0.1
@export var dash_speed: float = 200
@export var dash_cooldown: float = 0.7

# References to nodes in the scene
@onready var hurt_box = $HurtBox
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

# Variables to track character state
var starting_direction: Vector2 = Vector2(0, 1)
var isHurt: bool = false
var is_invincible: bool = false
var is_dashing: bool = false
var can_dash: bool = true
var dash_direction: Vector2
var dash_timer: Timer

func _ready():
	dash_timer = $DashTimer
	update_animation_parameters(starting_direction)

func get_input():
	var input = Vector2.ZERO
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	
	if Input.is_action_just_pressed("dash") and can_dash:
		dash()
		input = dash_direction
	
	update_animation_parameters(input)
	pick_new_state()
	return input.normalized()

func player_logic(delta):
	_physics_process(delta)
	
	if !isHurt:
		for area in hurt_box.get_overlapping_areas():
			if !is_invincible:
				get_tree().change_scene_to_file("res://menus/scenes/game_over.tscn")

func _physics_process(delta):
	var direction = get_input()
	
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	
	move_and_slide()

func dash():
	$DashAnimationTimer.start()
	is_dashing = true
	can_dash = false
	is_invincible = true
	dash_direction = velocity.normalized()  # Record the current direction
	velocity = dash_direction * dash_speed
	dash_timer.start(dash_cooldown)

func update_animation_parameters(move_input: Vector2):
	if is_dashing:
		move_input = dash_direction
	
	if move_input != Vector2.ZERO:
		animation_tree.set("parameters/run/blend_position", move_input)
		animation_tree.set("parameters/idle/blend_position", move_input)
		animation_tree.set("parameters/dash/blend_position", move_input)

func pick_new_state():
	if velocity != Vector2.ZERO and is_dashing == true:
		state_machine.travel("dash")
	
	if velocity != Vector2.ZERO and is_dashing == false:
		state_machine.travel("run")
	
	elif is_dashing == false:
		state_machine.travel("idle")

func _on_dash_timer_timeout():
	can_dash = true

func _on_dash_animation_timer_timeout():
	is_dashing = false
	is_invincible = false
