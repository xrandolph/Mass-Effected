extends CharacterBody2D

@export var speed: = 180
@export var jump_force: = -400
@export var gravity: = 1000
@export var climb_speed: = 100

var on_ladder: = false

func _physics_process(delta):

    if not is_on_floor():
        velocity.y += gravity * delta


    var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    velocity.x = direction * speed


    if is_on_floor():
        if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("jump"):
            velocity.y = jump_force
    if on_ladder:
        velocity.y = 0
        var climb_input: = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
        velocity.y = climb_input * climb_speed
        velocity.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed
    else:
        if not is_on_floor():
            velocity.y += gravity * delta
        if is_on_floor() and (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("jump")):
            velocity.y = jump_force
        velocity.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed


    move_and_slide()
func _on_ladder_area_entered(area):
    if area.name == "ladder":
        on_ladder = true

func _on_ladder_area_exited(area):
    if area.name == "ladder":
        on_ladder = false

func _on_ladder_body_entered(body: Node2D):
    if body == self:
        on_ladder = true

func _on_ladder_body_exited(body: Node2D):
    if body == self:
        on_ladder = false
