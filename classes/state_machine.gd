class_name StateMachine
extends Node

# 当前状态
var current_state: State = null

# 初始化状态机
func init(initial_state: State) -> void:
	change_state(initial_state)

# 切换状态
func change_state(new_state: State) -> void:
	print("%s => %s" % [current_state, new_state])
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()

# 状态机更新
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)
		
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
		
func _input(event: InputEvent) -> void:
	if current_state:
		current_state.process_input(event)
