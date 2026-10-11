extends Node2D

@onready var lifeContainer:HBoxContainer = $LifeContainer
@onready var life_1:TextureRect = $LifeContainer/LifeSprite
@onready var life_2:TextureRect = $LifeContainer/LifeSprite2
@onready var life_3:TextureRect = $LifeContainer/LifeSprite3
@onready var life_4:TextureRect = $LifeContainer/LifeSprite4
@onready var life_5:TextureRect = $LifeContainer/LifeSprite5
@onready var level:RichTextLabel = $Level
@onready var timer:RichTextLabel = $Timer

var time:float = 5.0

func _ready() -> void:
	if Global.minigames_done < 3:
		Global.minigames_done += 1
		get_tree().change_scene_to_file("res://Scene/minigames/minigames_" + str(Global.minigames_done) + ".tscn" )
	else:
		get_tree().change_scene_to_file("res://Scene/Main_Menu.tscn")
	
func _process(delta: float) -> void:
	match Global.lives:
		4:
			life_5.hide()
		3:
			life_5.hide()
			life_4.hide()
		2:
			life_5.hide()
			life_4.hide()
			life_3.hide()
		1:
			life_5.hide()
			life_4.hide()
			life_3.hide()
		0:
			lifeContainer.hide()
	
	timer.text = str(time)
	level.text = "Level " + str(Global.minigames_done)

func Timer(start_time: float):
	time = start_time
	
	while time > 0.0:
		await wait(0.1)
		time -= 0.1

func wait(seconds:float) -> void:
	await get_tree().create_timer(seconds).timeout
	pass
