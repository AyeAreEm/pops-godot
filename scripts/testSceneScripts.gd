extends Node3D

@onready var player = $player

func _ready():
	set_physics_process(false)
	call_deferred("sync")
	
func sync():
	await get_tree().physics_frame
	set_physics_process(true)

func _physics_process(delta):
	getPlayer()

func getPlayer():
	get_tree().call_group("pop", "update_target_location", TestGlobalVar.pos)
	
