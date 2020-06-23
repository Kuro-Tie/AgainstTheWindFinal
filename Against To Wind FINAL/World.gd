extends Node
onready var Player = preload("res://Player.tscn")

var levelnumber = 1
var gamefinish = false
var dusmanspeed = Vector2()
var dusmanreturn = Vector2()
var dusmanspeedfaster = 0
func _ready():
	$LoseLabel.visible = false
	$WinLabel.visible = false
	$FasterButton.visible = false
	$InfoText3.visible = false

func _physics_process(delta):
	dusmanreturn.y = 100
	dusmanspeed.y = 0 + dusmanspeedfaster
	$Dusman.move_and_slide(dusmanspeed)
	$Dusman2.move_and_slide(dusmanspeed)
	$Dusman3.move_and_slide(dusmanspeed)

func _on_Area2D_area_entered(area):
	$Dusman.move_and_slide(dusmanreturn*-65)
	$Dusman2.move_and_slide(dusmanreturn*-65)
	$Dusman3.move_and_slide(dusmanreturn*-65)

func _on_Area2D_body_entered(body):
	$LoseLabel.visible = true
	$Player.queue_free()
	$RestartGame.start()

func _on_Finish_body_entered(body):
	$WinLabel.visible = true
	$FasterButton.visible = true
	$Player.queue_free()
	$InfoText3.visible = true
	$FasterButton.disabled = false
	$FasterButton.visible = true
	$InfoText3.visible = true
func _on_RestartGame_timeout():
	get_tree().reload_current_scene()

func _on_FasterButton_pressed():
	$WinLabel.visible = false
	var ReloadPlayer = Player.instance()
	add_child(ReloadPlayer)
	dusmanspeedfaster = dusmanspeedfaster + 25
	$FasterButton.disabled = true
	$FasterButton.visible = false
	$InfoText3.visible = false
	$InfoText4.text = "Level " + str(levelnumber)
	levelnumber = levelnumber + 1
	$GoButton.connect("pressed", $Player, "_on_GoButton_pressed")
