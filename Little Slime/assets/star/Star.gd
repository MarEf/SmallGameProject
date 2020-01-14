extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var global = get_node("/root/global")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Star_body_entered(body):
	global.stars += 1
	self.queue_free()
