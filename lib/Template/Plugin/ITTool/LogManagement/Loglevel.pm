=head1 NAME

Template::Plugin::ITTool::LogManagement::Loglevel

=cut

package Template::Plugin::ITTool::LogManagement::Loglevel;

use strict;
use warnings;
use base 'Template::Plugin';

use Octopussy::Loglevel;

my %loglevel_color = Octopussy::Loglevel::Colors();

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

=head2 Colored($loglevel)

=cut

sub Colored
{
    my ($self, $loglevel) = @_;

    my $html = "<font color='" . $loglevel_color{$loglevel} . "'>" 
		. $loglevel . '</font>';

    return ($html);
}

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
