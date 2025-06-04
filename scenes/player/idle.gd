class_name IdleState
extends State

func enter() -> void:
	owner_node.animated_sprite_2d.play("idle")

func physics_update(delta):
	
	# 检测是否需要移动
	if Input.get_axis("move_left", "move_right") != 0:
		state_machine.change_state(owner_node.run_state)
	
	# 检测是否需要跳跃
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state(owner_node.jump_state)

func process_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		owner_node.attack()
