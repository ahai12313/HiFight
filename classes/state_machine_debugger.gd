class_name SMDebugger
extends Label

@export var state_machine_path: NodePath
var state_machine: StateMachine

func _ready():
	# 获取状态机
	state_machine = get_node(state_machine_path) as StateMachine
	# 检查状态机是否有效
	if state_machine:
		# 初始更新文本
		update_text()
		# 连接状态切换信号
		state_machine.call_deferred("connect", "state_changed", Callable(self, "_on_state_changed"))
	else:
		text = "状态机未找到"

# 状态变化回调
func _on_state_changed(new_state_name: String):
	update_text()

# 更新调试文本
func update_text():
	if state_machine and state_machine.current_state:
		text = "当前状态: %s" % state_machine.current_state.name
	else:
		text = "无活动状态"
