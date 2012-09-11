package Octopussy::Web::Documentation;

use Dancer ':syntax';
use File::Slurp;
use FindBin;
use Text::Markdown 'markdown';

my $DIR_DOCUMENTATION = "$FindBin::Bin/../public/documentation/"; 

get '/documentation/:page' => sub
{
	my $page = params->{page};

	if (-f "$DIR_DOCUMENTATION/${page}.md")
	{
		my $text = read_file("$DIR_DOCUMENTATION/${page}.md");
		my $html = markdown($text);
		template 'documentation/page.tt',
        {
            page_title => 'Octopussy Documentation',
			html => $html
        };				
	}	
};

1;
