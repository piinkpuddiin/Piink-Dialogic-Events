extends Control
## Tilts the card toward the mouse while the pointer is over it, and eases back when it leaves.

@export var max_tilt := Vector2(22.0, 16.0)
var _current := Vector2.ZERO

func _process(delta: float) -> void:
	var target := Vector2.ZERO
	var p := get_local_mouse_position() / size - Vector2(0.5, 0.5)  # -0.5..0.5 over the card
	if absf(p.x) < 0.5 and absf(p.y) < 0.5:
		target = Vector2(p.x * 2.0 * max_tilt.x, -p.y * 2.0 * max_tilt.y)
	_current = _current.lerp(target, clampf(delta * 8.0, 0.0, 1.0))
	(material as ShaderMaterial).set_shader_parameter("tilt_degrees", _current)
