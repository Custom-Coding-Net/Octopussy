=head1 NAME

Octopussy::Web::Device

=cut

package Octopussy::Web::Device;

use strict;
use warnings;

use Dancer ':syntax';

use Octopussy::Device;

=head1 SUBROUTINES/METHODS

=head2 GET '/device/list'

=cut

get '/device/list' => sub
{
	template 'octopussy/device/list';
};

=head2 GET '/device/move_service/:devicename/:servicename/:direction'

=cut

get '/device/move_service/:devicename/:servicename/:direction' => sub
{
	my ($device, $service, $direction) = (params->{'devicename'},
		params->{'servicename'}, params->{'direction'});

	# TODO user rights
	Octopussy::Device::Move_Service($device, $service, $direction);
	redirect '/device/services/' . $device;
	#send_error("Not implemented yet !", 404);
};

=head2 GET '/device/remove_service/:devicename/:servicename'

=cut

get '/device/remove_service/:devicename/:servicename' => sub
{
	my ($device, $service, $direction) = (params->{'devicename'},
        params->{'servicename'});

	# TODO user rights
	Octopussy::Device::Remove_Service($device, $service);
	redirect '/device/services/' . $device;
	#send_error("Not implemented yet !", 404);
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
