class_name Enemy_01
extends CharacterBody2D

# 重力参数
@export var gravity = 980.0
@export var can_air_attack = true
# 节点引用
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $StateMachine
@onready var enemy_idle_state: EnemyIdleState = $StateMachine/EnemyIdleState



func _ready():
	# 初始化所有状态
	enemy_idle_state.setup(self, state_machine)
	
	# 初始化状态机
	state_machine.init(enemy_idle_state)
	
# 添加状态变化信号
signal state_changed(new_state_name)

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide()

# 状态切换的简单包装
func change_state(new_state: State):
	state_machine.change_state(new_state)
	# 发送状态变化信号
	emit_signal("state_changed", new_state.name)
