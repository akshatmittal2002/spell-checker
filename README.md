# Spell Checker
This is a perl script that checks for spelling errors in the entered text.<br>
Comparisions are made with the small dictionary; more words can be added using `Add To Dictionary` option.
***
<br>

To run the script, first install a perl library that is necessary for script using this command:
```bash
sudo apt install libtext-levenshtein-perl
```
After successfully installing this library, run the script using:
```bash
perl main.pl
```
Now enter the  text and follow the process.
***
<br>

### Note:
1. Please install the afore mentioned perl library, otherwise the program will generate error message.
2. Current word being checked will be displayed in `RED` color and checked words will be displayed in `GREEN` color.
3. In a `Y/N` input, only `Y` or `y` will be considered as `Yes`, rest all inputs will be treated as `No`.
4. Initially, the dictionary cotains set of `LINUX Commands` only, hence regular english words will be shown as mis-spelled.<br>You can add such word to dictionary using `Add To Dictionary` option while progran is running.
***
<br>

### A Brief Description:
1. Upon execution of the perl script, user will be asked to enter the text till he press `Enter` key.
2. Then all words of the input will undego spell check using `Edit Distance Algorithm`.
3. If a word is found in dictionary, process moves to next word.
4. If not, then all words having edit distance of `1 unit` are given as suggestions to the user.
5. If no word in dictionary has an edit distance of 1 unit, then words having edit distance of `2 units` are given as suggestions.
6. There is also an option at end to add that word into the dictionary.
7. Then user will be asked whether or not he wants to change the word with given suggestion.
8. If `Y` or `y` is given, user will be asked to enter suggestion number and word will be replaced with corresponding suggestion.
9. Any else response will move the process to next word.
***