class CountElements
  def initialize(array)
    @array = array
  end

  def perform
    counted_hash = @array.uniq.map {|e| [e,0] }.to_h
    @array.uniq.each { |elem| counted_hash[elem] = @array.count(elem) }
    counted_hash
  end
end
