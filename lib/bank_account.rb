class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
 def initialize(name)
    @name = name 
    @balance = 1000
    @status = "open"
 end

 def deposit(num)
    @balance += num
 end

 def display_balance
    "Your balance is $#{self.balance}."
 end

 def valid?
    @balance > 0 && @status == "open"
 end

 def close_account
    @status = "closed"
 end
end
