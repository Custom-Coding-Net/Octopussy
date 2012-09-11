# ![Alert Button](/img/buttons/bt_alert.png) Alerts
Here you can configure your Alerts.
On this page, you can ![Edit Button](/img/buttons/bt_edit.png) **Edit**, ![Remove Button](/img/buttons/bt_remove.png) **Remove** or Create a new Alert by clicking on *'Dynamic Alert Creation'* link.

![Alerts List](/img/documentation/octo_alerts_list.png)

Alerts List

Every time you will ![Remove Button](/img/buttons/bt_remove.png) **Remove** an Alert, a dialog window will ask you to confirm.

![Dialog Alert Delete](/img/documentation/octo_alerts_dialog_delete.png)

Dialog Window Confirmation

![Dynamic Alert Creation](/img/documentation/octo_alert_dynamic_creation.png)

Dynamic Alert Creation Box


**'Alert Level'** is only useful for **'Alerts Viewer'**.
Alerts will be colored respectively in <font color="orange">Orange</font> and <font color="red">Red</font> for Warning and Critical.

In '**Subject**' and '**Body**' fields, you can add some predefined words:

* **__device__** will be replaced by the device that sends log that raise this alert.
* **__alert__** will be replaced by the alert name of this alert.
* **__level__** will be replaced by the alert level of this alert.
* **__log__** will be replaced by the log line that raise this alert.
* **__field_*fieldname*__** will be replaced by the value of the field 'fieldname' of the log line.

