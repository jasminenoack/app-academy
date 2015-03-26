class Fixnum
@@ones= { 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine"}
@@teens= { 10=>"ten", 11=>"eleven", 12=>"twelve", 13=>"thirteen", 14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 19=>"nineteen"}
@@tens={2=>"twenty", 3=>"thirty", 4=>"forty", 5=>"fifty", 6=>"sixty", 7=>"seventy", 8=>"eighty", 9=>"ninety"}
@@places=["trillions", "billions", "million","thousand"] 

def in_words
result ||=[]
#ones
if self.to_s.length==1
return "zero" if self==0
result<<@@ones[self]
#teens
elsif self.between?(10,19)
result<< @@teens[self]
#tens
elsif self.between?(20,99)
result << @@tens[self.to_s[0].to_i] if self.to_s[0].to_i!=0
result << @@ones[self.to_s[1].to_i] if self.to_s[1].to_i!=0
#hundreds
elsif self.between?(100,999)
result << @@ones[self.to_s[0].to_i] if self.to_s[0].to_i!=0
result<<"hundred"
  if (self.to_s[1,2].to_i).between?(10,19)
    result<< @@teens[(self.to_s[1,2].to_i)] 
  else
    result << @@tens[self.to_s[1].to_i] if self.to_s[1].to_i!=0
    result << @@ones[self.to_s[2].to_i] if self.to_s[2].to_i!=0
  end
#thousands
elsif self.between?(1000,999999)
result << @@ones[self.to_s[-6].to_i] if self.to_s[-6].to_i!=0
result<<"hundred" if self.to_s[-6].to_i!=0
  if (self.to_s[-5..-4].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-5..-4].to_i)] 
  else
    result << @@tens[self.to_s[-5].to_i] if self.to_s[-5].to_i!=0
    result << @@ones[self.to_s[-4].to_i] if self.to_s[-4].to_i!=0
  end
result<<"thousand" if self.to_s[-4].to_i!=0 || self.to_s[-5].to_i!=0 || self.to_s[-6].to_i!=0
result << @@ones[self.to_s[-3].to_i] if self.to_s[-3].to_i!=0
result<<"hundred" if self.to_s[-3].to_i!=0
  if (self.to_s[-2..-1].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-2..-1].to_i)] 
  else
    result << @@tens[self.to_s[-2].to_i] if self.to_s[-2].to_i!=0
    result << @@ones[self.to_s[-1].to_i] if self.to_s[-1].to_i!=0
  end
#millions
elsif self.between?(1000000,999999999)
result << @@ones[self.to_s[-9].to_i] if self.to_s[-9].to_i!=0
result<<"hundred" if self.to_s[-9].to_i!=0
  if (self.to_s[-8..-7].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-8..-7].to_i)] 
  else
    result << @@tens[self.to_s[-8].to_i] if self.to_s[-8].to_i!=0
    result << @@ones[self.to_s[-7].to_i] if self.to_s[-7].to_i!=0
  end
result<<"million" if self.to_s[-7].to_i!=0 || self.to_s[-8].to_i!=0 || self.to_s[-9].to_i!=0
result << @@ones[self.to_s[-6].to_i] if self.to_s[-6].to_i!=0
result<<"hundred" if self.to_s[-6].to_i!=0
  if (self.to_s[-5..-4].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-5..-4].to_i)] 
  else
    result << @@tens[self.to_s[-5].to_i] if self.to_s[-5].to_i!=0
    result << @@ones[self.to_s[-4].to_i] if self.to_s[-4].to_i!=0
  end
result<<"thousand" if self.to_s[-4].to_i!=0 || self.to_s[-5].to_i!=0 || self.to_s[-6].to_i!=0
result << @@ones[self.to_s[-3].to_i] if self.to_s[-3].to_i!=0
result<<"hundred" if self.to_s[-3].to_i!=0
  if (self.to_s[-2..-1].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-2..-1].to_i)] 
  else
    result << @@tens[self.to_s[-2].to_i] if self.to_s[-2].to_i!=0
    result << @@ones[self.to_s[-1].to_i] if self.to_s[-1].to_i!=0
  end
end

#billons
if self.between?(1000000000,999999999999)
result << @@ones[self.to_s[-12].to_i] if self.to_s[-12].to_i!=0
result<<"hundred" if self.to_s[-12].to_i!=0
  if (self.to_s[-11..-10].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-11..-10].to_i)] 
  else
    result << @@tens[self.to_s[-11].to_i] if self.to_s[-11].to_i!=0
    result << @@ones[self.to_s[-10].to_i] if self.to_s[-10].to_i!=0
  end
