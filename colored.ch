= colored: |
  cute.
  
    >> puts "this is red".red
   
    >> puts "this is red with a blue background (read: ugly)".red_on_blue
  
    >> puts "this is red with an underline".red.underline
  
    >> puts "this is really bold and really blue".bold.blue
  
    >> logger.debug "hey this is broken!".red_on_yellow     # in rails
  
    >> puts Color.red "This is red" # but this part is mostly untested
  
== Windows users:
== You will need the Win32 Console Ansi gem.  Get it:
  
    $ sudo gem install win32console-1.0.0
  
    (We're trying to make it official.  Hang in there.)
  
  >> chris[at]ozmm[dot]org
  => http://errtheblog.com/
  

