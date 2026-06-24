extends Node2D
@onready var player: CharacterBody2D = $player

@onready var label: Label = $Hud/Label
var counter : float = 0.0
var contar : bool = true
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if contar:
		counter += delta
		label.text = "%.3fs"%counter


func _on_item_finished() -> void:
	player.can_dash = true
	pass # Replace with function body.

func _on_soul_soul_collected():
	$Soul_Hud.add_Soul()

func _ready():
	$soul.Soul_Collected.connect(_on_soul_soul_collected)
