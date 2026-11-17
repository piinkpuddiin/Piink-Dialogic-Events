extends CanvasLayer

var emojis_arr: Array = [
	"😃","😄","🙃","🙂","😀","😆","😇",
	"😁","😅","🫠","😊","😉","🤣","😂",
	
	"💟","❣️","🩶","💞","💓","🤎","💘",
	"💝","💌","🧡","💛","🩵","💚","💗",
	"💕","💜","🖤","🤍","❤️‍🔥","🩷","💙",
	"💖","❤️‍🩹","💔","❤️",
	
	"🥸","🤠","🥳","🫪","😦","🙁","😧",
	"😯","😓",
	
	"😣","😞","😕","😥","😖","😲","😫",
	"🥱","☹️","😟","🫤","😰","😮","😱",
	"😩","😨","😢","🥺","🥹","😳","😭",
	
	"😤","👿","😠","🤬","😡","☠️","💀",
	"😈",
	
	"🤧","🤒","😷","🤕","🤮","😵","🥴",
	"😵‍💫","🤢","🥵","🤯","🥶",
	
	"😾","😹","😿","🙀","😽","😺","😸",
	"😼","😻",
	
	"🤥","😶","🤐","😐","🫨","😒","😶‍🌫️",
	"😑","🙂‍↕️","🤨","😮‍💨","🙂‍↔️","😏","🫥",
	"😬","🙄",
	
	"😛","😝","😋","🤑","😜","🤪",
	
	"🙉","🙊","🙈",
	
	"🫩","😪","🤤","😴","😔","😌",
	
	"🫢","🤫","🤭","🤗","🤔","🫣","🫡"]

@export var grid_container: GridContainer

@export var curr_message: Control

func _ready() -> void:
	generate_emojis()

func generate_emojis() -> void:
	for i in emojis_arr:
		var button:= Button.new()
		button.custom_minimum_size = Vector2(45,45)
		button.text = i
		button.add_theme_font_size_override('font_size', 24)
		grid_container.add_child(button)
		#button.pressed.connect(GlobalVar.emit_signal.bind('player_sent_emoji'))
		button.pressed.connect(emoji_sent.bind(i))


func _on_clear_panel_pressed() -> void:
	hide()
	call_deferred('queue_free')


func emoji_sent(emoji) -> void:
	GlobalVar.player_sent_emoji.emit(curr_message,emoji)
	hide()
	await get_tree().process_frame
	call_deferred('queue_free')


func _on_clear_panel_visibility_changed() -> void:
	if visible:
		%Panel.position = get_viewport().get_mouse_position()
