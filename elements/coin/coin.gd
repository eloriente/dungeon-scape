class_name Coin
extends Node2D

@export var area_2d: Area2D
@export var animation: AnimatedSprite2D
@export var coin_sound: AudioStreamPlayer2D

signal coin_grabed

var is_collected = false

func _ready() -> void:
	animation.play("idle")
	area_2d.body_entered.connect(_grab)

func _grab(_body) -> void:
	if is_collected: return
	is_collected = true
	coin_sound.reparent(get_parent())
	coin_sound.play()
	GameEvents.coin_collected.emit(1)
	coin_grabed.emit()
	queue_free()
