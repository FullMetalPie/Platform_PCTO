extends Node2D

var extinguisher_area : Area2D
var time_start = 0
var time_now = 0
var time_win = 0
export var time_elapsed = 0
var paused = false
var is_dead = false

func _ready():
	Global.is_in_what_lvl = 2
	extinguisher_area = $Fire_Estinguisher_Area
	extinguisher_area.connect("is_entered_extintor", self, "_on_extinguisher_is_entered")
	time_start = OS.get_unix_time()
	$Path2D_Fire.firespeed = 0
	
func _on_extinguisher_is_entered(): #vittoria
	if time_win == 0:
		time_win = time_elapsed
	$CanvasLayer_Win/Popup_Win.show()
	$CanvasLayer_Win/Popup_Win/Label_Win.text = ("\nHAI VINTO!\nTempo impiegato per completare il livello: " + str(time_win) + " secondi")
	$Player.speed = 0
	$Path2D_Fire.firespeed = 0
	Global.is_Extinguisher_collected = true
	
func _process(_delta):
	
	time_now = OS.get_unix_time()
	time_elapsed = time_now - time_start
	if Global.show_fps:
		$CanvasLayer/Label_FPS.text = str(Engine.get_frames_per_second()) + " FPS"
	if $Player.velocity.x != 0:
		$Path2D_Fire.firespeed = 225
	
func _on_Area2D_body_entered(_body): # morte per caduta
	paused = true
	_die()
	$Path2D_Fire.firespeed = 0
		

func _on_Button_Dead_Esci2_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	get_tree().paused = false


func _on_Button_Dead_Ripirova_pressed():
	get_tree().change_scene("res://Scenes/Levels/Livello 2.tscn")
	get_tree().paused = false

func _on_Button_Win_Coll_pressed():
	get_tree().change_scene("res://Scenes/Menu/HUD_COLLECT.tscn")
	get_tree().paused = false


func _on_Button_Win_Esci_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	get_tree().paused = false


func _on_Flame_body_entered(_body): # entra nell'area degli ostacoli piccoli (fuoco)
	paused = true
	_die()
	$Path2D_Fire.firespeed = 0
	

func _on_Fire_body_entered(_body): # entra nell'area del fuoco mobile
	paused = true
	_die()
	$Path2D_Fire.firespeed = 0

func _die():
	$CanvasLayer_Dead/Popup_Dead.show()
	$Player.speed = 0
	$Player.hide()
	is_dead = true
