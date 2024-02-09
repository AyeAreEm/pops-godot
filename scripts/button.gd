extends Node3D

@onready var body = $MeshInstance3D/StaticBody3D

signal buttonPressed 

func open_door():
	print("the door should move")
	buttonPressed.emit()

func _on_interact_ray_interacted(collider):
	if collider == body:
		open_door()
