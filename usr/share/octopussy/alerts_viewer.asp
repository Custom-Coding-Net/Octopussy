<WebUI:PageTop title="_ALERTS_VIEWER" help="Alerts Viewer" />
<%
my $f = $Request->Form();
my $alert = $f->{alert} || $Request->QueryString("alert");
$alert = ((Octopussy::Alert::Valid_Name($alert) || $alert eq "-ANY-") 
	? $alert : undef);
my $device = $f->{device} || $Request->QueryString("device");
$device = ((Octopussy::Device::Valid_Name($device) || $device eq "-ANY-") 
	? $device : undef);
my $status = $f->{status} || $Request->QueryString("status") || "Opened";
$status = ((Octopussy::Alert::Valid_Status_Name($status) || $status eq "-ANY-")
	? $status : "Opened");
my $comment = $f->{comment};
my $sort = $Request->QueryString("sort");
my $sall = $f->{selectall};

if ((defined $f->{update}) && (defined $f->{edit_status}) 
	&& ($Session->{AAT_ROLE} =~ /(admin|rw)/i))
{
	my $form_fields = $Request->Form();
	foreach my $k (keys %{$form_fields})
	{
		if ($k =~ /alert_id_(\d+)/)
		{
			my $id = $1;
			Octopussy::Alert::Update_Status($id, $f->{edit_status}, $comment);
			#AAT::NSCA::Send("Octopussy", 0, "OK: No Alerts !")	
			#	if (Octopussy::Alert::Check_All_Closed());
		}
	}
}
elsif ((defined $f->{delete_from_db}) && ($Session->{AAT_ROLE} =~ /admin/i))
{
	my $form_fields = $Request->Form();
    foreach my $k (keys %{$form_fields})
    {
        if ($k =~ /alert_id_(\d+)/)
        {
            Octopussy::Alert::Delete_From_Database($1);
        }
    }
}
%>
<AAT:Inc file="octo_alerts_filter_box" url="./alerts_viewer.asp" 
	alert="$alert" device="$device" status="$status" />
<AAT:Inc file="octo_alerts_tracker" url="./alerts_viewer.asp" 
	alert="$alert" device="$device" status="$status" sort="$sort" 
	selectall="$sall" />
<WebUI:PageBottom />
