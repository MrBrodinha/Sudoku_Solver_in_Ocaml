Sudoku_in_Ocaml
[my english sucks, so if you want to correct me on some things pls do :)]
[the code on the program is in Portuguese, i could translate it later but not now]

Hey!
I'm an ubi student and trying to improve my programming skills by making this simple sudoku :)!

This sudoku is not your typpical sudoku where you fill the blank spaces and solve the sudoku, this one you give a half solved sudoku/not solved/somewhat solved/Etc sudoku puzzle and this program tries to solve the rest for you :)

There is some nasty stuff on this code, but let me clarify that this was my first year programming and you could say im still learning the basics

I coded in ocaml because thats one of the only languages i know (the other being C)

If you have any way of improving this code i will consider, but only if you try to explain the code so i know what im doing

Anyways, this simple code uses a kind of system called "backtracking", where it fills the blank spaces and if something goes wrong it "back tracks" to where the error started

Im still doing things to the code since its not working 100% as i want

Anyways, the way this program works is just:
- Put the size of the table (4, 9 is working fine and as intended, after that im still making chances)
- if you put lets say, size 9 you need to make a line of 9 numbers, if you want a space to be an empty space use 0, so for example, if you want a line with the numbers 9 _ 6 | _ _ _ | 1 _ 2 you should insert on the terminal "9 0 6 0 0 0 1 0 2"

You should do this for the 9 lines, or 4 if you choose 4, or 16, etc...
