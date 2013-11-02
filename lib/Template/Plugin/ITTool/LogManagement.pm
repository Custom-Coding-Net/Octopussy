=head1 NAME

Template::Plugin::ITTool::LogManagement

=cut

package Template::Plugin::ITTool::LogManagement;

use strict;
use warnings;
use base 'Template::Plugin';

use Octopussy;

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

=head2 Version()

=cut

sub Version
{
	my $self = shift;

	return (Octopussy::Version());
}

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
