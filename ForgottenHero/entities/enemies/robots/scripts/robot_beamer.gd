extends CharacterBody2D

const SPEED = 800
var can_laser: bool = true
var can_burst: bool = true
var wait: bool = true

@onready var animation_mega_man = $AnimationPlayer2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Shooting
	if can_laser and can_burst:
		animation_mega_man = $AnimationPlayer2
		animation_mega_man.play("shoot_mega_man")


	
var conteur = 0
@export var max_balle = 0

signal player_laser_robot(pos)
	
func _on_timer_timeout():
	can_laser = true

func _on_burst_timeout():
	can_burst = true
	