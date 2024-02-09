extends Node3D

var lerp_speed = 10.0
var emitted = false

func _on_cubefriendpurple_button_pressed():
	emitted = true

func _process(delta):
	if emitted:
		self.position.y = lerp(self.position.y, 5.0, delta * (lerp_speed / 5.0))
