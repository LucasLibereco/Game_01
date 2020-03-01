extends Spatial


# Declare member variables here. Examples:
# var a = 2

# Called when the node enters the scene tree for the first time
func _ready():
	$AnimationPlayer.play("BOOM")
	$Particles.set_emitting(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "BOOM":
		queue_free()
		pass
