=head1 NAME

Template::Plugin::ITTool::LogManagement::Storage

=cut

package Template::Plugin::ITTool::LogManagement::Storage;

use strict;
use warnings;
use base 'Template::Plugin';

use Octopussy::Storage;

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

=head2 Default()

=cut

sub Default
{
    my $self = shift;

    my $storage_default = Octopussy::Storage::Default();

    return ($storage_default);
}

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
