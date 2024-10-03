#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;
use File::Path qw(make_path);
use File::Basename;
use Getopt::Long;
use Pod::Usage;

# Variables for command line options
my $input_dir;
my $output_dir;
my $help;

# Get command line options
GetOptions(
    'input=s'  => \$input_dir,
    'output=s' => \$output_dir,
    'help'     => \$help,
) or pod2usage(2);

# Display help message if requested
pod2usage(1) if $help;

# Validate input directory
unless (-d $input_dir) {
    die "Input directory '$input_dir' does not exist.\n";
}

# Validate or create output directory
if (-e $output_dir) {
    if (!-d $output_dir) {
        die "Output path '$output_dir' exists but is not a directory.\n";
    } elsif (glob("$output_dir/*")) {
        die "Output directory '$output_dir' is not empty.\n";
    }
} else {
    make_path($output_dir) or die "Failed to create output directory '$output_dir': $!\n";
}

# Function to copy files
sub copy_files {
    my ($src, $dest) = @_;
    opendir(my $dh, $src) or die "Cannot open directory '$src': $!\n";
    while (my $entry = readdir($dh)) {
        next if $entry =~ /^\.\.?$/; # Skip . and ..
        my $src_path = "$src/$entry";
        my $dest_path = "$dest/$entry";
        if (-d $src_path) {
            make_path($dest_path) or die "Failed to create directory '$dest_path': $!\n";
            copy_files($src_path, $dest_path);
        } else {
            if ($entry =~ /\.(md|sql)$/) {
                open(my $in, '<', $src_path) or die "Cannot open file '$src_path': $!\n";
                open(my $out, '>', $dest_path) or die "Cannot open file '$dest_path': $!\n";
                while (my $line = <$in>) {
                    print $out $line;
                }
                close($in);
                close($out);
            } else {
                copy($src_path, $dest_path) or die "Failed to copy file '$src_path' to '$dest_path': $!\n";
            }
        }
    }
    closedir($dh);
}

# Start copying files
copy_files($input_dir, $output_dir);

__END__

=head1 NAME

copy_tree - Copy directory tree structure and files

=head1 SYNOPSIS

copy_tree.pl --input INPUT_DIR --output OUTPUT_DIR [--help]

=head1 OPTIONS

=over 8

=item B<--input>

Input directory to copy from.

=item B<--output>

Output directory to copy to.

=item B<--help>

Print this help message.

=back

=head1 DESCRIPTION

This script copies the directory tree structure from the input directory to the output directory. It copies markdown (.md) and SQL (.sql) files line by line, and other files as binary.

=cut
