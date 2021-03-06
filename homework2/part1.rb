class Numeric
#puts ({"cat"=>0, "dog"=>1, "wombat"=>2}).palindrome?
#puts ({"cat"=>0, "dog"=>1, "wombat"=>2}).palindrome?
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
      array1 = Array.new
      array2 = Array.new
      self.reverse_each { |v| array1.push(v) } 
      self.each { |v| array2.push(v)}
      array1 == array2
    else 
      super
    end
  end
end


#puts "A man, a plan, a canal -- Panama".palindrome?
#puts "Madam, I'm Adam!".palindrome?


#puts [[1,2],[1,2]].palindrome?

#a = [1,2,3,2,1] 
#h = a.each 
#puts h.palindrome?


#puts "ifihadahifi".chars.palindrome? 

#puts "If I had a hi-fi".chars.palindrome? 

#puts (1..10).palindrome?

#puts [1,2,3].collect.palindrome?

#puts 9.downto(1).palindrome?


#puts ({"cat"=>0, "dog"=>1, "wombat"=>2}).palindrome?
