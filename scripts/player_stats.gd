extends RichTextLabel

var keys
var mail
var health
var money

# Called when the node enters the scene tree for the first time.
func _ready():
	money = 0
	keys = []
	mail = 0
	print_label()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print_label()


func add_key(key):
	keys.append(key)
	
func add_mail(amt):
	mail += amt

func set_health(val):
	health = val
	if health > 100:
		health = 100
		
func add_money(dollar):
	money += dollar
	

func print_label():
	var labelText = ""
	
	labelText += "Health: " + str(health)
	labelText += "\nSucculent Mails: " + str(mail)
	labelText += "\nMoney: " + str(money)
	labelText += "\nKeys:"
	for i in keys:
		labelText += "\n      " + i + " key"
	
	set_text(labelText)
