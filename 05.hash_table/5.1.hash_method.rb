class HashTable
  @hash_table = nil
  @hash_size = 0

  def initialize(initialize_size=5)
    @hash_table = Array.new(initialize_size)
    @hash_size = initialize_size
  end

  def hash(key)
    hash_value = 0
    key.each_char do | c |
      hash_value += c.ord
    end
    return (hash_value % @hash_size)
    #return 0
  end

  def get(key)
    value = nil
    hash_value = hash(key)
    nodes = @hash_table[hash_value]
    if not nodes.nil? then
      node = nodes.get_node(key)
      value = node.nil? ? nil : node.value
    end
    return value
  end

  def put(key, value)
    hash_value = hash(key)
    lead_node = @hash_table[hash_value]
    if lead_node.nil? then
      @hash_table[hash_value] = Node.new(key, value)
    else
      lead_node.set_node(key, value)
    end
  end

  def rehash()

  end
end

class Node
  @key = nil
  attr_accessor :key
  @value = nil
  attr_accessor :value
  @next_node = nil
  attr_accessor :next_node

  def initialize(key, value)
    @key = key
    @value = value
  end

  def get_node(key)
    if @key == key then
      return self
    elsif @next_node.nil? then
      return nil
    else
      return @next_node.get_node(key)
    end
  end

  def set_node(key, value)
    exist_node = get_node(key)
    if exist_node.nil? then
      @next_node = Node.new(key, value)
    else
      exist_node.key = key
      exist_node.value = value
    end
  end
end

ht = HashTable.new
ht.put("hoge", "hoge1")
ht.put("hoge", "hoge2")
ht.put("fuga", "fuga1")
ht.put("barbar", "bar1")

p "== 結果 ===================="
p ht
p "key=hoge  /value=#{ht.get("hoge")}"
p "key=fuga  /value=#{ht.get("fuga")}"
p "key=barbar/value=#{ht.get("barbar")}"
