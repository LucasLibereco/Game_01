extends Camera

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var hrac = get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.

	
func _physics_process(delta):
	var pozice = hrac.translation
	look_at_from_position(Vector3(pozice.x-6,pozice.y+15,pozice.z),pozice,Vector3(1,0,0) )
#	look_at(pozice, Vector3(pozice.x,pozice.y+50,pozice.z))
