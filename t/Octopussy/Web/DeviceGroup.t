=head1 NAME

t/Octopussy/Web/DeviceGroup.t

=head1 DESCRIPTION

Test suite for '/devicegroup/*' Dancer routes 

=cut

use strict;
use warnings;

use Dancer::Test;
use Test::More;

use lib "../../../lib";

use Octopussy::Web::DeviceGroup;

my @ROUTES = ( 
    { method => 'GET', url => '/devicegroup/list', code => '200' },
    );

require_ok('Some::Module');

foreach my $r (@ROUTES)
{
    route_exists [ $r->{method} => $r->{url} ], 
        "Dancer route for '$r->{method} $r->{url}' exists"; 
    response_status_is [ $r->{method} => $r->{url} ], $r->{code}, 
        "HTTP Response Status for '$r->{method} $r->{url}' is $r->{code}"; 
}

done_testing( 2 * scalar @ROUTES + 1 );

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut