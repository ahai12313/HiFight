class_name WeaponColor
extends ColorRect

@onready var flash_timer: Timer = $"../../FlashTimer"

var is_flashing = false
var tween: Tween
var ori_color

func _ready():
	tween = create_tween()
	ori_color = color

func start_flash():
	var pre_color = color
	if not is_flashing:
		is_flashing = true
		flash_timer.start()
		_create_flash_sequence()
	

func _process(delta: float) -> void:
	if flash_timer.is_stopped():
		stop_flash()
		color = ori_color

func stop_flash():
	if is_flashing:
		tween.kill()
		color = Color.WHITE
		is_flashing = false

func _create_flash_sequence():
	tween = create_tween().set_loops()
	tween.set_parallel(false)
	tween.tween_property(self, "color", Color.RED, 0.2)
	tween.tween_property(self, "color", Color.WHITE, 0.2)
	tween.tween_interval(0.1) # 闪烁间隔
