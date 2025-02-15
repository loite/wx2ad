extends Node

#玩家属性
var player_health = 100

var score = 0

func take_damage(amount):
	player_health -= amount
	if player_health <= 0:
		game_over()

func add_score(amount):
	score += amount

func game_over():
	print("Game OVer! Final Score: ",score)
