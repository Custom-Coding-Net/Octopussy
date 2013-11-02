=head1 NAME

Template::Plugin::ITTool::LogManagement::Alert

=cut

package Template::Plugin::ITTool::LogManagement::Alert;

use strict;
use warnings;
use base 'Template::Plugin';

use Octopussy::Alert;

=head1 SUBROUTINES/METHODS

=head2 new()

=cut

sub new
{
    my ($class, $context, $params) = @_;

    bless {
        _CONTEXT => $context,
    }, $class;
}

=head2 Configurations($sort)

=cut

sub Configurations
{
    my ($self, $sort) = @_;

    my @alerts = Octopussy::Alert::Configurations($sort);

    return (\@alerts);
}

1;


