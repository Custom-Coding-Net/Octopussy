=head1 NAME

Octopussy::Web::Alert

=cut

package Octopussy::Web::Alert;

use strict;
use warnings;

use Dancer ':syntax';

=head1 SUBROUTINES/METHODS

=head2 GET '/alert/list'

=cut

get '/alert/list' => sub
{
	template 'octopussy/alert/list';
};

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
