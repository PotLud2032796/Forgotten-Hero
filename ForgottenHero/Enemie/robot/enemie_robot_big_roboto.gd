extends enemie

@onready var animation_mega_man = $AnimationPlayer2

#@onready var animation_player_big_man_bullet = preload("res://Enemie/big_man_homme_Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Shooting	
	
	if can_laser and can_burst:
		animation_mega_man = $AnimationPlayer2
		animation_mega_man.play("shoot_mega_man")

func _on_timer_timeout():
	can_laser = true
	print("can_laser")

func _on_burst_timeout():
	can_burst = true
	print("can_burst")

