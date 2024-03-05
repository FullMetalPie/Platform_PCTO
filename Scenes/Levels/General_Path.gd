extends Node2D

var is_in1 = false #TRASPORTATORE DX
var is_in2 = false #TRASPORTATORE SX
var inc_1_to_3 = 0
var inc_4 = 0
var inc_5_and_10 = 194
var inc_6_and_9 = 0
var inc_7_and_8 = 60

var speedBase = 400
var speed4 = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.\
	
func _on_Dead_Fall_Zone_body_entered(body):
	#paused = true
	$CanvasLayer_Dead/Popup_Dead.show()
	$Player.speed = 0
	$Path2D_Scatola1/PathFollow2D_Scatola1.offset = 0

func _on_Button_Dead_Esci2_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	get_tree().paused = false


func _on_Button_Dead_Ripirova_pressed():
	get_tree().change_scene("res://Scenes/Levels/Livello_1.tscn")
	get_tree().paused = false



#Trasportatori Livello 1
func _process(delta):
	if is_in1:
		$Player.position.x += 2
	elif is_in2:
		$Player.position.x -= 2
		
		
	
	#PATH
	inc_1_to_3 += delta * speedBase
	$Path2D_Scatola1/PathFollow2D_Scatola1.offset = inc_1_to_3
	$Path2D_Scatola2/PathFollow2D_Scatola2.offset = inc_1_to_3
	$Path2D_Scatola3/PathFollow2D_Scatola3.offset = inc_1_to_3
	
	if $Path2D_Scatola4/PathFollow2D_Scatola4.position.x >= 1510 and $Path2D_Scatola4/PathFollow2D_Scatola4.position.x <= 1610:
		speed4 = 100
	else:
		speed4 = 400
		
	inc_4 += delta * speed4
	$Path2D_Scatola4/PathFollow2D_Scatola4.offset = inc_4
	
	inc_5_and_10 += delta * 194
	$Path2D_Scatola5/PathFollow2D_Scatola5.offset = inc_5_and_10
	$Path2D_Scatola10/PathFollow2D_Scatola10.offset = inc_5_and_10
	
	inc_6_and_9 += delta * speedBase
	$Path2D_Scatola6/PathFollow2D_Scatola6.offset = inc_6_and_9
	$Path2D_Scatola9/PathFollow2D_Scatola9.offset = inc_6_and_9
	
	inc_7_and_8 += delta * 500
	$Path2D_Scatola7/PathFollow2D_Scatola7.offset = inc_7_and_8
	$Path2D_Scatola8/PathFollow2D_Scatola8.offset = inc_7_and_8
	

func _on_Transporter_right_body_entered(body):
	is_in1 = true
	print("Entrato dx")

func _on_Transporter_right_body_exited(body):
	is_in1 = false
	print("Uscito dx")

func _on_Transporter_left_body_entered(body):
	is_in2 = true
	print("Entrato sx")
	
func _on_Transporter_left_body_exited(body):
	is_in2 = false
	print("Uscito sx")
	

