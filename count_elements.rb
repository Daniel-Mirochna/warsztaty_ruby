class CountElements
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def perform
    array.tally
  end
end
