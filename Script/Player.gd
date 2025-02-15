extends CharacterBody2D

var speed = 400
var attack_radius = 50
var attack_cooldown = 0.5
var time_since_attack = 0.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

@warning_ignore("unused_parameter")
func _process(delta):
	#移动逻辑
	get_input()
	move_and_slide()
	#攻击冷却
	time_since_attack += delta
	if Input.is_action_just_pressed("ui_space") and time_since_attack >= attack_cooldown:
		$AttackAreaMonitoring.emit_signal("attacked")
		time_since_attack = 0.0
		#链接到Area2D的信号
		$AttackAreaMonitoring.connect("body_entered",Callable(self,"_on_attack_area_entered"))
func _on_attack_area_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
