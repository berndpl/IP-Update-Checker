#!/usr/bin/ruby

require 'Resolv'

IP = Resolv.getaddress ARGV[0]

puts "IP #{IP}"

# IP = ARGV[0]
URL = ARGV[0]

if (ARGV.count==1)
	puts "Start checking for IP change. [IP] #{IP} [URL] #{URL}"
else
	puts "Usage: ipupdatecheck <url>"
end

p = IO.popen("ping -i 10 #{URL}")
p.each_line do |l|
  timestamp = Time.now.strftime("%H:%M:%S")
  if(l.scan("#{IP}").empty?)
  	puts "#{timestamp} ‣ #{IP} (Updated!)"
    system("terminal-notifier -message \"DNS Changed\" -open \"http://#{URL}\"")
  else
	timestamp = Time.now.strftime("%H:%M:%S")
	puts "#{timestamp} • #{IP} (Original)"   	
  end
end