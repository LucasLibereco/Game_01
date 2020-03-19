extends Node

var level = "Test_01"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var aaa = get_node("/root/"+level+"/Interface/")
var munice = 10
var body = 0
var enemies = 0
var player_lifes = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	 # Replace with function body.
	aaa.HUD_ammo(munice)
	aaa.HUD_score(body)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func game_over():
	#player_lifes=3
	#get_tree().reload_current_scene()
	
	
	munice = 10
	body = 0
	enemies = 0
	player_lifes = 3
	get_tree().change_scene("res://Game_Over.tscn")

	
