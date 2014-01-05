=head1 NAME

Template::Plugin::ITTool::LogManagement::Table

=cut

package Template::Plugin::ITTool::LogManagement::Table;

use strict;
use warnings;
use base 'Template::Plugin';

use Octopussy::Table;

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

    my @tables = Octopussy::Table::Configurations($sort);

    return (\@tables);
}

=head2 Fields($table)

=cut

sub Fields
{
	my ($self, $table) = @_;

    my @fields = Octopussy::Table::Fields($table);

    return (\@fields);
}

1;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
