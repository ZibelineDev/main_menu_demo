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
	
	get_node("%UserInterface").add_child(node)


func _clear_user_interface() -> void:
	var children : Array[Node] = get_node("%UserInterface").get_children()
	
	for child : Node in children:
		child.queue_free()
