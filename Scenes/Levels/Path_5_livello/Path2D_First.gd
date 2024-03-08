extends Path2D


var inc = 1
var speed = 150
var cont = 0

func _process(delta):
	if round($PathFollow2D_First.offset) == round(560.63):
		cont += 1
	elif round($PathFollow2D_First.offset) == 0:
		cont += 1
		
	if cont % 2 == 0:
		inc += delta * speed
		$PathFollow2D_First.offset = inc
	else:
		inc -= delta * speed
		$PathFollow2D_First.offset = inc

func _ready():
	inc = 1
	speed = 150
	cont = 0