result<<"billion" if self.to_s[-10].to_i!=0 || self.to_s[-11].to_i!=0 || self.to_s[-12].to_i!=0
result << @@ones[self.to_s[-9].to_i] if self.to_s[-9].to_i!=0
result<<"hundred" if self.to_s[-9].to_i!=0
  if (self.to_s[-8..-7].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-8..-7].to_i)] 
  else
    result << @@tens[self.to_s[-8].to_i] if self.to_s[-8].to_i!=0
    result << @@ones[self.to_s[-7].to_i] if self.to_s[-7].to_i!=0
  end
result<<"million" if self.to_s[-7].to_i!=0 || self.to_s[-8].to_i!=0 || self.to_s[-9].to_i!=0
result << @@ones[self.to_s[-6].to_i] if self.to_s[-6].to_i!=0
result<<"hundred" if self.to_s[-6].to_i!=0
  if (self.to_s[-5..-4].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-5..-4].to_i)] 
  else
    result << @@tens[self.to_s[-5].to_i] if self.to_s[-5].to_i!=0
    result << @@ones[self.to_s[-4].to_i] if self.to_s[-4].to_i!=0
  end
result<<"thousand" if self.to_s[-4].to_i!=0 || self.to_s[-5].to_i!=0 || self.to_s[-6].to_i!=0
result << @@ones[self.to_s[-3].to_i] if self.to_s[-3].to_i!=0
result<<"hundred" if self.to_s[-3].to_i!=0
  if (self.to_s[-2..-1].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-2..-1].to_i)] 
  else
    result << @@tens[self.to_s[-2].to_i] if self.to_s[-2].to_i!=0
    result << @@ones[self.to_s[-1].to_i] if self.to_s[-1].to_i!=0
  end
#trillions
elsif self.between?(1000000000000,999999999999999)
result << @@ones[self.to_s[-15].to_i] if self.to_s[-15].to_i!=0
result<<"hundred" if self.to_s[-15].to_i!=0
  if (self.to_s[-14..-13].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-14..-13].to_i)] 
  else
    result << @@tens[self.to_s[-14].to_i] if self.to_s[-14].to_i!=0
    result << @@ones[self.to_s[-13].to_i] if self.to_s[-13].to_i!=0
  end
result<<"trillion" if self.to_s[-13].to_i!=0 || self.to_s[-14].to_i!=0 || self.to_s[-15].to_i!=0

result << @@ones[self.to_s[-12].to_i] if self.to_s[-12].to_i!=0
result<<"hundred" if self.to_s[-12].to_i!=0
  if (self.to_s[-11..-10].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-11..-10].to_i)] 
  else
    result << @@tens[self.to_s[-11].to_i] if self.to_s[-11].to_i!=0
    result << @@ones[self.to_s[-10].to_i] if self.to_s[-10].to_i!=0
  end
result<<"billion" if self.to_s[-10].to_i!=0 || self.to_s[-11].to_i!=0 || self.to_s[-12].to_i!=0
result << @@ones[self.to_s[-9].to_i] if self.to_s[-9].to_i!=0
result<<"hundred" if self.to_s[-9].to_i!=0
  if (self.to_s[-8..-7].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-8..-7].to_i)] 
  else
    result << @@tens[self.to_s[-8].to_i] if self.to_s[-8].to_i!=0
    result << @@ones[self.to_s[-7].to_i] if self.to_s[-7].to_i!=0
  end
result<<"million" if self.to_s[-7].to_i!=0 || self.to_s[-8].to_i!=0 || self.to_s[-9].to_i!=0
result << @@ones[self.to_s[-6].to_i] if self.to_s[-6].to_i!=0
result<<"hundred" if self.to_s[-6].to_i!=0
  if (self.to_s[-5..-4].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-5..-4].to_i)] 
  else
    result << @@tens[self.to_s[-5].to_i] if self.to_s[-5].to_i!=0
    result << @@ones[self.to_s[-4].to_i] if self.to_s[-4].to_i!=0
  end
result<<"thousand" if self.to_s[-4].to_i!=0 || self.to_s[-5].to_i!=0 || self.to_s[-6].to_i!=0
result << @@ones[self.to_s[-3].to_i] if self.to_s[-3].to_i!=0
result<<"hundred" if self.to_s[-3].to_i!=0
  if (self.to_s[-2..-1].to_i).between?(10,19)
    result<< @@teens[(self.to_s[-2..-1].to_i)] 
  else
    result << @@tens[self.to_s[-2].to_i] if self.to_s[-2].to_i!=0
    result << @@ones[self.to_s[-1].to_i] if self.to_s[-1].to_i!=0
  end
end
result.join(" ").chomp
end

end