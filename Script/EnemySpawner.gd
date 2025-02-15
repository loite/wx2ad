extends Timer

# 敌人的预制体路径
var enemy_preset = preload("res://Enemy.tscn")

# 生成敌人的间隔时间
var spawn_interval = 1.0
var timer = 0.0

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		# 在随机位置生成敌人
		var enemy = enemy_preset.instantiate()
		enemy.position = Vector2(randf_range(-500, 500), randf_range(-300, 300))
		add_child(enemy)
		timer = 0.0
