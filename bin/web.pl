#!/usr/bin/env perl

use Dancer;
use Dancer::Plugin::I18N;
use FindBin;

set session => 'YAML';
set octopussy_version => '1.2';

use lib "$FindBin::Bin/../lib";

#use Octopussy::Web;

use Template::Plugin::ITTool;
use Template::Plugin::ITTool::LogManagement;
use Template::Plugin::ITTool::LogManagement::Alert;
use Template::Plugin::ITTool::LogManagement::Device;
use Template::Plugin::ITTool::LogManagement::Service;
use Template::Plugin::ITTool::LogManagement::Storage;

use Octopussy::Web;

dance;

=head1 AUTHOR

Sebastien Thebert <support@octopussy.pm>

=cut
