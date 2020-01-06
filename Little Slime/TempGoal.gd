extends Area2D
signal reached

func _ready():
	pass 

func _process(delta):
	pass


func _on_TempGoal_body_entered(body):
	emit_signal("reached")
	print("Gongrats! You win!")
