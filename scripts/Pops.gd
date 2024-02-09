extends CharacterBody3D

@onready var nav_agent = $"../NavigationAgent3D"

var SPEED = 3
var start = 0
var end = 0
var last_position = Vector3(0,0,0)

func _physics_process(delta):
	print("last")
	
	var current_location = global_transform.origin
	
	if last_position == current_location:
		print("smae place")
		#start = Time.get_unix_time_from_system() if start == 0 else start
		#end = end - start
		#print(end)
		#
		#if end == 3:
			#print("been stuck for 3 units of time")
	
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	
	velocity = new_velocity
	move_and_slide()
	
	#if start == 3:
		#start = 0
	#last_position = current_location
	
func update_target_location(target_location):
	nav_agent.target_position = target_location
