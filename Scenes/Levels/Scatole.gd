extends Path2D

var inc = 0
var speed = 200

func _process(delta):
	inc = speed * delta
	$PathFollow2D.offset = inc
