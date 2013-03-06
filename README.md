IP-Update-Check
===============

A ruby script for checking IP address changes

I wrote a little ruby script that notifies you when the IP address of your website changes. This is useful when you migrate from one server to another and wait for a DNS update of your domain to take effect. It uses the Mac OS X built in notification center to show the change notifcation. 

The script is in a extremely early state, very unpolished, reports false alarms when a  ping accidently fails BUT it basically works. So if you are in the situation of waiting for a DNS update, you might still find this useful. And while you're waiting anyhow … why not fork it and take it to the next level :)

Dependencies
* Ruby 1.9.2 (because it uses Resolv.rb for the IP lookup)
* Terminal-Notifier for the Mac OS X System Notifications
