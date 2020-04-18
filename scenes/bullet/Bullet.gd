extends Area2D

export var max_distance := 0.0
export var lifetime := 0.0
export var speed := 300
export var damage := 300

var velocity := Vector2.ZERO
var startPos := Vector2.ZERO

func start(_position: Vector2, _direction: Vector2) -> void:
	self.position = _position
	self.rotation = _direction.angle()
	$Lifetime.wait_time = lifetime
	velocity = _direction * speed

func _ready():
	startPos = get_global_position()

func _physics_process(delta: float) -> void:
	var currentPos: Vector2 = get_global_position()
	var distance: float = (currentPos - startPos).length()
	
	# destroy bullet if max distance is set and reached
	if(max_distance > 0):
		if(distance >= max_distance):
			queue_free()
