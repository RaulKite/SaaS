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




