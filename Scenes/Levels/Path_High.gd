extends Path2D

var inc = 0
var inc2 = 130
var inc3 = 200
var speed_car1 = 600
var speed_car2 = 300
var speed_car3 = 700

func _process(delta):
	inc += delta * speed_car1
	inc2 += delta * speed_car2
	inc3 += delta * speed_car3
	$PathFollow2D_Corsia_Alta.offset = inc
	$PathFollow2D_Corsia_Alta_2.offset = inc2
	$PathFollow2D_Corsia_Alta_3.offset = inc3
