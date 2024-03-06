extends Path2D

var inc = 0
var speed = 700
var inc2 = 1500
var inc3 = 3500

func _process(delta):
	inc += delta * speed
	inc2 += delta * speed
	inc3 += delta * speed
	$PathFollow2D_Corsia_Media.offset = inc
	$PathFollow2D_Corsia_Media_2.offset = inc2
	$PathFollow2D_Corsia_Media_3.offset = inc3
