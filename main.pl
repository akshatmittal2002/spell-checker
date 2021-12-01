#! usr/bin/perl

#Using Levenshtein library to use the edit distance function directly from there.
use Text::Levenshtein qw(distance);
use Term::ANSIColor qw(:constants);

#Storing the command to clear terminal screen.
my $clear = `clear`;

#Open dictionary file.
#If can'gt be opened, display error message.
open(file_ptr,"<my_dictionary.txt") or die "ERROR: Could not open dictionary";

#Declare an array to store all dictionary words.
my @my_words = qw();

#Take input line by line from the file till the end and push that word into the array of dictionary words.
while(<file_ptr>)
{
	#chomp just removes the new line chararcter from end of input.
	chomp $_;
	#Push into array.
	push(@my_words,$_);
}

#close the dictionary.
close(file_ptr);

#Now open back with append mode to insert new words if user choose add to dictionary option.
open(file_ptr,">>my_dictionary.txt") or die "ERROR: Could not open dictionary";

#Prompt user to enter the text.
print("\nEnter Text: ");

my $user_input = <STDIN>;
#Remove new line character.
chomp $user_input;

#Split the user input into multiple words and store all words into an array.
my @input_array = split(" ",$user_input);

#Check each word of input for typos.
for($i=0; $i<@input_array; $i++)
{
	#Clear the screen and print current text.
	print $clear;
	print("\nCurrent text:");
	for($j=0; $j<@input_array; $j++)
	{
		#All words before current word in green.
		if($j < $i)
		{
			print GREEN BOLD, " $input_array[$j]", RESET;
		}
		#current word in red.
		elsif($j == $i)
		{
			print RED BOLD, " $input_array[$j]", RESET;
		}
		#Rest all as usaul.
		else
		{
			print BOLD " $input_array[$j]", RESET;
		}
	}
	print("\n\n");	
	
	#Store current word in a variable.
	my $word = $input_array[$i];
	#Create an array to store all possible words with edit distance 1.
	my @distance_1 = qw();
	#Create an array to store all possible words with edit distance 2.
	my @distance_2 = qw();
	#Create variable to check whether current word is present in dictionary or not.
	my $found = "false";
	
	#For every word of dictionaty, calculate edit distance with current word of input.
	for($j=0; $j<@my_words; $j++)
	{
		my $edit_distance = distance($word, $my_words[$j]);
		#If edit distance is zero, make found as true and break the loop.
		if($edit_distance == 0)
		{
			$found = "true";
			last;
		}
		# If edit distance is 1, push the dictionary word into array 1.
		elsif($edit_distance == 1)
		{
			push(@distance_1,$my_words[$j]);
		}
		# If edit distance is 2, push the dictionary word into array 2.
		elsif($edit_distance == 2)
		{
			push(@distance_2,$my_words[$j]);
		}
	}
	
	#Now if found is not true, i.e., false, then give suggestions.
	#Else check next input word.
	if($found ne "true")
	{
		#make suggestion list equal to all words having edit distance 1.
		my @suggestions_list = @distance_1;
		#Now if there are no such word, i.e., distance 1 array is empty, make suggestion list of words having distance 2.
		if(@distance_1 == 0)
		{
			@suggestions_list = @distance_2;
		}
		my $j = 1;
		
		#Print the message that this word is not found in dictionary and print all suggestions.
		print("\"$word\" not found in dictionary. Possible suggestions:\n");
		
		#Print suggestion list with their number.
		foreach $suggest (@suggestions_list)
		{
			print("\t$j. $suggest\n");
			$j++;
		}
		#After all suggestions, add the option to add this word to dictionary.
		print("\t$j. Add \"$word\" to dictionary.\n\n");
		
		#Now ask user, whether to replace the input word with any of given suggestion.
		print("Would you like to replace the word with any of the given suggestion or add it to dictionary? (Y/N): ");
		#Take input
		my $option = <STDIN>;
		chomp $option;
		
		#If user says yes, then ask for suggestion number.
		#Else go to next input word.
		if(($option eq "Y") || ($option eq "y"))
		{
			#Ask for suggestion number.
			print("Enter suggestion number: ");
			#Take input
			my $suggest_number = <STDIN> + 0;
			#Now if user inputs an invalid number out of range, print error.
			while(1)
			{
				if(($suggest_number >= 1) && ($suggest_number <= $j))
				{
					last;
				}
				print("INVALID\nEnter valid suggestion number: ");
				$suggest_number = <STDIN> + 0;
			}
			
			#If user enters 'j', i.e., add this word to dictionary, then print that word into the dictionary file.
			if($suggest_number == $j)
			{
				print file_ptr ("$word\n");
				push(@my_words,$word);
			}
			#Else replace the input word with that suggestion and go to next word.
			else
			{
				$input_array[$i] = $suggestions_list[$suggest_number-1];
			}
		}
	}
}

#After checking all words, clear screen and print final text.
print $clear;
print("\nAll conflicts resolved.\n\nFinal text:");
foreach $word (@input_array)
{
	print GREEN BOLD,(" $word"),RESET;
}
print("\n\n");

#Close the file.
close(file_ptr);