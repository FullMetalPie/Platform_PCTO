extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_in1 = false
var is_in2 = false
var is_in3 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if is_in1 and Input.is_action_pressed("accept"):
		$Gas2.hide()
		$Gas2/CollisionShape2D.disabled = true
	
	if is_in2 and Input.is_action_pressed("accept"):
		$Gas5.hide()
		$Gas5/CollisionShape2D.disabled = true
		
	if is_in3 and Input.is_action_pressed("accept"):
		$Gas11.hide()
		$Gas11/CollisionShape2D.disabled = true
		

func _on_Dead_Fall_Zone_body_entered(body):
	$CanvasLayer_Dead/Popup_Dead.show()
	$Player.speed = 0


func _on_Button_Dead_Esci2_pressed():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	get_tree().paused = false


func _on_Button_Dead_Ripirova_pressed():
	get_tree().change_scene("res://Scenes/Levels/Livello_3.tscn")
	get_tree().paused = false


func _on_Gas_body_entered(body):
	$CanvasLayer_Dead/Popup_Dead.show()
	$Player.speed = 0


func _on_Area_close_pipes_body_entered(body):
	is_in1 = true

func _on_Area_close_pipes2_body_entered(body):
	is_in2 = true

func _on_Area_close_pipes3_body_entered(body):
	is_in3 = true
