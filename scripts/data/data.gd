class_name Data
extends Resource


@export
var profile_name : String = "New Profile"
@export
var save_path : String = "user://saves/save0"


func _init(
		_profile_name : String = "New Profile",
		_save_path : String = "user://saves/save_0"
) -> void:
	profile_name = _profile_name
	save_path = _save_path
