class_name Player
extends CharacterBody2D

# 重力参数
@export var gravity = 980.0
@export var can_air_attack = true

# 节点引用
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $StateMachine
@onready var burn_point: Marker2D = $"../BurnPoint"

# 状态实例
@onready var idle_state: IdleState = $StateMachine/IdleState
@onready var jump_state: JumpState = $StateMachine/JumpState
@onready var run_state: RunState = $StateMachine/RunState
@onready var attack_state: AttackState = $StateMachine/AttackState
@onready var slide_state: SlideState = $StateMachine/SlideState

# 武器系统
var weapon: Weapon = null

func _ready():
	# 初始化所有状态
	idle_state.setup(self, state_machine)
	run_state.setup(self, state_machine)
	jump_state.setup(self, state_machine)
	attack_state.setup(self, state_machine)
	slide_state.setup(self, state_machine)
	
	# 初始化状态机
	state_machine.init(idle_state)

# 添加状态变化信号
signal state_changed(new_state_name)

func _physics_process(delta: float) -> void:
	# 重开
	if position.y > 480:
		position = burn_point.position

	velocity.y += gravity * delta
	move_and_slide()
	
# 状态切换的简单包装
func change_state(new_state: State):
	state_machine.change_state(new_state)
	# 发送状态变化信号
	emit_signal("state_changed", new_state.name)

func _on_weapon_box_get_weapon() -> void:
	print("get a weapon")
	var weapon_tscn = load("res://scenes/weapons/light_sword.tscn")
	var new_weapon = weapon_tscn.instantiate()
	add_child(new_weapon)
	weapon = new_weapon
	
	print(weapon)
	
func attack() -> void:
	if not weapon:
		return
	weapon.attack(animated_sprite_2d.flip_h)
