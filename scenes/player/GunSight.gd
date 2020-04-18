extends RayCast2D

onready var laserSight := $LaserDot as Line2D

func _process(_delta: float) -> void:
	var endPoint := laserSight.get_point_position(1) as Vector2
	if is_colliding():
		endPoint.x = get_global_position().distance_to(get_collision_point())
	else:
		endPoint.x = cast_to.x
	laserSight.set_point_position(1, endPoint)
