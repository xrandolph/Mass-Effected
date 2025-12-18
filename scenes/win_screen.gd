extends Control

func _on_restart_button_pressed() -> void :

    get_tree().change_scene_to_file("res://scenes/game_level.tscn")

func _on_return_button_pressed() -> void :

    get_tree().change_scene_to_file("res://scenes/Main Menu.tscn")

func _on_quit_button_pressed() -> void :

    get_tree().quit()
