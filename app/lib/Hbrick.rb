class Hbrick
  def initialize
    @brick = {}
  end

  def add_packet(symbol,variable)
    if !symbol.nil? && symbol.class == Symbol
      @brick[symbol] = variable
    end
  end

  def export
    @brick
  end
end
