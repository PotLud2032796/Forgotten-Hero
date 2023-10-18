extends CharacterBody2D

const SPEED = 800

var can_laser: bool = true
var can_burst: bool = true
var wait: bool = true

@onready var animation_player_big_man = $AnimationPlayer2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Shooting
	if can_laser and can_burst:
		animation_player_big_man = $AnimationPlayer2
		animation_player_big_man.play("ShootBigMen")

func _on_timer_timeout():
	can_laser = true
	print("can_laser")

func _on_burst_timeout():
	can_burst = true
	print("can_burst")

