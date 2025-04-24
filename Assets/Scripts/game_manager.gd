extends Node

var current_area: int = 1
var area_path = "res://Assets/Scenes/Areas/"

var coins: int = 0

func _ready() -> void:
	reset_coins()

func next_level() -> void:
	current_area += 1
	var full_path = area_path + "area_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	set_up_area()

func set_up_area() -> void:
	reset_coins()

func add_coin():
	coins += 1
	if coins >= 4:
		var portal = get_tree().get_first_node_in_group("area_exits") as AreaExit
		portal.open()


func reset_coins() -> void:
	coins = 0
