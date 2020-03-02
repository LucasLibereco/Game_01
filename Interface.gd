extends Control

var life_tex_01 = preload("res://HUD/Life_icon_01.png")
var life_tex_02 = preload("res://HUD/Life_icon_02.png")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#$Label_ammo.set_text(str(Global.munice))
	HUD_ammo(Global.munice)
	HUD_score(Global.body)
	
func HUD_ammo(ammo):
	
	print($CanvasLayer/Label_ammo.get_text())
	$CanvasLayer/Label_ammo.set_text(str(ammo))
func HUD_score(score):
	
	$CanvasLayer/Label_score.set_text("SCORE: "+str(score))
	
func HUD_lifes(life):
	if life == 1:
		
		$HUD_life/Life_03.set_texture(life_tex_01)
		$HUD_life/Life_02.set_texture(life_tex_02)
		$HUD_life/Life_01.set_texture(life_tex_02)
	elif life == 2:
		$HUD_life/Life_03.set_texture(life_tex_01)
		$HUD_life/Life_02.set_texture(life_tex_01)
		$HUD_life/Life_01.set_texture(life_tex_02)
	elif life == 3:
		$HUD_life/Life_03.set_texture(life_tex_01)
		$HUD_life/Life_02.set_texture(life_tex_01)
		$HUD_life/Life_01.set_texture(life_tex_01)
	
