class_name MainMenuProfileCard
extends TextureButton

signal profile_loaded(data : Data)
signal profile_created

var data : Data 


func _ready() -> void:
	var text : String
	
	if data:
		text = "Profile 1"
	else:
		text = "New Profile"
	
	(get_node("%Label") as Label).text = text


func _on_pressed() -> void:
	if data:
		profile_loaded.emit(data)
	else:
		profile_created.emit()
