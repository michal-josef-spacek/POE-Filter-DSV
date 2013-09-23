# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Barfing content to output file.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'POE-Filter-DSV';
requires 'Error::Pure' => 0.11;
requires 'Exporter' => 0;
requires 'Readonly' => 0;
requires 'Scalar::Util' => 0;
requires 'perl' => '5.6.2';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=POE-Filter-DSV';
resources 'homepage' => 'https://github.com/tupinek/POE-Filter-DSV';
resources 'repository' => 'git://github.com/tupinek/POE-Filter-DSV';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
