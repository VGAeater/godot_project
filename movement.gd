extends CharacterBody2D

@export var speed = 400

var state = 0

var time_start = 0

func _ready():
	time_start = Time.get_ticks_msec()

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	if state != 6:
		get_input()
		move_and_slide()
		$Sprite2D.texture = ResourceLoader.load("res://hourglass_" + str(state + int(max(min(fmod(float(Time.get_ticks_msec())/10.0, 100.0)-70, 1), 0))) + ".png")

func _input(event):
	if event.is_action_pressed("click"):
		state = min(state + 2, 6);
		$Sprite2D.texture = ResourceLoader.load("res://hourglass_" + str(state) + ".png")
