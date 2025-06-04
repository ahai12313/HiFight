# run_state.gd
class_name RunState
extends State

var run_speed = 300.0

func enter():
	owner_node.animated_sprite_2d.play("run")

func physics_update(delta):
	# 移动方向
	var direction = Input.get_axis("move_left", "move_right")
	# 应用移动速度
	owner_node.velocity.x = direction * run_speed
	owner_node.velocity.y += owner_node.gravity * delta
	owner_node.move_and_slide()
	
	if Input.is_action_pressed("accelerate"):
		run_speed = 500
	else:
		run_speed = 300
	
	# 更新朝向
	if direction != 0:
		owner_node.animated_sprite_2d.flip_h = direction < 0
		if owner_node.weapon:
			owner_node.weapon.rotation_degrees = -70 if direction == 1.0 else 250
			owner_node.weapon.position.x = 28 * direction
	
	# 检测是否停止移动
	if direction == 0:
		state_machine.change_state(owner_node.idle_state)
	
	# 检测跳跃
	if Input.is_action_just_pressed("jump") and owner_node.is_on_floor():
		state_machine.change_state(owner_node.jump_state)
	
func process_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		owner_node.attack()
		
	if event.is_action("slide"):
		state_machine.change_state(owner_node.slide_state)

func exit():
	# 停止时的滑动效果
	#owner_node.velocity.x *= 0.8
	pass
