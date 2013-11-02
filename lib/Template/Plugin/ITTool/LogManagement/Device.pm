=head1 NAME

Template::Plugin::ITTool::LogManagement::Device

=cut

package Template::Plugin::ITTool::LogManagement::Device;

use strict;
use warnings;
use base 'Template::Plugin';

use Octopussy::Device;

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

=head2 Configuration($device)

=cut

sub Configuration
{
    my ($self, $device) = @_;

    my $conf = Octopussy::Device::Configuration($device);

    return ($conf);
}

=head2 Configurations($sort)

=cut

sub Configurations
{
    my ($self, $sort) = @_;

    my @devices = Octopussy::Device::Configurations($sort);

    return (\@devices);
}

=head2 Models($device_type)

=cut

sub Models
{
    my ($self, $device_type) = @_;

    my @device_models = Octopussy::Device::Models($device_type);

    return (\@device_models);
}

=head2 Services($device, $sort)

=cut

sub Services
{
    my ($self, $device, $sort) = @_;

    my @services = Octopussy::Device::Services_Configurations($device, $sort);

    return (\@services);
}

=head2 Types()

=cut

sub Types
{
    my $self = shift;

    my @device_types = Octopussy::Device::Types();

    return (\@device_types);
}

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
