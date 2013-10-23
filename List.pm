package Unicode::Block::List;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);
use Unicode::Block;
use Unicode::UCD qw(charblock charblocks);

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Process parameters.
	set_params($self, @params);

	# Object.
	return $self;
}

# Get block.
sub block {
	my ($self, $block) = @_;
	my $charblock_ar = charblock($block);
	if (ref $charblock_ar ne 'ARRAY' || ! @{$charblock_ar}) {
		return;
	}
	my $char_from = sprintf '%04x', $charblock_ar->[0]->[0];
	my $char_to = sprintf '%04x', $charblock_ar->[0]->[1];
	return Unicode::Block->new(
		'title' => $charblock_ar->[0]->[2],
		'char_from' => $char_from,
		'char_to' => $char_to,
	);
}

# Get list of blocks.
sub list {
	my $self = shift;
	my $charblocks_hr = charblocks();
	return sort keys %{$charblocks_hr};
}

1;
