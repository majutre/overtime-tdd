module SmsTool
  def self.send_sms(number:, message:)
    puts 'sending SMS...'
    puts "#{message} to #{number}"
  end
end