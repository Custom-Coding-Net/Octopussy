#!/usr/bin/env perl

use Dancer;
use Template;

set 'layout'       => 'page';
set 'template'		=> 'template_toolkit';

use Octopussy::Web;

dance;
