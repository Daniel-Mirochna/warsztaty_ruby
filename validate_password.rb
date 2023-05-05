class ValidatePassword

  def initialize(password)
    @password = password
    @password_array = password.split('')
  end

  def perform
    check_length &&
    check_downcase &&
    check_uppercase &&
    check_digits &&
    check_special_chars &&
    check_max_chars_amount
  end

  # I could use also below method to fullfill all of checks :)
  # def perform
  #   !!(@password =~ /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?!.*(.)\1\1)(?=.{6,24}$)/)
  # end

  private

  def check_length
    @password.length.between?(6,24)
  end

  def check_uppercase
    @password.downcase != @password
  end

  def check_downcase
    @password.upcase != @password
  end

  def check_digits
    !@password[/\d/].nil?
  end

  def check_special_chars
    @password_array.each do |char|
      return true if %w{! @ # $ % & * + = : ; ? < >}.include?(char)
    end
    false
  end

  def check_max_chars_amount
    @password_array.each { |char| return false if @password_array.count(char) > 2 }
    true
  end
end
