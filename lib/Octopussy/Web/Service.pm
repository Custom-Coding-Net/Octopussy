=head1 NAME

Octopussy::Web::Service - Dancer module to handle '/service/*' routes

=cut

package Octopussy::Web::Service;

use strict;
use warnings;

use Dancer ':syntax';

use Octopussy::Service;

=head1 SUBROUTINES/METHODS

=head2 GET '/service/list'

Route to list Services

=cut

get '/service/list' => sub
{
	template 'octopussy/service/list';
};

=head2 GET '/service/messages/:servicename'

Route to list Messages from Service :servicename
=cut

get '/service/edit/:servicename' => sub
{
	template 'octopussy/service/edit', { service => params->{'servicename'} };
};

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
