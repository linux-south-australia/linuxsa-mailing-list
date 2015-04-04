#!usr/bin/perl

#=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Author: Luke Vanderfluit
# Date : 12/12/02
#
#=-=-=-=-=-=-=-=-=-=-=-=-=-=
print "#=====================#\n";
print "# THE ANAGRAM EXPRESS #\n";
print "#-=-=-=-=-=-=-=-=-=-=-#\n";
print "# type in a word of   #\n# up to 7 letters     #\n# and press Enter     #\n";
print "#-=-=-=-=-=-=-=-=-=-=-#\n\n";


#=-=-=-=-=-=-=-=-=-=-=-=-=-=
$word = <STDIN>;
chop($word); # get rid of newline
$temp = $word;

@mArr;

$len1 = 0;
while($word ne "")
{
	$d = chop($word);
	if($d ne "")
	{
		push(@mArr, $d);
		$len1++;
	}
}
@mArr = reverse(@mArr);

#################################
#################################

&cycle($len1);


sub cycle
{
	local ($len, @lArr);
	$len = $_[0]; #length of array
	@lArr = @mArr;
	if($len == 2)
	{	
		@lArr = &ifTwo(@lArr);
		print "@lArr\n";
	}
	
	if($len == 3)
	{
		@lArr = &ifThree(@lArr);
		print "@lArr\n";
	}
	if($len == 4)
	{
		@lArr = &ifFour(@lArr);
		print "@lArr\n";
	}
	if($len == 5)
	{
		@lArr = &ifFive(@lArr);
		print "@lArr\n";
	}
	if($len == 6)
	{
		@lArr = &ifSix(@lArr);
		print "@lArr\n";
	}
	if($len == 7)
	{
		@lArr = &ifSeven(@lArr);
		print "@lArr\n";
	}
}

#=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=

sub ifTwo
{
	local(@lArr);
	@lArr = @_;
	$ind = @lArr;
	print "@lArr\n";
	($lArr[$ind-2], $lArr[$ind-1]) = ($lArr[$ind-1], $lArr[$ind-2]);
	@lArr;
}

sub ifThree
{
	local(@lArr, $i);
	@lArr = @_;
	$ind = @lArr;
	@lArr = &ifTwo(@lArr);
	for($i=1; $i<3; $i++)
	{
		print "@lArr\n";
		($lArr[$ind-3], $lArr[$ind-2], $lArr[$ind-1]) = 
		($lArr[$ind-2], $lArr[$ind-3], $lArr[$ind-1]);
		@lArr = &ifTwo(@lArr);
	}
	@lArr;
}

sub ifFour
{
	local(@lArr, $i);
	@lArr = @_;
	$ind = @lArr;
	@lArr = &ifThree(@lArr);
	for($i=1; $i<4; $i++)
	{
		print "@lArr\n";
		($lArr[$ind-4], $lArr[$ind-3], $lArr[$ind-2], 
		$lArr[$ind-1]) = ($lArr[$ind-1], $lArr[$ind-4], 
		$lArr[$ind-2], $lArr[$ind-3]);
		@lArr = &ifThree(@lArr);
	}	
	@lArr;	
}

sub ifFive
{
	local(@lArr, $i);
	@lArr = @_;
	$ind = @lArr;
	@lArr = &ifFour(@lArr);
	for($i=1; $i<5; $i++)
	{
		print "@lArr\n";
		($lArr[$ind-5], $lArr[$ind-4], $lArr[$ind-3], 
		$lArr[$ind-2], $lArr[$ind-1]) = ($lArr[$ind-3], $lArr[$ind-5], 
		$lArr[$ind-1], $lArr[$ind-4], $lArr[$ind-2]);
		@lArr = &ifFour(@lArr);
	}	
	@lArr;	

}

sub ifSix
{
	local(@lArr, $i);
	@lArr = @_;
	$ind = @lArr;
	@lArr = &ifFive(@lArr);
	for($i=1; $i<6; $i++)
	{
		print "@lArr\n";
		($lArr[$ind-6], $lArr[$ind-5], $lArr[$ind-4], 
		$lArr[$ind-3], $lArr[$ind-2], $lArr[$ind-1]) = 
		($lArr[$ind-2], $lArr[$ind-6], $lArr[$ind-3], 
		$lArr[$ind-5], $lArr[$ind-1], $lArr[$ind-4]);
		@lArr = &ifFive(@lArr);
	}	
	@lArr;	
}

sub ifSeven
{
	local(@lArr, $i);
	@lArr = @_;
	$ind = @lArr;
	@lArr = &ifSix(@lArr);
	for($i=1; $i<7; $i++)
	{
		print "@lArr\n";
		($lArr[$ind-7], $lArr[$ind-6], $lArr[$ind-5], $lArr[$ind-4], 
		$lArr[$ind-3], $lArr[$ind-2], $lArr[$ind-1]) = 
		($lArr[$ind-2], $lArr[$ind-6], $lArr[$ind-3], $lArr[$ind-5], 
		$lArr[$ind-1], $lArr[$ind-4], $lArr[$ind-7]);
		@lArr = &ifSix(@lArr);
	}	
	@lArr;	
}











