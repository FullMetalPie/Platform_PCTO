extends Node2D

var reflective_area : Area2D
var time_start = 0
var time_now = 0
var time_win = 0
export var time_elapsed = 0
var win_game = false

# Called when the node enters the scene tree for the first time.
func _ready():
	reflective_area = $Reflective_Suit_Area
	reflective_area.connect("is_entered_Reflective_Suit", self, "_on_Reflective_Suit_is_entered")
	time_start = OS.get_unix_time()

func _on_Volvo_Car_body_entered(body):
	_player_death()

func _on_Jeep_Car1_body_entered(body):
	_player_death()
	
func _on_Jeep_Car2_body_entered(body):
	_player_death()

func _on_Button_Dead_Esci2_pressed():
	get_tree().change_scene("res://Scenes/Menu/HUD.tscn")


func _on_Button_Dead_Ripirova_pressed():
	get_tree().change_scene("res://Scenes/Levels/Livello_4.tscn")

func _player_death():
	if !win_game: 
		$CanvasLayer_Dead/Popup_Dead.show()
		$Player.position.y = 550
		$Player.speed = 0
		$Player.death()

func _on_Reflective_Suit_is_entered():
	if time_win == 0:
		time_win = time_elapsed
	$CanvasLayer_Win/Popup_Win.show()
	$CanvasLayer_Win/Popup_Win/Label_Win.text = ("\nHAI VINTO!\nTempo impiegato per completare il livello: " + str(time_win) + " secondi")
	$Player.speed = 0
	Global.is_Reflective_Suit_collected = true
	win_game = true
	$Path2D_Corsia_Alta.hide()
	$Path2D_Corsia_Media.hide()
	$Path2D_Corsia_Bassa.hide()

func _process(delta):	
	time_now = OS.get_unix_time()
	time_elapsed = time_now - time_start
	if Global.show_fps:
		$CanvasLayer_FPS/Label_FPS.text = str(Engine.get_frames_per_second()) + " FPS"
	


func _on_Button_Win_Esci_pressed():
	get_tree().change_scene("res://Scenes/Menu/HUD.tscn")


func _on_Button_Win_Coll_pressed():
	get_tree().change_scene("res://Scenes/Menu/HUD_COLLECT.tscn")
