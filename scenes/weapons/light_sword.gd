class_name LightSword
extends Weapon

@onready var weapon_color: WeaponColor = $Sprite2D/WeaponColor

func _ready() -> void:
	area_entered.connect(_on_area_entered)

# 处理信号的方法
func _on_area_entered(entered_area):
	# entered_area 参数是进入的节点
	print(name + ":" + entered_area.name + " 进入了我的区域")
	weapon_color.start_flash()
	
func attack(face_to_left: float) -> void:
	if not face_to_left:
		animation_player.play("attack")
	else:
		animation_player.play("attack_2")
