class Numeric
  @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id, args=nil)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
     self * @@currencies[singular_currency]
    elsif method_id.to_s == 'in'
      singular_currency = args.to_s.gsub(  /s$/, '' )
      self /  @@currencies[singular_currency]
    else
      super
    end
  end
end


class String
  def method_missing(method_id)
    if method_id.to_s == 'palindrome?'
      self.gsub(/\W/,"").downcase == self.reverse.gsub(/\W/,"").downcase
    else 
      super
    end
  end
end


module Enumerable
  def method_missing(method_id)
    if method_id.to_s == 'palindrome?'
      self.reverse_each {|v| p v } ==  self.each { |v| p v }
    else 
      super
    end
  end
end



puts true ==  [ nil ].palindrome? 
puts true == { :a => :b }.palindrome? 


puts true == "h".palindrome? 

puts false ==  "ha".palindrome? 

puts true == "hah".palindrome? 

puts false ==  "haha".palindrome?

#puts true ==  { }.palindrome? 


#puts false ==  { :a => :b, :c => :d }.palindrome? 

#puts true ==  [ ].palindrome? 


#puts true == [ 1 ].palindrome? 

#puts false ==  [ 1, 2 ].palindrome? 

#puts true ==  [ 1, 2, 1 ].palindrome? 

#puts true ==  (0 .. 0).palindrome? 

#false ==  ! (0 .. 1).palindrome? 


#puts 2.euro.in(:rupees)

#puts "hola aloh".palindrome?
#
#puts "A man, a plan, a canal -- Panama".palindrome?
#
#puts "Abracadabra".palindrome?
#
#
#puts [1,2,[2,2],3,2,2,2,1].palindrome?

#puts ({"cat"=>0, "dog"=>1, "wombat"=>2}).palindrome?

