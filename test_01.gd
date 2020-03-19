extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.


var title = "Game v0.1"

func _process(delta):
 #   OS.set_window_title(title + " | fps: " + str(Engine.get_frames_per_second()))
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_just_pressed("ui_select"):
		if Global.body >= 1000 and  Global.player_lifes < 3:
			print("add life")
			Global.body = Global.body -1000
			Global.player_lifes = Global.player_lifes + 1
			get_tree().get_current_scene().get_node("Interface").HUD_score(Global.body)
			get_tree().get_current_scene().get_node("Interface").HUD_lifes(Global.player_lifes)
			
