class_name GameView
extends Control


var data : Data


func _ready() -> void:
	(get_node("%Header") as Label).text = "%s" %data.profile_name
