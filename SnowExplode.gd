extends Spatial


# Declare member variables here. Examples:
# var a = 2
onready var hit_sound =  load("res://Sounds/Snow Ball Hit.wav")
# Called when the node enters the scene tree for the first time
func _ready():
	#$AnimationPlayer.play("BOOM")
	$Particles.set_emitting(true)
	$Sound.set_stream(hit_sound)
	$Sound.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_Timer_timeout():
	queue_free()
