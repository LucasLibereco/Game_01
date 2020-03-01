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

