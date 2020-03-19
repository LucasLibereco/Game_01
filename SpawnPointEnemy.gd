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
	if Global.enemies < 4:
		spawn_enemy()
	
func spawn_enemy():
	var ob = enemy_obj.instance()
	
	ob.translate(self.translation+Vector3((rand_range(-100,100)),0,(rand_range(-100,100))))
	
	var player_trans = get_parent().get_node("Player").translation	
	
	
	if player_trans.z > ob.translation.z + 20:
		get_parent().add_child(ob)
	elif player_trans.z < ob.translation.z - 20:
		get_parent().add_child(ob)
	elif player_trans.y > ob.translation.y + 20:
		get_parent().add_child(ob)
	elif player_trans.y < ob.translation.y - 20:
		get_parent().add_child(ob)
	else:
		pass
		
	#get_parent().get_node("Enemies").add_child(ob)
			#get_parent().add_child(ob)
