class Birthday
  def initialize(birthday, birth_month)
    @birthday    = birthday
    @birth_month = birth_month
  end

  def message
    today?(birthday, birth_month) ? 'Happy Birthday ' :
    "Your birthday will be in #{days_until_bday(birthday, birth_month)} "
  end

  private

  attr_reader :birthday, :birth_month

  def today?(day, month)
    date_to_day(day, month) == time_to_day(Time.now)
  end

  def days_until_bday(day, month)
    days = date_to_day(day, month) - time_to_day(Time.now)
    days = 365 - days.abs if days.negative?
    days == 1 ? "#{days} day" : "#{days} days"
  end

  def time_to_day(time)
    time.strftime('%j').to_i
  end

  def date_to_day(day, month)
    time_to_day(Time.parse("#{month}-#{day}"))
  end
end
