class Random
  def number
    rand(10 ** 5).to_s.rjust(5,'0')
  end
end
