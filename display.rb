require 'colorize'
class Display
  attr_reader :answer
  def initialize
    @answer = nil
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
    puts "CHOOSE A BOROUGH:  \ "
    puts "BRONX"
    puts "QUEENS"
    puts "MANHATTAN"
    puts "BROOKLYN"
    puts "STATEN ISLAND"
    @answer = gets.chomp

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
    puts "The fastest response time in #{@answer} was #{result.first}"
  end

  def display_s_results(result)
    puts "The slowest response time in #{@answer} was #{result.first}"
    puts "The slowest response time in #{@answer} was #{result.first}"
  end

end
