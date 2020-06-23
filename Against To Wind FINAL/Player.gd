extends KinematicBody2D

var playerspeed = Vector2()

func _physics_process(delta):
	playerspeed.x = -100
	if Input.is_action_just_pressed("ui_accept"):
		playerspeed.x = 2300
	move_and_slide(playerspeed)

func _on_GoButton_pressed():
	playerspeed.x = 2300
	move_and_slide(playerspeed)