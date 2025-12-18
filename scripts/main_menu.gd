extends Control

@onready var music_player = $MusicPlayer
@onready var credits_window = $CreditsWindow

func _ready():
    credits_window.hide()
func _on_credits_button_pressed():
    print("Credits button was pressed")
    credits_window.popup_centered()
func _on_close_button_pressed():
    credits_window.hide()
func _on_quit_button_pressed():
    get_tree().quit()
func _on_start_button_pressed():
    get_tree().change_scene_to_file("res://scenes/howto_play.tscn")
