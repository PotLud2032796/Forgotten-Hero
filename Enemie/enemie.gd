extends CharacterBody2D
class_name enemie

const SPEED = 800

var can_laser: bool = true
var can_burst: bool = true
var wait: bool = true
@onready var animation_player = $AnimationPlayer

var conteur = 0
@export var max_balle = 0

signal player_laser_robot(pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if can_laser:
		animation_player.play("Shoot")
		var laser_markers = $LaserPos.get_children()

		for laser_marker in laser_markers:
			player_laser_robot.emit(laser_marker.global_position)
		can_laser = false
		conteur = conteur +1
		$Timer.start()
		if conteur == max_balle:
			animation_player.stop()
			animation_player.play("RESET")
			$Burst.start()
			conteur = 0

func _on_timer_timeout():
	can_laser = true


