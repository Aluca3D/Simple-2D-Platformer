extends CharacterBody2D
class_name PlayerController

@export var SPEED = 4.0
@export var JUMP_POWER = 8.5
@export var standing: CollisionShape2D

var speed_multiplier = 30
var jump_multiplier = -30
var direction = 0
var can_standup = true
var is_sneaking = false

func _on_body_body_entered(body: Node2D) -> void:
	if body.get_class() == "TileMapLayer":
		can_standup = false

func _on_body_body_exited(body: Node2D) -> void:
	if body.get_class() == "TileMapLayer":
		can_standup = true

func get_is_sneaking() -> bool:
	return is_sneaking

func _input(event: InputEvent) -> void:
	# Handle jump up
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_POWER * jump_multiplier
	# Handle jump down
	if event.is_action_pressed("move_down"):
		set_collision_mask_value(10, false)
	else:
		set_collision_mask_value(10, true)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * speed_multiplier)

	# sneaking 
	if Input.is_action_pressed("sneak"):
		is_sneaking = true
	elif !Input.is_action_pressed("sneak") && can_standup:
		is_sneaking = false
	standing.set_deferred("disabled", is_sneaking)
	
	move_and_slide()
