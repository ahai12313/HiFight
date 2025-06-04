# jump_state.gd
class_name JumpState
extends State

const JUMP_FORCE = -450.0

func enter():
	# 应用跳跃力
	owner_node.velocity.y = JUMP_FORCE
	owner_node.animated_sprite_2d.play("jump")

func physics_update(delta):
	# 应用重力
	owner_node.velocity.y += owner_node.gravity * delta
	
	# 水平移动（空中有限制）
	var direction = Input.get_axis("move_left", "move_right")
	owner_node.velocity.x = direction * owner_node.run_state.run_speed * 0.6
	owner_node.move_and_slide()
	
	# 落地检测
	if owner_node.is_on_floor():
		if abs(owner_node.velocity.x) > 10:
			state_machine.change_state(owner_node.run_state)
		else:
			state_machine.change_state(owner_node.idle_state)

func process_input(event):
	# 空中攻击
	if event.is_action_pressed("attack") and owner_node.can_air_attack:
		owner_node.attack()
		
	# 蹬墙跳
	if Input.is_action_pressed("jump") and owner_node.is_on_wall():
		enter()
