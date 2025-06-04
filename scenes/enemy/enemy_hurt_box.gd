extends Area2D

@onready var enemy_flash: EnemyFlash = $"../EnemyFlash"
@onready var enemy_stats: EnemyStats = $"../EnemyStats"


func _ready() -> void:
	area_entered.connect(_on_area_entered)

# 处理信号的方法
func _on_area_entered(entered_area):
	# entered_area 参数是进入的节点
	print(name + ":" + entered_area.name + " 进入了我的区域")
	enemy_flash.start_flash()
	enemy_stats.lose_health()
