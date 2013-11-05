=head1 NAME

Template::Plugin::ITTool::LogManagement::Message

=cut

package Template::Plugin::ITTool::LogManagement::Message;

use strict;
use warnings;
use base 'Template::Plugin';

use Octopussy::Message;

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

=head2 Color($pattern)

=cut

sub Color
{
	my ($self, $pattern) = @_;

	return (Octopussy::Message::Color($pattern));
}

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
