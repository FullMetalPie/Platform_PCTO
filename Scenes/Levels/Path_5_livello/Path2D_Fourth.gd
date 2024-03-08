extends Path2D


var inc = 1
var speed = 300
var cont = 0

func _ready():
	inc = 1
	speed = 300
	cont = 0

func _process(delta):
	if round($PathFollow2D_Fourth.offset) == round(560.63):
		cont += 1
	elif round($PathFollow2D_Fourth.offset) == 0:
		cont += 1
		
	if cont % 2 == 0:
		inc += delta * speed
		$PathFollow2D_Fourth.offset = inc
	else:
		inc -= delta * speed
		$PathFollow2D_Fourth.offset = inc
