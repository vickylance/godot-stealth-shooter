extends Camera2D

func _auto_set_limits():
	limit_left = 0
	limit_right = 0
	limit_bottom = 0
	limit_top = 0
	
	var tilemaps = get_tree().get_nodes_in_group("tilemap")
	for tilemap in tilemaps:
		if tilemap is TileMap:
			var used := tilemap.get_used_rect() as Rect2
			limit_left = min(used.position.x * tilemap.cell_size.x, limit_left) as int
			limit_right = max(used.end.x * tilemap.cell_size.x, limit_right) as int
			limit_bottom = max(used.end.y * tilemap.cell_size.y, limit_bottom) as int
			limit_top = min(used.position.y * tilemap.cell_size.y, limit_top) as int
