class_name MainMenu
extends Control

signal profile_loaded(data : Data)

@export
var scene_profile_card : PackedScene


func _ready() -> void:
	_initialise_profile_cards()


func _initialise_profile_cards() -> void:
	var profile_cards_data : Array[Data] = SaveSystem.get_profiles_data()
	
	for profile_card : Data in profile_cards_data:
		_create_profile_card(profile_card)
	
	_create_profile_card(null)


func _create_profile_card(data : Data) -> void:
	var node : MainMenuProfileCard = scene_profile_card.instantiate() as MainMenuProfileCard
	
	node.profile_created.connect(_on_profile_created)
	node.profile_loaded.connect(_on_profile_loaded)
	
	node.data = data
	
	get_node("%ProfilesContainer").add_child(node)


func _on_profile_loaded(data : Data) -> void:
	profile_loaded.emit(data)


func _on_profile_created() -> void:
	var data : Data = SaveSystem.create_new_profile()
	profile_loaded.emit(data)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
