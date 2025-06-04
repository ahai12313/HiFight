# state.gd - 状态基类
class_name State
extends Node

# 状态持有者和状态机引用
var owner_node: CharacterBody2D = null
var state_machine: Node = null



# 初始化状态
func setup(owner: CharacterBody2D, machine: Node):
	owner_node = owner
	state_machine = machine

# 状态生命周期方法
func enter(): # 进入状态时调用
	pass
	
func exit(): # 退出状态时调用
	pass
	
func update(delta: float): # 每帧更新
	pass
	
func physics_update(delta: float): # 物理帧更新
	pass
	
func process_input(event: InputEvent): # 处理输入事件
	pass
