package Template::Plugin::ITTool::LogManagement;

use strict;
use warnings;
use base 'Template::Plugin';

use Octopussy;
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

=head2 Devices($sort)

=cut

sub Devices
{
	my ($self, $sort) = @_;

	my @devices = Octopussy::Device::Configurations($sort);

    return (\@devices);
}

=head2 Device_Models($device_type)

=cut

sub Device_Models
{
    my ($self, $device_type) = @_;

    my @device_models = Octopussy::Device::Models($device_type);

    return (\@device_models);
}

=head2 Device_Types

=cut
sub Device_Types
{
	my $self = shift;

	my @device_types = Octopussy::Device::Types();

	return (\@device_types);	
}

=head2 Version()

=cut

sub Version
{
	my $self = shift;

	return (Octopussy::Version());
}

1;
