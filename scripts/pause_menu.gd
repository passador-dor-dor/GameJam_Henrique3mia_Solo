extends CanvasLayer
# ao ser criado na tela, o menu é escondido
func _ready() -> void:
	hide()
# função para abrir o menu ou fechar o menu quando pressionar
# a tecla cadastrada como pause
func _input(event) -> void:
	if event.is_action_pressed("esc"):
		if get_tree().paused:
			hide()
			get_tree().paused = false
		else:
			show()
			get_tree().paused = true

func _on_button_pressed() -> void:
	hide()
	get_tree().paused = false

func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu_inicial.tscn")
