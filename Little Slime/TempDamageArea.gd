extends Area2D

onready var global = get_node("/root/global")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cooldown_timer = Timer.new()
var cooldown = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(cooldown_timer)
	cooldown_timer.connect("timeout", self, "_timeout")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _timeout():
	cooldown = false
	cooldown_timer.stop()

func _on_TempDamageArea_body_entered(body):
	print("Damaging collision detected")
	if (global.lives>=0)&&(!cooldown):
		global.lives -=1
		cooldown = true
		cooldown_timer.start(0.5)
	if(global.lives<=0):
		print("GAME OVER")
