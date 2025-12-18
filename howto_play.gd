extends Control

@onready var countdown_label = $CountdownLabel
@onready var countdown_timer = $CountdownTimer

var time_left: = 5

func _ready():
    countdown_label.text = "Game starts in: %d" % time_left

func _on_countdown_timer_timeout():
    time_left -= 1
    if time_left > 0:
        countdown_label.text = "Game starts in: %d" % time_left
    else:
        countdown_timer.stop()
        get_tree().change_scene_to_file("res://scenes/game_level.tscn")
