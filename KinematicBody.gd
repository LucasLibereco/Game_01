extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var camera = get_parent().get_node("Camera")
onready var objekt = preload("res://SnowBall.tscn")
var pohyb = Vector3(0,0,0)
var position3D
var acceleration = 2
var max_speed = 8


func _physics_process(delta):
	var position2D = get_viewport().get_mouse_position()
	var dropPlane  = Plane(Vector3(0, 10, 0), 0)
	position3D = dropPlane.intersects_ray(camera.project_ray_origin(position2D),camera.project_ray_normal(position2D))
	var vyska = self.translation.y
	position3D = Vector3(position3D.x,vyska,position3D.z)
	#print(position3D)
	if position3D:
		self.look_at(position3D, Vector3(0,1,0))
		

	#if Input.is_action_pressed("LMB"):
	#	pohyb = position3D - self.translation
	#	if pohyb.x>7:
	#		pohyb.x=7
	#	if pohyb.x<-7:
	#		pohyb.x=-7
	#	if pohyb.z>7:
	#		pohyb.z=7
	#	if pohyb.z<-7:
	#		pohyb.z=-7
	
	
	if Input.is_action_pressed("key_A"):
		if pohyb.x != 0:
			max_speed=5.65
		pohyb.z= max(pohyb.z-acceleration, -max_speed)
	elif Input.is_action_pressed("key_D"):
		if pohyb.x != 0:
			max_speed=5.65
		pohyb.z= min(pohyb.z+acceleration, max_speed)
	else:
		max_speed= 8
		if pohyb.z>1:
			pohyb.z = pohyb.z-acceleration
		if pohyb.z<-1:
			pohyb.z = pohyb.z+acceleration
		else:
			pohyb.z=0
		
	if Input.is_action_pressed("key_W"):
		if pohyb.z != 0:
			max_speed=5.65
		pohyb.x=min(pohyb.x+acceleration, max_speed)
	elif Input.is_action_pressed("key_S"):
		if pohyb.z != 0:
			max_speed=5.65
		pohyb.x=max(pohyb.x-acceleration, -max_speed)
	else:
		max_speed= 8
		if pohyb.x>1:
			pohyb.x = pohyb.x-acceleration
		if pohyb.x<-1:
			pohyb.x = pohyb.x+acceleration
		else:
			pohyb.x=0
	
	
	
		#print (pohyb)
	#print (is_on_floor())
	if is_on_floor() == false:
		pohyb.y = -10
		
	#move_and_slide_((pohyb,Vector3(1,0,0))
	move_and_slide_with_snap(pohyb,Vector3(0,-1,0),Vector3(0,1,0),true)
	#pohyb=Vector3(0,0,0)
	
	if Input.is_action_just_pressed("LMB"):
		if Global.munice>0:
			Global.munice = Global.munice -1
			get_tree().get_current_scene().get_node("Interface").HUD_ammo(Global.munice)
			
			
			var ob = objekt.instance()		
			ob.translate(transform.xform($RayCast.translation))
			ob.smer(get_rotation_degrees())
		#	get_tree().get_root().add_child(ob)
			get_parent().add_child(ob)
			
		
func hit():
	
	Global.player_lifes = Global.player_lifes - 1
	get_tree().get_current_scene().get_node("Interface").HUD_lifes(Global.player_lifes)
	if Global.player_lifes == 0:
		Global.game_over()
