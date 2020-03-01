extends Spatial
onready var enemy_obj = preload("res://Enemy.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.enemies < 3:
		spawn_enemy()
	
func spawn_enemy():
	var ob = enemy_obj.instance()
	
	ob.translate(self.translation+Vector3((rand_range(-2,2)*25),0,(rand_range(0,2)*25)))
	
	#get_parent().get_node("Enemies").add_child(ob)
	get_parent().add_child(ob)
