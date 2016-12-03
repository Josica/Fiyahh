require_relative "sqlcommands"
require 'colorize'
class Display
  attr_reader :answer, :borough
  def initialize
    @answer = nil
    @borough = nil
  end



  def prompt_user
  var = <<-welcome
                  (           )    *                    )    (    (       )           )    )
 (  (         )\\ )  (  ( /(  (  `          *   ) ( /(    )\\ ) )\\ ) ( /(  (     ( /( ( /(
 )\\))(   '(  (()/(  )\\ )\\()) )\\))(  (    ` )  /( )\\())  (()/((()/( )\\()) )\\    )\\()))\\())
((_)()\\ ) )\\  /(_)|((_|(_)\\ ((_)()\\ )\\    ( )(_)|(_)\\    /(_))/(_)|(_)((((_)( ((_)\\((_)\\
_(())\\_)(|(_)(_)) )\\___ ((_)(_()((_|(_)  (_(_())  ((_)  (_))_(_))__ ((_)\\ _ )\\ _((_)_((_)
\\ \\((_)/ / __| | ((/ __/ _ \\|  \\/  | __| |_   _| / _ \\  | |_ |_ _\\ \\ / (_)_\\(_) || | || |
 \\ \\/\\/ /| _|| |__| (_| (_) | |\\/| | _|    | |  | (_) | | __| | | \\ V / / _ \\ | __ | __ |
  \\_/\\_/ |___|____|\\___\\___/|_|  |_|___|   |_|   \\___/  |_|  |___| |_| /_/ \\_\\|_||_|_||_|
    welcome

    puts var.colorize(:red).on_black
    puts "CHOOSE YOUR SEARCH:  \n "
    puts "1 - AVERAGE RESPONSE"
    puts "2 - FASTEST RESPONSE"
    puts "3 - SLOWEST RESPONSE"
    puts "4 - ADD NEW RECORD"
    @answer = gets.chomp
    # binding.pry
  end

  def prompt_user_borough
    puts "CHOOSE A BOROUGH:  \n"
    puts "Bronx"
    puts "Queens"
    puts "Manhttan"
    puts "Brooklyn"
    puts "Staten Island"
    @borough = gets.chomp
  end




  def dope_af_firetruck
    var = <<-firetruck
                                                       )
          ,%,                                     ) _(___[]_
          %%%,&&&,                     ,%%,      (;`       /\\
          %Y/%&&&&                     %%%%   ___/_____)__/ _\\__     ,%%,
        ^^^||^&\\Y&^^^^^^^^^^^^^^^^^^^^^%Y/%^^/ (_()   (  | /____/\\^^^%%%%^^
          `    || _,..=xxxxxxxxxxxx,    ||   |(' |LI (.)I| | LI ||   %\\Y%
         -=      /L_Y.-"""""""""`,-n-. `    @'---|__||___|_|____||_   ||
        ___-=___.--'[========]|L]J: []\\ __________@//@___________) )______
       -= _ _ _ |/ _ ''_ " " ||[ -_ 4 |  _  _  _  _  _  _  _  _  _  _  _
                '-(_)-(_)----'v'-(_)--'
       --------------------------------------------------------------------

       firetruck
      puts var.colorize(:magenta).on_black
      nil
  end

  def display_avg_results(result)
    puts "The average response time in #{@answer} was #{result}"
  end

  def display_f_results(result)
    
    
    clouds = <<-clouds

              ( `   )_
             (    )    `)
           (_   (_ .  _) _)
                                          _
                                         (  )
          _ .                         ( `  ) . )
        (  _ )_                      (_, _(  ,_)_)
      (_  _(_ ,)
                   
      clouds

    puts clouds.colorize(:blue)

    var = <<-airplane 

               _
             -=\\ \\
          |\\ ____\\_\\__
        -=\\c`""""""" "`)
     ---   `~~~~~/ /~~`
             -==/ /
               '-'
          airplane

    puts var.colorize(:yellow)          

    puts "The fastest response time in #{@answer} was #{result.first}"
  end

  def display_s_results(result)
   var = <<-firetruck
            ________
           /.--..--,\\
           //___||___\\___,
   #%     / ,_,    -  ,_,  \\    
  #%@#  =(_/(_)\\_____/(_)\\__)
  
    firetruck

    puts var.colorize(:red)

    puts "The slowest response time in #{@answer} was #{result.first}"
  end

  def display_new_record(new)

    var = <<-fireman
      .--"-.    Where's the fire?
     /      "   LEmme use my hose to put it out!
    :   (o"""|
    / ,- `-._|
  ,'-"  `,-'
    /--.(
   /   . \\
   >    ) :
   |\\  .\\ T
   `.\\ ` Y
    : \\  !.

    fireman

    puts var.colorize(:green)

    puts "New record was entered by: #{new.last}"
  end

end


