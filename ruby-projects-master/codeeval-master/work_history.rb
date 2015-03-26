input="Feb 2004-Dec 2009; Sep 2004-Jul 2008
Aug 2013-Mar 2014; Apr 2013-Aug 2013; Jun 2014-Aug 2015; Apr 2003-Nov 2004; Apr 2014-Jan 2015
Mar 2003-Jul 2003; Nov 2003-Jan 2004; Apr 1999-Nov 1999
Apr 1992-Dec 1993; Feb 1996-Sep 1997; Jan 2002-Jun 2002; Sep 2003-Apr 2004; Feb 2010-Nov 2011
Feb 2004-May 2004; Jun 2004-Jul 2004"


def check_overlap(months1, months2)
  return false if months1[1]<months2[0] || months2[1]<months1[0]
  true
end

def overlap(months1, months2)
  if months1[0]<months2[0]
    first=months1[0]
  else
    first=months2[0]
  end
  if months1[1]<months2[1]
    last=months1[1]
  else
    last=months2[1]
  end
  [first,last]
end

input.each_line do |line|


  months = {"Jan" =>  1, "Feb" =>  2, "Mar" =>  3,
            "Apr" =>  4, "May" =>  5, "Jun" =>  6,
            "Jul" =>  7, "Aug" =>  8, "Sep" =>  9,
            "Oct" => 10, "Nov" => 11, "Dec" => 12
            }
  months.each {|month, number| line.gsub!(month, number.to_s)}
  line=line.scan(/\d+/)
  line=line.map{|x| x.to_i}
  line=line.each_slice(2).to_a
  
  in_months = []

  line.each { |time| in_months << time[0]+(time[1]-1990)*12} 
  in_months=in_months.each_slice(2).to_a
  work_period=[]
  in_months.each_with_index do |period, index|
    if index==0
      work_period<<period
    elsif check_overlap(work_period[-1], period)
      work_period[-1]=overlap(work_period[-1], period)
    else
      work_period<<period
    end
  end
  months=0
  work_period.each {|period| months=months+period[1]-period[0]}
  years = months/12
  years += 1 if months%12>4
  puts years
end
