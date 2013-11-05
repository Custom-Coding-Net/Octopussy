=head1 NAME

Template::Plugin::ITTool::LogManagement::Service

=cut

package Template::Plugin::ITTool::LogManagement::Service;

use strict;
use warnings;
use base 'Template::Plugin';

use Octopussy::Service;

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

    my @services = Octopussy::Service::Configurations($sort);

    return (\@services);
}

=head2 Messages_Configurations($service, $sort)

=cut

sub Messages_Configurations
{
	my ($self, $service, $sort) = @_;

	my @messages = Octopussy::Service::Messages_Configurations($service, $sort);

	return (\@messages);
}

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
