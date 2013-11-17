=head1 NAME

t/Octopussy/Web/User.t

=head1 DESCRIPTION

Test suite for '/user/*' Dancer routes 

=cut

use strict;
use warnings;

use Dancer::Test;
use Test::More;

use lib "../../../lib";
use Octopussy::Web::User;

my @ROUTES = ( 
    { method => 'GET', url => '/user/login', code => '200' },
    { method => 'GET', url => '/user/logout', code => '302' },
    { method => 'GET', url => '/user/preferences', code => '200' },
    );

foreach my $r (@ROUTES)
{
    route_exists [ $r->{method} => $r->{url} ], 
        "Dancer route for '$r->{method} $r->{url}' exists"; 
    response_status_is [ $r->{method} => $r->{url} ], $r->{code}, 
        "HTTP Response Status for '$r->{method} $r->{url}' is $r->{code}"; 
}

#$response = dancer_response(POST => '/user/login', 
#    { login => 'admin', password => 'admin' });
#my $response = dancer_response(POST => '/user/login', 
#    { login => 'wrong_login', password => 'wrong_password' });
#like $response->{content}, qr/Invalid Login or Password/,
#    'Unable to login with wrong login/password';

done_testing( 2 * scalar @ROUTES );

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut