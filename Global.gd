extends Node

var isMobile := false
var isDesktop := false

var joystickConnected = false

func _ready() -> void:
	check_device()
	if not Input.connect("joy_connection_changed", self, "_on_joy_connection_changed"):
		print("joystick signal connection failed")

func check_device() -> void:
	var name := OS.get_name()
	if name == "Android" or name == "BlackBerry 10" or name == "iOS":
		isMobile = true
	elif name == "OSX" or name == "Windows" or name == "WinRT" or name == "X11":
		isDesktop = true

func _on_joy_connection_changed(device_id: int, connected: bool) -> void:
	if connected:
		print(Input.get_joy_name(device_id))
		joystickConnected = true
	else:
		print("Keyboard")
		joystickConnected = false
