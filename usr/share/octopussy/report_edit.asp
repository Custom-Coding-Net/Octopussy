<WebUI:PageTop title="_REPORT_EDITION" />
<%
my $f = $Request->Form();
my $report = $Request->QueryString("report");
$report = (Octopussy::Report::Valid_Name($report) ? $report : undef);

if ((defined $f->{modify}) && ($Session->{AAT_ROLE} !~ /ro/i))
{
	if ($f->{graph_type} !~ /^rrd_/)
	{
		Octopussy::Report::Modify($f->{old_report}, { 
			name => $f->{name}, 
			description => $f->{description},
			category => $f->{category}, 
			graph_type => $f->{graph_type},
			table => $f->{table}, 
			loglevel => $f->{loglevel},
			taxonomy => $f->{taxonomy}, 
			query => $f->{query},
			columns => $f->{columns}, 
			columns_name => $f->{columns_name},
			x => $f->{x}, 
			y => $f->{y} });
	}
	else
	{
		my $dhm = $f->{rrd_timeline};
		my $dsv = $f->{datasources_value};
		Octopussy::Report::Modify($f->{old_report}, { 
			name => $f->{name}, 
			description => $f->{description},
			category => $f->{category}, 
			taxonomy => $f->{taxonomy},
			datasource1 => $f->{datasource1}, 
			datasource2 => $f->{datasource2},
			datasource3 => $f->{datasource3}, 
			datasources_value => $dsv,
			timeline => $dhm, 
			graph_type => $f->{graph_type},
      		rrd_step => $f->{rrd_step}, 
			table => $f->{table}, 
			query => $f->{query},
			graph_title => $f->{graph_title}, 
			graph_ylabel => $f->{graph_ylabel},
     		graph_width => $f->{graph_width}, 
			graph_height => $f->{graph_height} } );
	}
	AAT::Syslog::Message("octo_WebUI", "GENERIC_MODIFIED", "Report", $f->{old_report}, $Session->{AAT_LOGIN});
	$Response->Redirect("./reports.asp");
}
else
{
	%><AAT:Inc file="octo_report_edition" report="$report" /><%
}
%>
<WebUI:PageBottom />
