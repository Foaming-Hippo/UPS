extends Control

var labelText
var player

func _ready():
	player = get_parent()

func _on_player_update_stats():
	labelText = ""
	
	labelText += "Health: " + str(player.health)
	labelText += "\nSucculent Mails: " + str(player.mail)
	labelText += "\nMoney: " + str(player.money)
	labelText += "\nKeys:"
	for i in player.keys:
		labelText += "\n      " + str(i) + " key"
	
	$info.set_text(labelText)


func _on_player_dead():
	pass # Replace with function body.
