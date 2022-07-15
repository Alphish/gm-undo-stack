Overview
========

"Undo Stack" is a GameMaker library which allows easily setting up an undo/redo system. Its features include:

- tracking undoable moves, which represent one or more undoable changes
- undoing the recent moves
- redoing the recently undone moves *(note: when a new action is made, the redoable moves are forgotten)*
- setting a maximum number of remembered moves (to avoid cluttering the memory)

The package is suitable for games/applications with relatively simple changes - e.g. placing a building at a specific tile, moving a player and a block in the same move or typing a few words in a textbox. For games with lots of ongoing changes at the same time the undoing/redoing operations might become too expensive.

Installation
============

You can get the package from the [GameMaker Marketplace](https://marketplace.yoyogames.com/assets/11052/undo_stack) or from my [itch.io page](https://alphish-creature.itch.io/gm-undo-stack).

To add the Undo Stack library to your project, import both the **Packages >> Alphish >> Common** and **Packages >> Alphish >> Undo Stack** folders (the Common folder includes utility functions used within the Undo Stack code).
Within the Undo Stack folder you can find the **Alphish_UndoStack_HowTo** note which explains the Undo Stack functionality and code structure in more detail.

Additionally, you can import the **Demo** folder to see an example use case of the Undo Stack library.
You can read more about the demonstration program in the **Alphish_UndoStack_Demo** note attached to the folder.

Code examples
=============

Below are simple examples of how the actual Undo Stack code looks like.
For a more in-depth description of Undo Stack functions and code structure read the **Alphish_UndoStack_HowTo** note included with the package.
For a fully functional example, check out the Demo program.

Simple UndoableChange implementation
------------------------------------

    // generally, all undoable changes should inherit from UndoableChange() struct
    // they must implement apply() and undo() functions
    // additionally, they can implement can_apply() function
    // to filter out the impossible/irrelevant changes
    function PlayerMoveChange(player, dir) : UndoableChange() constructor {
        target_player = player;
        previous_x = target_player.x;
        previous_y = target_player.y;
        new_x = previous_x + dir.xoffset;
        new_y = previous_y + dir.yoffset;
        
        static can_apply = function() {
            // if new and previous positions are the same, ignore the change
            return previous_x != new_x || previous_y != new_y;
        }
    
        static apply = function() {
            // moving the player when the change is applied
            player.move_to(new_x, new_y);
        }
    
        static undo = function() {
            // restoring the previous value when the change is undone
            player.move_to(previous_x, previous_y);
        }
    }

Setting up the undo system
--------------------------

    // creates an instance of the undo stack controller object
    // usually, it would be placed in the Create event of some game controller object
    // NOTE: make sure not to call undo_stack_create()
    // if an instance of the undo stack controller already exists
    undo_stack_create();
    
    // limits the maximum number of stored moves to 10
    // by default, the number of stored moves is unlimited
    undo_stack_set_max_size(10);

Recording an undoable move
--------------------------

    // makes sure that all the following changes apply to a new move
    // otherwise they could apply to the previous move and performing
    // the "undo" action would undo both the new and the previous changes
    undo_stack_begin_move();
    
    // creating and applying a block position change
    var block_move_change = new BlockMoveChange(target_block, dir);
    undo_stack_apply_change(block_move_change);
    
    // creating and applying a player position change
    var player_move_change = new PlayerMoveChange(player, dir);
    undo_stack_apply_change(player_move_change);
    
    // makes sure no new changes will be appended to this move
    // this is functionally the same as undo_stack_begin_move()
    // the word "complete" just sounds more fitting
    // when the function is called *after* performing the undoable changes
    undo_stack_complete_move();

Undoing the moves
-----------------

    // undo a single move on Ctrl+Z, or all moves on Ctrl+Shift+Z
    // note: if the undo stack is limited to e.g. 10 moves
    // then undo_stack_undo_all() will undo the recent 10 moves at most
    if (keyboard_check(vk_control) && keyboard_check_pressed(ord("Z"))) {
        if (!keyboard_check(vk_shift))
            undo_stack_undo();
        else
            undo_stack_undo_all();
    }

Redoing the moves
-----------------

    // redo a single move on Ctrl+Y, or all moves on Ctrl+Shift+Y
    if (keyboard_check(vk_control) && keyboard_check_pressed(ord("Y"))) {
        if (!keyboard_check(vk_shift))
            undo_stack_redo();
        else
            undo_stack_redo_all();
    }

Disposing of the undo system
----------------------------

    // destroys the current instance of the undo stack controller object
    // usually, it would be placed in the Clean Up event of some game controller object
    undo_stack_destroy();
