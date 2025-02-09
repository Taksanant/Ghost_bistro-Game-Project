extends Line2D

signal time_out;

func _decrease():
	points[1].x -= 2.5;

func _is_time_out():
	return points[1].x == 0;
	
func _on_timer_timeout():
	_decrease();
	
	if _is_time_out():
		emit_signal("time_out");
		$Timer.stop();
