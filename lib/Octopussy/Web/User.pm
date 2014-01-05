=head1 NAME

Octopussy::Web::User

=cut

package Octopussy::Web::User;

use strict;
use warnings;

use Dancer ':syntax';

=head1 SUBROUTINES/METHODS

=head2 GET|POST '/user/login'

User login route

=cut

any ['get', 'post'] => '/user/login' => sub
{
	if (request->method() eq "POST") 
	{
		if (params->{'login'} eq 'admin' && params->{'password'} eq 'admin')
		{	# login successfull
			session octopussy_user => params->{login};
			session octopussy_user_firstname => 'Sébastien';
			session octopussy_user_lastname => 'Thébert';
			session octopussy_language => 'fr';
			session octopussy_role => 'admin';
			redirect '/';
		}
		else
		{	# login failed
			var msg_error => 'Invalid Login or Password !';
		}
	}
	
	template 'octopussy/user/login', 
		{ login => params->{'login'}, password => params->{'password'} }, 
		{ layout => 'login_page.tt' };
};

=head2 GET '/user/logout'

User logout route

=cut

get '/user/logout' => sub
{
	session->destroy;
	redirect '/user/login';
};

=head2 GET|POST '/user/preferences'

User Preferences route

=cut

any ['get', 'post'] => '/user/preferences' => sub
{
	template 'octopussy/user/preferences';
};

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
