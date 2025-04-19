extends Node2D

@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta: float) -> void:
    # flip the sprite
    if player_controller.direction == 1:
        sprite.flip_h = false
    elif player_controller.direction == -1:
        sprite.flip_h = true

    # move animation
    if abs(player_controller.velocity.x) > 0:
        animation_player.play("Move")
    else :
        animation_player.play("Idle")

    # jump
    if player_controller.velocity.y < 0:
        animation_player.play("Jump")
    elif player_controller.velocity.y > 0:
        animation_player.play("fall")
