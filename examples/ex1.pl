#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Encode qw(encode_utf8);
use Unicode::Block::Ascii;
use Unicode::Block::List;

# Arguments.
if (@ARGV < 1) {
        print STDERR "Usage: $0 block_name\n";
        exit 1;
}
my $block_name = $ARGV[0];

# Object.
my $obj = Unicode::Block::List->new;

# Get Unicode::Block for block name.
my $block = $obj->block($block_name);
if (! $block) {
        print "Block '$block_name' doesn't exist.\n";
        exit 1;
}

# Get ASCII object.
my $block_ascii = Unicode::Block::Ascii->new(%{$block});

# Print to output.
print encode_utf8($block_ascii->get)."\n";

# Output:
# Usage: /tmp/o1NG0vm_Wf block_name

# Output with 'Block Elements' argument:
# ┌────────────────────────────────────────┐
# │             Block Elements             │
# ├────────┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┤
# │        │0│1│2│3│4│5│6│7│8│9│A│B│C│D│E│F│
# ├────────┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┤
# │ U+258x │▀│▁│▂│▃│▄│▅│▆│▇│█│▉│▊│▋│▌│▍│▎│▏│
# ├────────┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┤
# │ U+259x │▐│░│▒│▓│▔│▕│▖│▗│▘│▙│▚│▛│▜│▝│▞│▟│
# └────────┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┘

# Output with 'foo' argument:
# Block 'foo' doesn't exist.