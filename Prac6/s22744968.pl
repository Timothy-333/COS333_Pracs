#!/usr/bin/perl
# Perl 5
if (@ARGV != 2) {
    print "Usage: perl script.pl <filename> <word>\n";
    exit(1);
}

my ($filename, $word) = @ARGV;

# Read the file
my $content = do {
    open my $fh, '<', $filename or die "Could not open '$filename' $!\n";
    local $/;
    <$fh>
};

# Convert to lowercase and remove non-alphabetic characters
$content = lc $content;
$content =~ s/[^a-z]//g;

# Reverse the string
print "Content: $content\n";
$content = reverse $content;

# Count the occurrences of the word
my $count = () = $content =~ /\Q$word\E/g;

# Output the count
print "Matches: $count\n";