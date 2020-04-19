extends Area2D

export var max_distance := 0.0
export var lifetime := 0.0
export var speed := 1000
export var damage := 300

var velocity := Vector2.ZERO
var startPos := Vector2.ZERO

func start(_position: Vector2, _direction: float) -> void:
	self.position = _position
	self.rotation = _direction + PI/2
	$Lifetime.wait_time = lifetime
	velocity = Vector2(speed, 0).rotated(_direction)

func _ready():
	startPos = get_global_position()

func _physics_process(delta: float) -> void:
	var currentPos: Vector2 = get_global_position()
	var distance: float = (currentPos - startPos).length()
	position += velocity * delta
	
	# destroy bullet if max distance is set and reached
	if(max_distance > 0):
		if(distance >= max_distance):
			queue_free()


func _on_Lifetime_timeout():
	pass # Replace with function body.
