module StatsHash
  def method_missing(method, *args, &block)
    @hash.send(method, *args, &block)
  end

  def each_sorted
    @hash.keys.sort.each do |key|
      yield key, @hash[key]
    end
  end

  def to_h
    hash = defined?(super) ? super : {}
    hash.merge(@hash)
  end

  def to_json(*a)
    to_h.to_json(*a)
  end
end
