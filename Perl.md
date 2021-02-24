# Perl Basics



Stored in interpreter files.  Can have `.pl` extension, but need not.  

Text file can be headed with `#!/bin/perl`

`;` terminated. 


`@` - List

`#` indicates a comment

`$` Scalar

`%` Hash, Dict, Associated list

`&` calls a subroutine.

## Types

### keywords

The `my` keyword, provides local scoping, otherwise is global?

`each`

`foreach`

`qw`, `split`, `undef`

### Scalars

`$` - Scalar

   if a number- all stored as double precision FP.

Can also be strings or characters.  A given scalar can be assigned as a number, then as a string.

`$_` is the last result returned.

`$0` is a special value that stores the program name.  Its the equiv of ARGV[0] in C/C++ but in perl its all arguments.

### Null Values

`undef` keyword- seems similar to null.

#### Comparisons 

Numbers use

>, <, >=, <=, !=, == 

Strings use

gt, lt, eq, ne, ge, le

#### Files

Check a file existance with `-e`

```pl
$my_file = "my_file.txt";
if( -e $my_file)
{
	printf "My file already exists\n";
}
else
{
	printf "My file DOES NOT exist, do something else\n";
} 
```


## @ Arrays (Lists)

A list is just an *ordered* collection of scalars separated by commas.

`'one', 'two', 'three'` or `1,2,3,4` 

To assign- store in appropriate var `@var = (1,2,3,4)`

`@` is an Array (technically a list)

`@_` is the list of arguments passed to a subroutine.

These can be accessed like arrays with `[]` and is 0 indexed.

### @ARGV

stores the input argument list.

### Commands

Can be used with `foreach (@_){};`

`each` -

### Shift, Unshift Pop and Push

To move values into and off a list from the left side use `shift` and `unshift`.

To do the same on the right side, use `push` and `pop`


`qw` quoted word operator.  Can use any delimiter, but below they use `{}` however, at least `!, [, ], #` work

```pl
my @dir_list = qw{/bin/usr,
/usr/bin,
etc};
```

Shift pushes a value off the front into a scalar:

```pl
#!/usr/bin/perl
#
#This program lists out the arguments provided on the command line.

$number = @ARGV; #count vals

printf "Number of args: $number\n";

$arg = shift @ARGV;	# initialize $arg - push off front into $arg

while($arg) #is not null?
{
	print "The argument is $arg\n";

	$arg = shift @ARGV; #iterate
}
exit 0
```

___

## % Hashes

`%` means a hash.  This is like a dictionary or an associative array.  It is just like a list, except the keys aren't 0 indexted integers, but rather any scalar (the key).

  There are keys and values.  Declared like:


```pl
%ip_addr = (
   "num1" => "val1",
   "num2" => "val2",
); # note semicolon here.

#accessed like:

my @key_results = keys %ip_addr
my @val_results = values %ip_addr
# using a scalar returns a count:
$key_count = keys %ip_addr

# can loop through values like this:

while(($keys_v, $values_v) = each %ip_addr){
   printf
}
```

You can coerce a hash to a list like `@list_type = %hash_type` which works, but order is indeterminate.

Access a value using the `{}` like  `$ENV{$name}`.  See the ENV example below.9*

`each` seems to return a list `@list` that contains a key and value pair. (?)

Or perhaps a list of all pairs. You can iterate by doing either `foreach` or in a `while` loop use `each`

The whole example: 

```pl
#!/usr/bin/perl

%ip_addresses = (
	"mac_1" => "192.168.10.1",
	"mac_2" => "192.168.10.2",
	"win_1" => "192.168.10.10",
	"unix_1" => "192.168.10.20",
	);

print $ip_addresses{"unix_1"}, "\n";

@list_keys = keys %ip_addresses;
@list_values = values %ip_addresses;

print @list_keys, "\n";
print @list_values, "\n";

foreach $system (@list_keys) {
	print $system, " ", $ip_addresses{$system}, "\n";
}

while ( ($key, $value) = each %ip_addresses) {
	print "$key = $value", "\n"
}
exit 0
```

There is a special hash for `%ENV` for the Environment variables.

Maybe PATH as well?

Using ENV:

```pl
#!/usr/bin/perl
#
# This perl script prints out the environment
@list_keys = keys %ENV;
@list_values = values %ENV;
#
# Here are two ways to do it, I've commented one out so we only see the environment once.

foreach $name (@list_keys) {
	print $name, " = ", $ENV{$name}, "\n";
}

#or 
while ( ($key, $value) = each %ENV) {
	print "$key = $value", "\n"
}

exit 0



```

## Strings

### Modification

`split()` ex. `split(\ \)`

`\` is the escape character.

printf "hash list : \"@hash_list\"";

### Print

print "Hello World"

you can just print lists:  `print @list`

If print isnt givent an argument- it prints from `$_`.

### printf


Converts scalars in place:

`printf "This prints a is $a and b is $b\n"`

Using more complicated syntax - the format with more than one argument in its list- 

the first string must be a formatting string.

here the `.` dot operator concatenates strings 

```pl
printf "List of dirs is\n" . ("%s\n" x @files), @files;

```

## IO

`<STDIN>` stores the user input. Also have `<STDOUT>` and `<STDERR>`

`chomp` removes the carriage return.

```pl
my $my_input = <STDIN>;

chomp($my_input); 

