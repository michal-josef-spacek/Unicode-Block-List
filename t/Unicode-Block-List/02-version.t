use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Unicode::Block::List;

# Test.
is($Unicode::Block::List::VERSION, 0.06, 'Version.');
