class_name EnemyFlash
extends ColorRect

var flash_timer = 0.0
var flash_speed = 10.0
var is_flashing = false

func _process(delta):
	if is_flashing:
		flash_timer += delta * flash_speed
		if flash_timer > 7:
			stop_flash()
			flash_timer = 0
		# 使用sin函数创建平滑的闪烁效果
		var alpha = abs(sin(flash_timer))
		color = Color(1, 0, 0, alpha) # 红色闪烁

func start_flash():
	is_flashing = true
	flash_timer = 0.0
	color = Color.RED # 初始颜色

func stop_flash():
	is_flashing = false
	color = Color.TRANSPARENT # 恢复到透明
