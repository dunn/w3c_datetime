class DateTime
  def to_w3c_datetime
    strftime '%FT%T.%L%:z'
  end
end
