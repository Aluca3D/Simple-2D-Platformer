extends Area2D
class_name AreaExit

@export var sprite: Sprite2D

var is_open = false

func _ready() -> void:
	close()

func open() -> void:
	is_open = true
	sprite.region_rect.position.x = 48

func close() -> void:
	is_open = false
	sprite.region_rect.position.x = 0

func _on_body_entered(body: Node2D) -> void:
	if is_open && body is PlayerController:
		GameManager.next_level()
