class_name SlideState
extends State

const SLID_SPEED = 800

var player_node
var times = 0

# 初始化状态
func setup(owner: CharacterBody2D, machine: Node):
	owner_node = owner
	player_node = owner_node
	state_machine = machine

# 状态生命周期方法
func enter(): # 进入状态时调用
	var face_to_left = -1 if player_node.animated_sprite_2d.flip_h else 1
	owner_node.velocity.x = face_to_left * SLID_SPEED
	player_node.animated_sprite_2d.rotation_degrees = face_to_left * 90
	times = 0
	
func exit(): # 退出状态时调用
	player_node.animated_sprite_2d.rotation_degrees = 0
	
func update(delta: float): # 每帧更新
	times += 1
	if times == 30:
		state_machine.change_state(owner_node.run_state)
	
func physics_update(delta: float): # 物理帧更新
	pass
	
func process_input(event: InputEvent): # 处理输入事件
	pass
