extends CanvasLayer

var Soul := 0

func add_Soul():
	Soul += 1
	print ("soul added")
	$Label.text = "Souls: " + str(Soul)
	
func _ready():
	$Label.text = "Souls: 0"
