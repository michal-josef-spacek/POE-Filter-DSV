package POE::Filter::DSV;

# Pragmas.
use base qw(POE::Filter);
use strict;
use warnings;

# Modules.
use Error::Pure qw(err);
use Text::DSV;

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my $class = shift;

	# Object.
	my $self = bless {}, $class;

	$self->{'BUFFER'} = [];
	$self->{'dsv_filter'} = Text::DSV->new;
	
	return $self;
}

# Get.
sub get {
	my ($self, $raw_ar) = @_;
	my @events;
	foreach my $event (@{$raw_ar}) {
		push @events, [$self->{'dsv_filter'}->parse_line($event)];
	}
	return \@events;
}

sub get_one_start {
	my ($self, $raw_ar) = @_;
	foreach my $raw (@{$raw_ar}) {
		push @{$self->{'BUFFER'}}, $raw;
	}
	return;
}

sub get_one {
	my $self = shift;
	my $one = shift @{$self->{'BUFFER'}};
	return $self->get([$one]);
}

# Put.
sub put {
	my ($self, $events_ar) = @_;
	my @raw_lines;
	foreach my $event_ar (@{$events_ar}) {
		if (ref $event_ar eq 'ARRAY') {
			push @raw_lines, $self->{'dsv_filter'}
				->serialize_line(@{$event_ar});
		} else {
			err 'Bad event structure.';
		}
	}
	return \@raw_lines;
}

1;
