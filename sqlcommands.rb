require 'time'

class Commands
  attr_reader :last_record
  def initialize
    @last_record = nil
  end

  def seed_table
    get_data.each do |row|
      averageresponsetime= row['averageresponsetime']
      incidentborough = row['incidentborough']
      incidentclass = row['incidentclassification']
      incidentcount = row['incidentcount']
      yearmonth = row['yearmonth']
      $db.execute('INSERT INTO FDNY (averageresponsetime ,incidentborough, incidentclassification, incidentcount, yearmonth) VALUES (?,?,?,?,?)', averageresponsetime ,incidentborough, incidentclass, incidentcount, yearmonth)
    end
  end

  def get_average_time_by_borough(name)
    time  = $db.execute("SELECT averageresponsetime FROM FDNY WHERE incidentborough = ?", name)

    # init vars
    minute = nil
    second = nil
    size = time.size

    avg_minutes = time.map do |x|
      x.each do |z|
        minute, second = z.split(':')
      end
      total_minutes = minute.to_i * 60 + second.to_i
    end.inject(:+)/size
      "#{avg_minutes/60}:#{avg_minutes%60}"
  end

  def get_fastest_response_by_borough(name)
    time  = $db.execute("SELECT averageresponsetime FROM FDNY WHERE incidentborough = ?", name)
    time.sort.first
  end

  def get_longest_response_by_borough(name)
    time  = $db.execute("SELECT averageresponsetime FROM FDNY WHERE incidentborough = ?", name)
    time.sort.last
  end

  
  def add_new_response

    puts "Please enter new records"
    p "Enter averageresponsetime"
    averageresponsetime = gets.chomp.to_s
    p 'Enter incidentborough'
    incidentborough = gets.chomp.to_s
    p 'Enter incidentclassification'
    incidentclass = gets.chomp.to_s
    p 'Enter incidentcount'
    incidentcount = gets.chomp.to_s
    p 'Enter year and the month attached'
    yearmonth = gets.chomp.to_s

    $db.execute('INSERT INTO FDNY (averageresponsetime ,incidentborough, incidentclassification, incidentcount, yearmonth) VALUES (?,?,?,?,?)', averageresponsetime ,incidentborough, incidentclass, incidentcount, yearmonth)
    @last_record = $db.execute("SELECT * FROM FDNY")
  end
end
