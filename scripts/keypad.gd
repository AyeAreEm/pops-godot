extends Node3D

@onready var button0 = $button0/StaticBody3D
@onready var button1 = $button1/StaticBody3D
@onready var button2 = $button2/StaticBody3D
@onready var button3 = $button3/StaticBody3D
@onready var button4 = $button4/StaticBody3D
@onready var button5 = $button5/StaticBody3D
@onready var button6 = $button6/StaticBody3D
@onready var button7 = $button7/StaticBody3D
@onready var button8 = $button8/StaticBody3D
@onready var button9 = $button9/StaticBody3D
@onready var buttonEnter = $buttonEnter/StaticBody3D

const correct_keycode = [3, 3, 4, 4]
var entered_keycode = []

func compare_code():
	if len(correct_keycode) != len(entered_keycode): 
		entered_keycode.clear()
		return
		
	for i in range(0, len(correct_keycode)):
		if entered_keycode[i] != correct_keycode[i]:
			entered_keycode.clear()
			return
		elif i == 3:
			print("correct") 

func _on_interact_ray_interacted(collider):
	match collider:
		button0:
			entered_keycode.append(0)
		button1:
			entered_keycode.append(1)
		button2:
			entered_keycode.append(2)
		button3:
			entered_keycode.append(3)
		button4:
			entered_keycode.append(4)
		button5:
			entered_keycode.append(5)
		button6:
			entered_keycode.append(6)
		button7:
			entered_keycode.append(7)
		button8:
			entered_keycode.append(8)
		button9:
			entered_keycode.append(9)
		buttonEnter:
			compare_code()

