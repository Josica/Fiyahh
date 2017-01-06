require 'json'
require 'open-uri'
require 'sqlite3'
require_relative 'sqlcommands'
require_relative "display"

 c = Commands.new
 d = Display.new
#Database
$db = SQLite3::Database.new('db/fdny_responses.db')
get_data = JSON.parse(open('https://data.cityofnewyork.us/resource/6b8a-2fci.json').read)

d.prompt_user

average = c.get_average_time_by_borough(d.answer)
d.dope_af_firetruck
d.display_avg_results(average)

fastest = c.get_fastest_response_by_borough(d.answer)
d.display_f_results(fastest)

longest = c.get_longest_response_by_borough(d.answer)
d.display_s_results(longest)

