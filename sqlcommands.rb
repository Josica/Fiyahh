require 'time'
require 'pry'
#require_relative 'display'
class Commands

  def seed_table
    get_data.each do |row|
      averageresponsetime= row['averageresponsetime']
      incidentborough = row['incidentborough']
      incidentclass = row['incidentclassification']
      incidentcount = row['incidentcount']
      yearmonth = row['yearmonth']
      db.execute('INSERT INTO FDNY (averageresponsetime ,incidentborough, incidentclassification, incidentcount, yearmonth) VALUES (?,?,?,?,?)', averageresponsetime ,incidentborough, incidentclass, incidentcount, yearmonth)
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


end
