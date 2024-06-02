class_name Root
extends Node


var data : Data


func _ready() -> void:
	_display_main_menu()


func _display_main_menu() -> void:
	_clear_user_interface()
	
	var node : MainMenu = (
		(
			load("res://scenes/user_interface/main_menu/main_menu.tscn") as PackedScene
		).instantiate() as MainMenu
	)
	
	node.profile_loaded.connect(_on_profile_loaded)
	
	get_node("%UserInterface").add_child(node)


func _display_game() -> void:
	_clear_user_interface()
	
	var node : GameView = (
		(
			load("res://scenes/user_interface/game_view/game_view.tscn") as PackedScene
		).instantiate() as GameView
	)
	
	node.data = data
	
	get_node("%UserInterface").add_child(node)


func _clear_user_interface() -> void:
	var children : Array[Node] = get_node("%UserInterface").get_children()
	
	for child : Node in children:
		child.queue_free()


func _on_profile_loaded(_data : Data) -> void:
	data = _data
	_display_game()
