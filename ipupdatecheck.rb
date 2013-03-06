#!/usr/bin/ruby

IP = ARGV[0]
URL = ARGV[1]

if (ARGV.count==2)
	puts "Start checking for IP change. [IP] #{ARGV[0]} [URL] #{ARGV[1]}"
else
	puts "Usage: ipupdatecheck <current IP> <url>"
end

p = IO.popen("ping -i 10 #{URL}")
p.each_line do |l|
  timestamp = Time.now.strftime("%H:%M:%S")
  if(l.scan("#{IP}").empty?)
  	puts "#{timestamp} IP Changed ‣ #{IP}"
    system("terminal-notifier -message \"DNS Changed\" -open \"http://#{URL}\"")
  else
	timestamp = Time.now.strftime("%H:%M:%S")
	puts "#{timestamp}"   	
  end
end