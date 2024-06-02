class_name MainMenu
extends Control

@export
var scene_profile_card : PackedScene


func _ready() -> void:
	var node : MainMenuProfileCard = scene_profile_card.instantiate() as MainMenuProfileCard
	
	node.profile_created.connect(_on_profile_created)
	node.profile_loaded.connect(_on_profile_loaded)
	
	get_node("%ProfilesContainer").add_child(node)


func _on_profile_loaded(data : Data) -> void:
	pass


func _on_profile_created() -> void:
	SaveSystem.create_new_profile()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
