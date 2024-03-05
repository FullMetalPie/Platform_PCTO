extends Node2D

var is_in1 = false #TRASPORTATORE DX
var is_in2 = false #TRASPORTATORE SX

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.\
	
func _on_Dead_Fall_Zone_body_entered(body):
	#paused = true
	$CanvasLayer_Dead/Popup_Dead.show()
	$Player.speed = 0

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
	