```

### Stream Operator <>

The stream operator `<>` or diamond operator takes any input stream its given as long as it has a single argument.

*/home/unix_class_notes/on-line/perl/PerlArguments*

This takes an input and prints it back out (not sure how it connects one to the other- this is an odd language.)

This is because when invoking a stream `while(<>)` it by defaults to `$_`.  If print isnt givent an argument- it prints from `$_`.

```pl
while (<>) {
	print;
}
exit 0;
```


## Control Statements

### If

```pl
$my_file = "my_file.txt";
if( -e $my_file)
{
	printf "My file already exists\n";
}
else
{
	printf "My file DOES NOT exist, do something else\n";
} 
```


### While

```pl
while(@words){
   $word = shift @words;
}

```

You can use shorthand in while statements:

```pl
while(<STDIN>){
   print $_;
}
```

### ForEach

```pl
#!/usr/bin/perl
#This program lists out the arguments provided on the command line.

$number = @ARGV;

printf "Number of args: $number\n";

foreach $arg (@ARGV)
{
	print "My argument is $arg\n";
}

exit 0
```



## Other commands

`qw` quoted word operator.  Can use any delimiter, but below they use `{}` however, at least `!, [, ], #` work

```pl
qw{/bin/usr,
/usr/bin,
etc};
```

### sub

The keyword `sub` declares a sub routine, and the symbol `&` calls it:  

The default input is `@_` that stores an argument list.  See below for how to access.


This example does not appear to pass in arguments.'

A simple `sub` example follows:

```pl
sub add {
   $_[0] + $_[1];  
}
$line_count = &add(line_count, 1);
```

This example agains make use of several defaults. `$_` as the input, here its treated as a argument list which hints at `@_`, because we use scalar access to the list.

There is no return, but by default the last statement result is returned.


#### ex 1

*/home/unix_class_notes/on-line/perl/PerlArguments/argv.pl*

```pl
#!/usr/bin/perl
# 605.414 System Development in the Unix Environment
# Test of argv code.
use warnings;

printf "Arguments:  @ARGV \n";
$number = @ARGV;

printf "Number of args: $number\n";

#We must have at least one argument. 
if (@ARGV < 1)
{
	die "ARGV is less than 1\n";
}

&parse_input(); #Calls a subroutine


#
#-------------Read Through the ARGV List------------------------
#
sub parse_input()
{
#	my $scaler;

	$scaler = shift @ARGV;
 
	while($scaler)
	{
		printf "My Scaler is $scaler\n";

		if($scaler eq "-r")
		{
			printf "Option -r Received\n";
		}
		elsif($scaler eq '-b')
		{
			printf "Option -b Received\n";
		}
		else
		{	
			die "Unrecognized Input Option\n"; 
		} 	
		$scaler = shift @ARGV;
	}
}

#Simple test if a file exists
$my_file = "my_file.txt";
if( -e $my_file)
{
	printf "My file already exists\n";
}
else
{
	printf "My file DOES NOT exist, do something else\n";
} 
```

#### ex 2

```pl 
#!/usr/bin/perl

#This is a simple example of a function with a
#variable number of parameters

$foo = 3;
$foox = 7;

sub bar {
	my $foox;

	$foox = 9;
	$foobar = 18;

	$foo = $foo + 10 * $foo;
	$foox = $foox + 10 * $foox;

	print "foo is $foo, foobar is $foobar and foox is $foox inside sub bar\n";
}
print "foo is $foo, foobar is $foobar and foox is $foox after declaration of sub bar\n";
&bar;
print "foo is $foo, foobar is $foobar and foox is $foox after execution of sub bar\n";
&bar;
print "foo is $foo, foobar is $foobar and foox is $foox after execution of sub bar\n";
```

### Checking Arguments and verbose options

/home/unix_class_notes/on-line/perl/PerlArguments/line_count

```pl
#!/usr/bin/perl

#Run this program then type in words.
#If the '-v' option is supplied, print out all
#line to standard output and then print the count.
#Otherwise, only print the count.
#
#The entire input is read into the input array.
#Then the array is processed a line at a time
#The lines are printed out, and also counted.
#The line count is displayed at the end.

$number = @ARGV;	# This gets the number of arguments

printf "Number of args: $number\n";

if ($number > 1)
{
	die("Usage: $0 [-v]\n");
}

$arg = shift @ARGV;	# get the first argument

$verbose = 0;

while($arg)
{
	print "My argument is $arg\n";

	if($arg eq "-v")
	{
		print "Option -v Received\n";
		$verbose = 1;
	}
	else
	{	
		die "Unrecognized Input Option\n"; 
	} 	
	$arg = shift @ARGV;
}

@input = <STDIN>;
chomp(@input); #remove newlines

$line_count = 0;
while(@input)
{
	$line = shift @input;
	
	if ($verbose) {
		print "This is the input: $line\n";
	}
	$line_count++;
}
print "There are $line_count lines in our input\n";
exit 0;


```


## Libraries


### GetOpt

import `require(Getopt::Std);`
then insert `use Getopt::Std;`

call `getopts("abcd:")`
this says to scan for a, b, c, and d, This provides them as `$opt_a` and so on.

#### ex1

```pl
#!/usr/bin/perl
#605.414.31
#This test uses GetOpt to read in arguments.  This is another option other than using
# @ARGV

require(Getopt::Std);
use Getopt::Std;

printf "Starting Test...\n";
getopts("brt:"); #b, r, t are expected options.

#If -b is input then $opt_b will be defined.
printf "Option b is $opt_b is b defined %d and Option R is $opt_r\n",defined $opt_b;
```