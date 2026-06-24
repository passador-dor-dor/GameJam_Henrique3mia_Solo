extends Node2D

@onready var label: Label = $esc

var player_inside : bool = false
signal finished

func _on_area_2d_body_entered(_body: Node2D) -> void:
	player_inside = true
	finished.emit()
	label.visible = true
	await  get_tree().create_timer(5).timeout
	label.visible = false

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group(&"player"):
		player_inside = false
