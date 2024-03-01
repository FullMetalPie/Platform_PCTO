extends Node2D

var extinguisher_area : Area2D

func _ready():
	extinguisher_area = $Fire_Estinguisher_Area
	extinguisher_area.connect("is_entered_extintor", self, "_on_extinguisher_is_entered")
	
func _on_extinguisher_is_entered():
	print("coglione")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
