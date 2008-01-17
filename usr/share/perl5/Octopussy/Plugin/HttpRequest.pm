=head1 NAME

Octopussy::Plugin::HttpRequest - Octopussy Plugin HttpRequest

=cut
package Octopussy::Plugin::HttpRequest;

use strict;
use Octopussy;

my $KILO = 1024;
my $MEGA = $KILO*1024;
my $GIGA = $MEGA*1024;

my @browsers = ();
my @operating_systems = ();

=head1 FUNCTIONS

=head2 Init()

=cut
sub Init
{
	my $bot_conf = AAT::List::Configuration("AAT_Bot");
	my $browser_conf = AAT::List::Configuration("AAT_Browser");
	my $mobile_conf = AAT::List::Configuration("AAT_MobilePhone");
	my $os_conf = AAT::List::Configuration("AAT_Operating_System");
	
	my @list =
    (AAT::ARRAY($browser_conf->{item}), AAT::ARRAY($mobile_conf->{item}),
    AAT::ARRAY($bot_conf->{item}));
  foreach my $i (@list)
  {
    push(@browsers, { label => $i->{label},
      logo => $i->{logo}, regexp => qr/$i->{regexp}/ })
			if (AAT::NOT_NULL($i->{regexp}));
  }
	foreach my $i (AAT::ARRAY($os_conf->{item}))
  {
    push(@operating_systems, { label => $i->{label},
      logo => $i->{logo}, regexp => qr/$i->{regexp}/ })
			if (AAT::NOT_NULL($i->{regexp}));
  }
}

=head2 Logo($logo, $alt)

=cut
sub Logo($$)
{
	my ($logo, $alt) = @_;

	return ("<img src=\"AAT/IMG/${logo}.png\" alt=\"$alt\"><b>$alt</b>"); 
	return ($alt);
}

=head2 Browser($ua)

=cut
sub Browser($)
{
	my $ua = shift;
	
	foreach my $i (@browsers)
	{
		if ((defined $i->{regexp}) && ($ua =~ /$i->{regexp}/))
		{
			return (Logo("browsers/$i->{logo}", $i->{label}))
				if (defined $i->{logo});
			return ($i->{label});
		}
	}

	return ($ua);
}

=head2 Operating_System($ua)

=cut
sub Operating_System($)
{
	my $ua = shift;

  foreach my $i (@operating_systems)
  {
		if ((defined $i->{regexp}) && ($ua =~ /$i->{regexp}/))
    {
    	return (Logo("operating_systems/$i->{logo}", $i->{label})) 
				if (defined $i->{logo});
			return ($i->{label});
		}
  }

  return ($ua);
}

=head2 Size($bytes)

=cut
sub Size($)
{
	my $bytes = shift;

	if (($bytes / $GIGA) > 1)
  	{ return (sprintf("%.1f%s", $bytes / $GIGA, " G")); }
	elsif (($bytes / $MEGA) > 1)	
		{ return (sprintf("%.1f%s", $bytes / $MEGA, " M")); }
	elsif (($bytes / $KILO) > 1)
		{ return (sprintf("%.1f%s", $bytes / $KILO, " K")); }
	
	return ($bytes);
}

1;

=head1 AUTHOR

Sebastien Thebert <octo.devel@gmail.com>

=cut
