package Octopussy::Web::Device;

use Dancer ':syntax';

prefix '/device';

get '/list' => sub
{
	template 'octopussy/device/list';
};

get '/services/:devicename' => sub
{
	template 'octopussy/device/services', { device => params->{'devicename'} };
};

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
