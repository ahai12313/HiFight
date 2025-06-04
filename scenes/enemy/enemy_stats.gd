class_name EnemyStats
extends Stats

func _ready() -> void:
	max_health = 3
	cur_health = 3
	
func lose_health() -> void:
	cur_health -= 1
	if cur_health == 0:
		owner.queue_free()
