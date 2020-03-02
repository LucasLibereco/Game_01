extends KinematicBody

onready var objekt = preload("res://SnowBall.tscn")
onready var exploze = preload("res://SnowExplode.tscn")  
onready var snow_pick = preload ("res://ammo_snow.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pozice = Vector3(0,0,0)
var lifes = 2
var sledovat = false
var fire = false
onready var hrac = get_parent().get_node("/root/"+Global.level+"/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.enemies = Global.enemies + 1
	pass # Replace with function body.
	move_to_player()
	$Timer.start()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if sledovat:
		fire = true
		follow()
		
	else:
		move_to_player()
		pass
				
	if Input.is_action_just_pressed("RMB"):
		var ob = objekt.instance()		
		ob.translate(transform.xform($RayCast.translation))
		ob.smer(get_rotation_degrees())
		get_tree().get_root().add_child(ob)
	
func follow():
	var pozice = hrac.translation - self.translation
	look_at(hrac.translation,Vector3(0,1,0))
	if pozice.x>5:
		pozice.x = 5
	if pozice.z >5:
		pozice.z = 5
	if pozice.x<-5:
		pozice.x = -5
	if pozice.z <-5:
		pozice.z = -5
	#print (pozice)
	pozice.y = -10
	move_and_slide(pozice,Vector3(0,1,0))
	
func move_to_player():
	var pozice = hrac.translation - self.translation
	look_at(hrac.translation,Vector3(0,1,0))
	if pozice.x>2:
		pozice.x = 2
	if pozice.z >2:
		pozice.z = 2
	if pozice.x<-2:
		pozice.x = -2
	if pozice.z <-2:
		pozice.z = -2
	#print (pozice)
	pozice.y = -10
	move_and_slide(pozice,Vector3(0,1,0))


func hit():
	lifes=lifes-1
	if lifes==0:
		Global.body = Global.body + 100
		get_tree().get_current_scene().get_node("Interface").HUD_score(Global.body)
		var ob = exploze.instance()
		ob.translate(self.translation+Vector3(0,0,0))
		get_parent().add_child(ob)
		Global.enemies = Global.enemies  - 1
		var pick = snow_pick.instance()
		pick.translate(self.translation+Vector3(0,-1,0))
		get_parent().add_child(pick)
		queue_free()

func fire():
	var ob = objekt.instance()		
	ob.translate(transform.xform($RayCast.translation))
	ob.smer(get_rotation_degrees())
	get_parent().add_child(ob)
	fire = false
	
	
	
func _on_Area_body_entered(body):
	if body.get_name() == "Player":
		sledovat = true
		
	# Replace with function body.



func _on_Area_body_exited(body):
	if body.get_name() == "Player":
		sledovat = false


	

func _on_Timer_timeout():
	
	if fire == true:
		fire()
	$Timer.start()
	
