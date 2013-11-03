=head1 NAME

t/Octopussy/Web/Device.t

=head1 DESCRIPTION

Test suite for '/device/*' Dancer routes 

=cut

use strict;
use warnings;

use Dancer::Test;
use Test::More;

use lib "../../../lib";
use Octopussy::Web::Device;

my @ROUTES = ( 
	{ method => 'GET', url => '/device/list', code => '200' },
	{ method => 'GET', 
		url => '/device/move_service/devicename/servicename/bottom', code => '302' },
	{ method => 'GET', 
        url => '/device/move_service/devicename/servicename/down', code => '302' },
	{ method => 'GET', 
        url => '/device/move_service/devicename/servicename/top', code => '302' },
	{ method => 'GET', 
        url => '/device/move_service/devicename/servicename/up', code => '302' },
	{ method => 'GET', url => '/device/remove_service/devicename/servicename', code => '200' },
	{ method => 'GET', url => '/device/services/devicename', code => '200' },
	{ method => 'GET', url => '/device/storages/devicename', code => '200' },
	);

foreach my $r (@ROUTES)
{
	route_exists [ $r->{method} => $r->{url} ], 
		"Dancer route for '$r->{method} $r->{url}' exists";	
	response_status_is [ $r->{method} => $r->{url} ], $r->{code}, 
		"HTTP Response Status for '$r->{method} $r->{url}' is $r->{code}"; 
}

done_testing( 2 * scalar @ROUTES );

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
