extends RichTextLabel

var keys
var money
var health

# Called when the node enters the scene tree for the first time.
func _ready():
	keys = []
	money = 0
	print_label()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print_label()


func add_key(key):
	keys.append(key)
	
func add_money(amt):
	money += amt

func set_health(val):
	health = val
	if health > 100:
		health = 100
	

func print_label():
	var labelText = ""
	
	labelText += "Health: " + str(health)
	labelText += "\nSucculent Mails: " + str(money)
	labelText += "\nKeys:"
	for i in keys:
		labelText += "\n      " + i + " key"
	
	set_text(labelText)
