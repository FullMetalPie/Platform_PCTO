extends Path2D

var inc = 0
var inc2 = 1400
var inc3 = 3800
var speed = 1600

func _process(delta):
	inc += delta * speed
	inc2 += delta * speed
	inc3 += delta * speed
	$PathFollow2D_Corsia_Bassa.offset = inc
	$PathFollow2D_Corsia_Bassa_2.offset = inc2
	$PathFollow2D_Corsia_Bassa_3.offset = inc3

