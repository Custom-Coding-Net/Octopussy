package Octopussy::Web;

use Dancer ':syntax';

#before_template sub 
#{
#    my $tokens = shift;
#    $tokens->{uri_base} = request->base->path;
#};

=head2 [GET] /

Handles Home Page

=cut

get '/' => sub 
{
	template 'home.tt',
		{
			page_title => 'Octopussy HomePage'
		};
};


=head2 [GET,POST] /login

Handles Login Page

=cut

any ['get', 'post'] => '/login' => sub 
{ 
	if ( request->method() eq "POST" ) 
	{
    	session 'logged_in' => true;
      	return redirect '/';
  	}
 
	template 'login.tt', 
		{ 
			octopussy_version => '1.1', 
			page_title => 'Octopussy Login'
		};
};


=head2 [GET] /logout

Handles Logout Page

=cut
 
get '/logout' => sub 
{
	session->destroy;
  	redirect '/';
};

1;
