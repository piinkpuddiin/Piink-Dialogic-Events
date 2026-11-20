extends Panel

signal paused
var is_paused: bool = true

func _ready() -> void:
	paused.connect(set_true)

func set_true():
	set_process(true)
	is_paused = true

func _process(_delta: float) -> void:
	if is_paused:
		var tween = get_tree().create_tween()
		#tween.set_loops()
		await tween.tween_interval(5).finished
		is_paused = false
		print("paused!!")
		set_process(false)
