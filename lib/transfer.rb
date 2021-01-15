class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    return true if @sender.valid? && @receiver.valid?
  end
  def execute_transaction
    if @amount <= @sender.balance && valid? && @status == "pending"
      @status = "complete"
      @sender.balance -= @amount 
      @receiver.balance += @amount 
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      @sender.balance += @amount 
      @receiver.balance -= @amount 
    end
  end
end
