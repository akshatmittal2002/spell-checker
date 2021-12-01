Name			: Akshat Mittal
Roll No.		: 200101011
Assignment No.		: 3
Operating System	: LINUX
===================================================================================================
Files present inside zip folder:
	1. Task 1:
		a. makefile
		b. 200101011_Assign03_Q1.c
	2. Task 2:
		a. 200101011_Assign03_Q2.sh
	3. Task 3:
		a. 200101011_Assign03_Q3.pl
		b. my_dictionary.txt
	4. Readme.txt

===================================================================================================
For first task, run this command to execute the makefile and set the environment variable:
		
	make VAR=[env_var_name] SET=[Y for yes/ N for No] VAL=[value to be set]
	
For example:
	1. To set value of USER to "xyz" use:		make VAR=USER SET=Y VAL=xyz
	2. To use existing value of USER, use:	make VAR=USER SET=N
		
Points to be noted:
	1. I am using read command inside makefile to take input from user but user can give inline arguments as well.
	2. If a user fails to give the inline arguments in the correct format or doesn't give them at all, then he will be asked to re-enter them.
	3. If user enters an environment variable which is not pre-defined, I am giving an option to set that as a new environment variable or skip it.
	4. In a Y/N input, only "Y" or "y" will be considered as "Yes", rest all inputs will be treated as "No".

A brief overview of the process:
	1. Upon entering the above command, user will be asked to enter name of environment variable (if not given as inline argument), which is case-sensitive.
	2. Then user will be asked whether he wants to modify the value of that environment variable or not (if not given as inline argument).
	3. In case of "No", old value of variable will be printed if it exists, else an error would be displayed.
	   In case of "Yes", user will be asked to enter the new value of that variable (if not given as inline argument).
	4. If environment variable exists, its value will be set to new value, else user will be asked whether to create this variable as new environment variable or not.
	5. In case of "Yes", it will be cteated as new environment variable with the specified value.
	6. At end, name of environment value along with it's old/new value will be printed (if that environment variable exists or has been set).

===================================================================================================
For second task, run this command with given syntax to use "tar" command:

	bash -f 200101011_Assign03_Q2.sh [options-of-tar] [archive-file] [files-to-be-archived]

Available options as mentioned in study material:
	c	: create an archive
	r	: append files at the rear end of an existing archive
	t	: list table of contents
	x	: extract individual contents
	f	: file to be created within a file system
	f-	: write/read from standard output/input
	v	: verbose mode, give details of archive information
	
Points to be noted:
	1. As confirmed from professor, the "-f" option will be given always, since absence of "-f" option will create archive file on tape, which is to be avoided.
	   Hence, in my program, if "-f" is not given, an error would be displayed.
	2. Also, as per original "tar" command, exactly one of "-crxt" option should be given. So, same is been implemented in my program also.
	3. Hence, all possible options are:
			-cvf	-rvf	-tvf	-xvf
			-cf	-rf	-tf	-xf
	   Any other combination would display error message as in "tar" command.
	4. Files created using some other means or by using inbuilt "tar" command can not be modified by my shell script. Only the archives created using my script can be extracted/appended.
	5. MOST IMPORTANT: My program handles archiving of only text files (i.e., .txt , .sh , .c , .pl etc.).
	   If user tries to archive other files like .mp4, then achive file will be created successfully but if user extracts that file, extracted file will be corrupted.

===================================================================================================
For third task, please install a perl library before running my program using:

	sudo apt install libtext-levenshtein-perl

After successfully installing the afore mentioned library, run my program using:

	perl 200101011_Assign03_Q3.pl
	
A brief overview of the process:
	1. Upon execution of the perl script, user will be asked to enter the text till he press enter.
	2. Then all words of the input will undego spell check using edit distance algorithm.
	3. If a word is found in dictionary, process moves to next word.
	4. If not, then all words having edit distance of 1 unit are given as suggestions to the user.
	5. If no word in dictionary has an edit distance of 1 unit, then words having edit distance of 2 units are given as suggestions.
	6. There is also an option at end to add that word into the dictionary.
	7. Then user will be asked whether or not he wants to change the word with given suggestion.
	8. If "Y" or "y" is given, user will be asked to enter suggestion number and word will be replaced with corresponding suggestion.
	9. Any else response will move the process to next word.
	
Points to be noted:
	1. Please install the afore-mentioned perl library, otherwise the program will generate error message.
	2. Current word being checked will be displayed in RED color and checked words will be displayed in GREEN color.
	3. In a Y/N input, only "Y" or "y" will be considered as "Yes", rest all inputs will be treated as "No".
	4. Initially, the dictionary cotains set of LINUX commands only, hence regular english words will be shown as mis-spelled.
	   But u can always add such word to dictionary using the option during progran is running.
	   
===================================================================================================