class Birthday
  def today?(bday, month)
    date_to_day(bday, month) == time_to_day(Time.now)
  end

  def time_until_bday(bday, month)
    days = date_to_day(bday, month) - time_to_day(Time.now)
    days.negative? ? 365 - days.abs : days
  end

  private

  def time_to_day(time)
    time.strftime('%j').to_i
  end

  def date_to_day(day, month)
    time_to_day(Time.parse("#{month}-#{day}"))
  end
end