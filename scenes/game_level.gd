extends Node2D

@onready var score_label = $UI / ScoreLabel
@onready var timer_label = $UI / LevelTimer
@onready var lives_container = $UI / LivesContainer
@onready var player = $Player
@onready var level_timer = $LevelTimerNode
@onready var music_player = $MusicPlayer

@export var coins_to_win: = 5
@export var time_limit: = 120
@export var max_lives: = 3

var lives = 3
var time_left = 0.0
var game_won = false
var game_lost = false

func _ready():
    Global.score = 0
    time_left = time_limit
    lives = max_lives
    update_lives_ui()
    update_score_ui()
    update_timer_ui()
    if music_player:
        music_player.play()
    level_timer.start()

func _process(delta):
    if game_won or game_lost:
        return

    time_left -= delta
    update_timer_ui()
    update_score_ui()

    if time_left <= 0:
        handle_lose()

    if Global.score >= coins_to_win:
        handle_win()

    if player.global_position.y > 800:
        lose_life()

func update_score_ui():
    score_label.text = "Score: %d" % Global.score

func update_timer_ui():
    timer_label.text = "Time: %.1f" % max(time_left, 0)

func update_lives_ui():
    for i in range(3):
        var icon = lives_container.get_child(i)
        icon.visible = i < lives

func lose_life():
    lives -= 1
    update_lives_ui()
    if lives > 0:
        respawn_player()
    else:
        handle_lose()

func respawn_player():
    player.global_position = Vector2(-234.0, 551)
    player.velocity = Vector2.ZERO

func handle_win():
    if game_lost: return
    game_won = true
    get_tree().change_scene_to_file("res://scenes/win_game.tscn")

func handle_lose():
    if game_won: return
    game_lost = true
    get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")
