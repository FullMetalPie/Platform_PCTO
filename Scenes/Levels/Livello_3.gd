extends Node2D


var is_in1 = false
var is_in2 = false
var is_in3 = false
var is_dead = false
var time_start = 0
var time_now = 0
var time_win = 0
export var time_elapsed = 0
var mask_area : Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.is_in_what_lvl = 3
	mask_area = $Mask_Area
	mask_area.connect("is_entered_Mask", self, "_on_Mask_is_entered")
	time_start = OS.get_unix_time()

func _die():
	$CanvasLayer_Dead/Popup_Dead.show()
	$Player.speed = 0
	$Player.hide()
	is_dead = true


func _process(delta):
	if Global.show_fps:
		$CanvasLayer_FPS/Label_FPS.text = str(Engine.get_frames_per_second()) + "FPS"
		
	time_now = OS.get_unix_time()
	time_elapsed = time_now - time_start
	$Label_PressE_3.hide()
	$Label_PressE_2.hide()
	$Label_PressE_1.hide()
	
	
	
	if !is_dead:
		if is_in1:
			$Label_PressE_1.show()
			if Input.is_action_pressed("accept"):
				$Gas_UNDER1.hide()
				$Gas_UP1.hide()
				$Gas_UNDER1/CollisionShape2D.disabled = true
				$Gas_UP1/CollisionShape2D.disabled = true
		
		if is_in2:
			$Label_PressE_2.show()
			if Input.is_action_pressed("accept"):
				$Gas_UNDER2.hide()
				$Gas_UP2.hide()
				$Gas_UNDER2/CollisionShape2D.disabled = true
				$Gas_UP2/CollisionShape2D.disabled = true
			
			
		if is_in3:
			$Label_PressE_3.show()
			if  Input.is_action_pressed("accept"):
				$Gas_UNDER3.hide()
				$Gas_UP3.hide()
				$Gas_UNDER3/CollisionShape2D.disabled = true
				$Gas_UP3/CollisionShape2D.disabled = true
		

func _on_Dead_Fall_Zone_body_entered(body):
	_die()


func _on_Button_Dead_Esci2_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	get_tree().paused = false


func _on_Button_Dead_Ripirova_pressed():
	get_tree().change_scene("res://Scenes/Levels/Livello_3.tscn")
	get_tree().paused = false


func _on_Gas_body_entered(body):
	_die()


func _on_Area_close_pipes_body_entered(body):
	is_in1 = true
	

func _on_Area_close_pipes2_body_entered(body):
	is_in2 = true

func _on_Area_close_pipes3_body_entered(body):
	is_in3 = true


func _on_Area_close_pipes_body_exited(body):
	is_in1 = false


func _on_Area_close_pipes2_body_exited(body):
	is_in2 = false


func _on_Area_close_pipes3_body_exited(body):
	is_in3 = false



func _on_Gas_UP1_body_entered(body):
	_die()


func _on_Gas_UNDER1_body_entered(body):
	_die()


func _on_Mask_is_entered():
	if time_win == 0:
		time_win = time_elapsed
	$CanvasLayer_Win/Popup_Win.show()
	$CanvasLayer_Win/Popup_Win/Label_Win.text = ("\nHAI VINTO!\nTempo impiegato per completare il livello: " + str(time_win) + " secondi")
	$Player.speed = 0
	
	Global.is_Mask_collected = true


func _on_Button_Win_Esci_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")


func _on_Button_Win_Coll_pressed():
	get_tree().change_scene("res://Scenes/Menu/HUD_COLLECT.tscn")
