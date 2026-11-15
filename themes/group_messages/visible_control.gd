extends Control

func _ready() -> void:
	Dialogic.Text.about_to_show_text.connect(set_bottom)

func set_bottom(_info) -> void:
	get_parent().move_child(self, -1)
