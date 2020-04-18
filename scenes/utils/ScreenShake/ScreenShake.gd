extends Node

export (Enum.TransitionType) var TRANSITION := Tween.TRANS_SINE
export (Enum.Easing) var EASING := Tween.EASE_IN_OUT

var amplitude := 0
var priority := 0

onready var camera := get_parent() as Camera2D
onready var Duration := $Duration as Timer
onready var Frequency := $Frequency as Timer
onready var ShakeTween := $ShakeTween as Tween

func start_shake(duration: float = 0.2, frequency: float = 15, amplitude: float = 16, priority: float = 0):
	if priority >= self.priority:
		self.priority = priority
		self.amplitude = amplitude
		
		Duration.wait_time = duration
		Frequency.wait_time = 1 / float(frequency)
		Duration.start()
		Frequency.start()
		
		_new_shake()

func _new_shake() -> void:
	randomize()
	var rand := Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)
	
	ShakeTween.interpolate_property(camera, "offset", camera.offset, rand, Frequency.wait_time, TRANSITION, EASING)
	ShakeTween.start()

func _reset() -> void:
	ShakeTween.interpolate_property(camera, "offset", camera.offset, Vector2(), Frequency.wait_time, TRANSITION, EASING)
	ShakeTween.start()
	priority = 0

func _on_Frequency_timeout():
	_new_shake()

func _on_Duration_timeout():
	_reset()
	Frequency.stop()
