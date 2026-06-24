extends Area2D

signal Soul_Collected

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Soul_Collected.emit()
		queue_free()
