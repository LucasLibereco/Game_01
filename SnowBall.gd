extends RigidBody


onready var objekt = preload("res://SnowExplode.tscn")  

var velocity = Vector3(20,0,0)
var move_to = Vector3(0,0,0)

var rotat = Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	self.apply_impulse(velocity,velocity)


	
		
func smer(stupne):
	#print(stupne.y)
	rotat = stupne + Vector3(0,-90,0)
	velocity = velocity.rotated(Vector3(0,1,0),deg2rad(stupne.y+90))
	


func _on_Area_body_entered(body):
	if body.is_in_group("enemy"):
		
		var ob = objekt.instance()
		body.add_child(ob)
		#ob.translate(self.translation+Vector3(0,0 ,0))
		
		#ob.translate(self.translation)
		#add_child(ob)
		body.hit()
		queue_free()
		
	if body.is_in_group("dum"):
		print("dunaosdn")
		var ob = objekt.instance()
		ob.translate(self.translation+Vector3(0,0,0))
		get_tree().get_root().add_child(ob)
		#ob.translate(self.translation)
		#add_child(ob)
		queue_free()
		
	if body.is_in_group("nature"):
		var ob = objekt.instance()
		ob.translate(self.translation+Vector3(0,0,0))
		get_tree().get_root().add_child(ob)
		#ob.translate(self.translation)
		#add_child(ob)
		queue_free()
	if body.is_in_group("ground"):
		var ob = objekt.instance()
		ob.translate(self.translation+Vector3(0,0,0))
		get_parent().add_child(ob)
		#ob.translate(self.translation)
		#add_child(ob)
		queue_free()



