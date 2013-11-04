=head1 NAME

Octopussy::Web::Device - Dancer module to handle '/device/*' routes

=cut

package Octopussy::Web::Device;

use strict;
use warnings;

use Dancer ':syntax';

use Octopussy::Device;

=head1 SUBROUTINES/METHODS

=head2 POST '/device/add_service'

Route to add Service to Device 

=cut

post '/device/add_service' => sub
{
	my ($device, $service) = (params->{'device'},
        params->{'select_service'});
	my ($statistics, $compression) = 
		(lc(params->{statistics}), lc(params->{compression}));
	$statistics =~ s/d$//;
	$compression =~ s/d$//;
	# TODO user rights
	Octopussy::Device::Add_Service($device, $service);
	# TODO Simplify Set_service_Option
	Octopussy::Device::Set_Service_Option($device, $service,
            'statistics', $statistics);
	Octopussy::Device::Set_Service_Option($device, $service,
            'compression', $compression);
	redirect '/device/services/' . $device;
};

=head2 GET '/device/list'

Route to list Devices

=cut

get '/device/list' => sub
{
	template 'octopussy/device/list';
};

=head2 GET '/device/move_service/:devicename/:servicename/:direction'

Route to move Service :servicename from Device :devicename 
in direction :direction

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

Route to remove Service :servicename from Device :devicename
 
=cut

get '/device/remove_service/:devicename/:servicename' => sub
{
	my ($device, $service) = (params->{'devicename'},
        params->{'servicename'});

	# TODO user rights
	Octopussy::Device::Remove_Service($device, $service);
	redirect '/device/services/' . $device;
	#send_error("Not implemented yet !", 404);
};

=head2 GET '/device/services/:devicename'

Route to list Services from Device :devicename

=cut

get '/device/services/:devicename' => sub
{
	template 'octopussy/device/services', { device => params->{'devicename'} };
};

=head2 GET '/device/storages/:devicename'

Route to list Storages from Device :devicename

=cut

get '/device/storages/:devicename' => sub
{
	template 'octopussy/device/storages', { device => params->{'devicename'} };
};

#
# JSON Routes
#

set serializer => 'JSON';

=head2 GET '/device/json/models/:devicetype'

JSON Route to get Device Models from one :devicetype

=cut

get '/device/json/models/:devicetype' => sub
{
	my @models = Octopussy::Device::Models(params->{'devicetype'});

	return (\@models);		
};

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
