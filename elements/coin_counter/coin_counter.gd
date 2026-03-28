extends Node

@export var coin_value: Label
var total_coins: int = 0

func _ready() -> void:
	GameEvents.coin_collected.connect(_on_coin_collected)

func _on_coin_collected(amount: int) -> void:
	total_coins += amount
	coin_value.text = str(total_coins)
