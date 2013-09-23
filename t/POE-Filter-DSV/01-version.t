# Pragmas.
use strict;
use warnings;

# Modules.
use POE::Filter::DSV;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($POE::Filter::DSV::VERSION, 0.01, 'Version.');
