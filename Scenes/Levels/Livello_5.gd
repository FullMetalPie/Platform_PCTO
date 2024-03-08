extends Node2D

var harness_area : Area2D
var time_start = 0
var time_now = 0
var time_win = 0
export var time_elapsed = 0
var win_game = false
var is_dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	time_start = OS.get_unix_time()
	harness_area = $Harness_Collezionbaile
	harness_area.connect("is_entered_harness", self, "_on_Harness_is_entered")


func _process(delta):
	time_now = OS.get_unix_time()
	time_elapsed = time_now - time_start
	if Global.show_fps:
		$CanvasLayer_FPS/Label_FPS.text = str(Engine.get_frames_per_second()) + " FPS"

func _on_Harness_is_entered():
	if time_win == 0:
		time_win = time_elapsed
	$CanvasLayer_Win/Popup_Win.show()
	$CanvasLayer_Win/Popup_Win/Label_Win.text = ("\nHAI VINTO!\nTempo impiegato per completare il livello: " + str(time_win) + " secondi")
	$Player.speed = 0
	
	Global.is_Harness_collected = true


func _on_Dead_Area_body_entered(body):
	_die()
	
func _die():
	$CanvasLayer_Dead/Popup_Dead.show()
	$Player.speed = 0
	$Player.hide()
	is_dead = true


func _on_Button_Win_Coll_pressed():
	get_tree().change_scene("res://Scenes/Menu/HUD_COLLECT.tscn")


func _on_Button_Win_Esci_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")


func _on_Button_Dead_Ripirova_pressed():
	get_tree().change_scene("res://TMP.tscn")


func _on_Button_Dead_Esci2_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")


func _on_Area2D_Change_body_entered(body):
	$Harness_Collezionbaile.position = $POS_TO_MOVE.position
