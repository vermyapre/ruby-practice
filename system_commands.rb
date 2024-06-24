


system("ls") 

#lis all files with * argument
system("echo *")


#shell expansion
#print every file and folder in current dir
system("echo *")

#use the special characters as arguments?
system("echo", "*")

#specific environment variables to an exxternal command
#prints  "best"
system({"rubyguides" => "best"}, "ruby", "-e p ENV['rubyguides']")


#If you want to get the output from the command you’re running, 
#instead of displaying it then you can use %x or the Kernel#` method.

#irb console method
`ls`
#irb method
#using %x
%x|ls|


#run commands in a separate process
fork { exec("ls") }

#This will run ls on another process & display its output.
#Because this command is running in another process 
#it will not block your Ruby app from running like the system method or %x.

#If you use exec without fork you’re going to replace your current process.


#use the popen method to launch an irb process, then send some input to it & read the output.
#Popen Method For Two Way Communication With An External Program


r = IO.popen("irb", "r+")
r.write "puts 123 + 1\n"
3.times { puts r.gets }
r.write "exit\n"

#There is also a popen3 method in the standard library.



#advanced
require 'open3'

Open3.popen3("curl", "https://api.rubyonrails.org/") do |stdin, stdout, stderr, thread|
   pid = thread.pid
   5.times { puts stdout.readline }
end

# Output

# <!DOCTYPE html>
# <html lang="en">
# <head>
#     <title>Ruby on Rails API</title>
#     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" # />

