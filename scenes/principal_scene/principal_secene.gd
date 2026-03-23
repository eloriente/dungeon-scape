extends Node2D

@export var levels: Array[PackedScene]

var _current_level: int = 1
var _level_instance: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_create_level(_current_level)

func _create_level(level_id: int) -> void:
	_level_instance = levels[level_id - 1].instantiate()
	add_child(_level_instance)
