# Pragmas.
use strict;
use warnings;

# Modules.
use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('POE::Filter::DSV');
}

# Test.
require_ok('POE::Filter::DSV');
