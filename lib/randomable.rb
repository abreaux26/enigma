module Randomable
  def random_number
    rand(10 ** 5).to_s.rjust(5,'0')
  end
end
