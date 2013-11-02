=head1 NAME

Octopussy::Web::Device

=cut

package Octopussy::Web::Device;

use strict;
use warnings;

use Dancer ':syntax';

=head1 SUBROUTINES/METHODS

=head2 GET '/device/list'

=cut

get '/device/list' => sub
{
	template 'octopussy/device/list';
};

=head2 GET '/device/services/:devicename'

=cut

get '/device/services/:devicename' => sub
{
	template 'octopussy/device/services', { device => params->{'devicename'} };
};

=head2 GET '/device/storages/:devicename'

=cut

get '/device/storages/:devicename' => sub
{
	template 'octopussy/device/storages', { device => params->{'devicename'} };
};

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
