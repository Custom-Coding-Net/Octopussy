=head1 NAME

Template::Plugin::ITTool

=cut

package Template::Plugin::ITTool;

use strict;
use warnings;
use base 'Template::Plugin';

=head1 SUBROUTINES/METHODS

=head2 new()

=cut

sub new
{
    my ($class, $context) = @_;

    bless {
        _CONTEXT => $context,
    }, $class;
}

=head2 Status($status)

=cut

sub Status
{
    my ($self, $status) = @_;

    my $html = '<div class="text-center">'
        . '<span class="label' . ($status =~ /Enabled/i ? ' label-success' : '')
        . '">' . $status . '</span></div>';

    return ($html);
}

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
