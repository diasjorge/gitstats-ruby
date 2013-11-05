class FileStats
  attr_reader :count
  attr_reader :size

  def initialize
    @count = 0
    @size = 0
  end

  def update(file)
    @count += 1
    @size += file[:size]
  end

  def to_h
    {
      count: count,
      size: size
    }
  end

  def to_json(*a)
    to_h.to_json(*a)
  end
end
