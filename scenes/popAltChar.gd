extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
@onready var timer = $Timer

var SPEED = 3

var last_position = Vector3(0,0,0)
var three_secs_passed = false

func _physics_process(delta):
	await get_tree().create_timer(0.5).timeout
	print(timer.time_left)
	var current_location = global_transform.origin
	print(three_secs_passed)
	
	if last_position.x == current_location.x and last_position.z == current_location.z:
		if three_secs_passed:
			print("yeah its done the thing")
		if timer.is_stopped():
			timer.start(3)
			three_secs_passed = false
	
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	
	velocity = new_velocity
	move_and_slide()
	
	last_position = current_location
	
func update_target_location(target_location: Vector3):
	nav_agent.target_position = target_location


func _on_timer_timeout():
	three_secs_passed = true
