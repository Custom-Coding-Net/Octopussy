=head1 NAME

Template::Plugin::ITTool::LogManagement::Taxonomy

=cut

package Template::Plugin::ITTool::LogManagement::Taxonomy;

use strict;
use warnings;
use base 'Template::Plugin';

use Octopussy::Taxonomy;

my %taxo_color = Octopussy::Taxonomy::Colors();

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

=head2 Colored($taxonomy)

=cut

sub Colored
{
    my ($self, $taxonomy) = @_;

    my $html = "<font color='" . $taxo_color{$taxonomy} . "'>" 
		. $taxonomy . '</font>';

    return ($html);
}

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
