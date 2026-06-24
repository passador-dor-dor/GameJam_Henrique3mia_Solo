extends Node2D

@onready var label: Label = $Hud/Label
var counter : float = 0.0
var contar : bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if contar:
		counter += delta
		label.text = "%.3fs"%counter


func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level 2.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu_inicial.tscn")
