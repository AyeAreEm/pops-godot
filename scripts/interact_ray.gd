extends RayCast3D
signal interacted(collider)

@onready var cam = $"../Camera3D"
const RAY_LENGTH = 2

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	pass

func _input(event):
	if Input.is_action_pressed("left_click"):
		var space_state = get_world_3d().direct_space_state

		var mousepos = get_viewport().get_mouse_position()

		var origin = cam.project_ray_origin(mousepos)
		var end = origin + cam.project_ray_normal(mousepos) * RAY_LENGTH
		var query = PhysicsRayQueryParameters3D.create(origin, end)
		query.collide_with_areas = true

		var result = space_state.intersect_ray(query)

		if result.is_empty() or !result["collider"].get_meta("IsInter"):
			return
		else:
			interacted.emit(result["collider"])
