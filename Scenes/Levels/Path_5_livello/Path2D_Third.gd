extends Path2D


var inc = 1
var speed = 250
var cont = 0

func _process(delta):
	if round($PathFollow2D_Third.offset) == round(560.63):
		cont += 1
	elif round($PathFollow2D_Third.offset) == 0:
		cont += 1
		
	if cont % 2 == 0:
		inc += delta * speed
		$PathFollow2D_Third.offset = inc
	else:
		inc -= delta * speed
		$PathFollow2D_Third.offset = inc


func _ready():
	inc = 1
	speed = 250
	cont = 0
