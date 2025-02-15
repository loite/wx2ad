extends RigidBody2D

var speed = 200
@onready var target = get_node("/root/Main/Player")  # 等同于 get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_window().get_tree_string())

	if target:
		print("Target found: ", target.name)
		var direction = (target.global_position - global_position).normalized() 
		print("Direction to Target: ", direction)
	else:
		print("Target not found! Please check the path.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = (target.global_position - global_position).normalized() 
	linear_velocity = direction * speed
