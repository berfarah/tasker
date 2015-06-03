# Additional ways to parse time
class Integer
  def human_time
    hours, rest = divmod(3600)
    minutes, seconds = rest.divmod(60)
    { hours: hours,
      minutes: minutes,
      seconds: seconds }.map do |k, v|
      k = k[0..-2] if  v == 1
      "#{v} #{k}" if v > 0
    end.compact.join(', ').sub(/,([^,]+)$/, ' and\1')
  end
end
