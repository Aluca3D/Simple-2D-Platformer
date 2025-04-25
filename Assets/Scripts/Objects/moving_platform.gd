extends Path2D
class_name MovingPlatform

@export var path_time: float = 1.0
@export var looping: bool = false
@export var tweenEase: Tween.EaseType
@export var transition: Tween.TransitionType
@export var path_follow_2D: PathFollow2D

func _ready() -> void:
	move_tween()


func move_tween() -> void:
	var tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow_2D, "progress_ratio", 1.0, path_time).set_ease(tweenEase).set_trans(transition)
	if !looping:
		tween.tween_property(path_follow_2D, "progress_ratio", 0.0, path_time).set_ease(tweenEase).set_trans(transition)
	else:
		tween.tween_property(path_follow_2D, "progress_ratio", 0.0, 0.0).set_ease(tweenEase).set_trans(transition)
