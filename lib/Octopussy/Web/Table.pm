=head1 NAME

Octopussy::Web::Table - Dancer module to handle '/table/*' routes

=cut

package Octopussy::Web::Table;

use strict;
use warnings;

use Dancer ':syntax';

use Octopussy::Table;

=head1 SUBROUTINES/METHODS

=head2 POST '/table/create'

Route to Create a Table

=cut

post '/table/create' => sub
{
	my ($name, $desc) = (params->{'name'}, params->{'description'});

	# TODO user rights
	Octopussy::Table::New({ name => $name, description => $desc });

	redirect '/table/edit/' . $name;    
};

=head2 GET '/table/edit/:tablename'

Route to edit Table ':tablename'

=cut

get '/table/edit/:tablename' => sub
{
    template 'octopussy/table/edit',
        { table => params->{'tablename'} };
};

=head2 GET '/table/list'

Route to list Tables

=cut

get '/table/list' => sub
{
	template 'octopussy/table/list';
};

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
