#!/usr/bin/ruby

require 'Resolv'

#----Config-----
Interval = 10 #in seconds
#---------------

URL = ARGV[0]

IP = Resolv.getaddress URL

if (ARGV.count==1)
	puts "Start checking for IP change. [IP] #{IP} [URL] #{URL}"
else
	puts "Usage: ipupdatecheck <url>"
end

p = IO.popen("ping -i #{Interval} #{URL}")
p.each_line do |l|
  timestamp = Time.now.strftime("%H:%M:%S")
  if(l.scan("#{IP}").empty?)
  	puts "#{timestamp} ‣ #{IP} (Updated!)"
    system("terminal-notifier -message \"Hurray. DNS changed • Check #{URL}\" -open \"http://#{URL}\"")
  else
	timestamp = Time.now.strftime("%H:%M:%S")
	puts "#{timestamp} • #{IP} (Original)"   	
  end
end