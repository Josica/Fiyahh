require 'json'
require 'open-uri'
require 'sqlite3'
require_relative 'sqlcommands'
require_relative "display"
require 'pry'
c = Commands.new
d = Display.new
$db = SQLite3::Database.new('db/fdny_responses.db')
get_data = JSON.parse(open('https://data.cityofnewyork.us/resource/6b8a-2fci.json').read)

# DRIVER CODE:
d.prompt_user
if d.answer != nil
  # Parse the command line arguments
  case d.answer
  when "1"
  	d.prompt_user_borough
  	if d.borough != nil
		average = c.get_average_time_by_borough(d.borough)
		d.dope_af_firetruck
		d.display_avg_results(average)
	end
  when '2'
  	d.prompt_user_borough
  	if d.borough != nil
      fastest = c.get_fastest_response_by_borough(d.borough)
	  d.display_f_results(fastest)
	 end  	  
  when '3'
  	d.prompt_user_borough
  	if d.borough != nil
      longest = c.get_longest_response_by_borough(d.borough)
	  d.display_s_results(longest)  
	end
  when '4'
  	response = c.add_new_response
    d.display_new_record(response)
  end
end
