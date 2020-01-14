extends Area2D

onready var global = get_node("/root/global")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TempDamageArea_body_entered(body):
	print("Damaging collision detected")
	if global.lives>0:
		global.lives -=1
	else:
		print("GAME OVER")
