extends Node2D

var helmet_Area : Area2D
var is_in1 = false #TRASPORTATORE DX
var is_in2 = false #TRASPORTATORE SX
var inc_1_to_3 = 0
var inc_4 = 0
var inc_5_and_10 = 194
var inc_6_and_9 = 0
var inc_7_and_8 = 60
var time_start = 0
var time_now = 0
var time_win = 0
export var time_elapsed = 0
var is_dead = false

var speedBase = 400
var speed4 = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	helmet_Area = $Helmet_Area
	helmet_Area.connect("is_entered_Helmet", self, "_on_Helmet_is_entered")
	time_start = OS.get_unix_time()
	pass # Replace with function body.\
	
func _on_Dead_Fall_Zone_body_entered(body):
	_die()
	
	

func _on_Button_Dead_Esci2_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	get_tree().paused = false


func _on_Button_Dead_Ripirova_pressed():
	get_tree().change_scene("res://Scenes/Levels/Livello_1.tscn")
	get_tree().paused = false



#Trasportatori Livello 1
func _process(delta):
	if Global.show_fps:
		$CanvasLayer_FPS/Label_FPS.text = str(Engine.get_frames_per_second()) + "FPS"
		
	time_now = OS.get_unix_time()
	time_elapsed = time_now - time_start
	
	if is_in1:
		$Player.position.x += 2
	elif is_in2:
		$Player.position.x -= 2
		
		
	
	#PATH
	inc_1_to_3 += delta * speedBase
	$Path2D_Scatola1/PathFollow2D_Scatola1.offset = inc_1_to_3
	$Path2D_Scatola2/PathFollow2D_Scatola2.offset = inc_1_to_3
	$Path2D_Scatola3/PathFollow2D_Scatola3.offset = inc_1_to_3
	
	if $Path2D_Scatola4/PathFollow2D_Scatola4.position.x >= 1530 and $Path2D_Scatola4/PathFollow2D_Scatola4.position.x <= 1610:
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
	
	inc_7_and_8 += delta * speedBase
	$Path2D_Scatola7/PathFollow2D_Scatola7.offset = inc_7_and_8
	$Path2D_Scatola8/PathFollow2D_Scatola8.offset = inc_7_and_8
	

func _on_Transporter_right_body_entered(body):
	is_in1 = true

func _on_Transporter_right_body_exited(body):
	is_in1 = false

func _on_Transporter_left_body_entered(body):
	is_in2 = true
	
func _on_Transporter_left_body_exited(body):
	is_in2 = false
	


func _on_Helmet_is_entered():
	if time_win == 0:
		time_win = time_elapsed
	$CanvasLayer_Win/Popup_Win.show()
	$CanvasLayer_Win/Popup_Win/Label_Win.text = ("\nHAI VINTO!\nTempo impiegato per completare il livello: " + str(time_win) + " secondi")
	$Player.speed = 0
	Global.is_Helmet_collected = true


func _on_Button_Win_Esci_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")


func _on_Button_Win_Coll_pressed():
	get_tree().change_scene("res://Scenes/Menu/HUD_COLLECT.tscn")




func _on_Box_Area2D_Scatola1_body_entered(body):
	_die()


func _on_Box_Area2D_Scatola2_body_entered(body):
	_die()


func _on_Box_Area2D_Scatola3_body_entered(body):
	_die()


func _on_Box_Area2D_Scatola4_body_entered(body):
	_die()

func _on_Box_Area2D_Scatola5_body_entered(body):
	_die()


func _on_Box_Area2D_Scatola6_body_entered(body):
	_die()


func _on_Box_Area2D_Scatola7_body_entered(body):
	_die()


func _on_Box_Area2D_Scatola8_body_entered(body):
	_die()


func _on_Box_Area2D_Scatola9_body_entered(body):
	_die()


func _on_Box_Area2D_Scatola10_body_entered(body):
	_die()
	
	
func _die():
	$CanvasLayer_Dead/Popup_Dead.show()
	$Player.speed = 0
	$Player.hide()
	is_dead = true
