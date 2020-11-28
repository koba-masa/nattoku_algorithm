# 問題4.1
def sum(list)
  total = 0
  if not list.empty? then
    total = list.shift + sum(list)
  end
  return total
end

# 問題4.2
def size(list)
  total = 0
  if not list.empty? then
    list.shift
    total = 1 + size(list)
  end
  return total
end

# 問題4.3
def max(list)
  max_value = nil
  if not list.empty? then
    now_value = list.shift
    next_value = max(list)
    next_value = 0 if next_value.nil?
    max_value = now_value < next_value ? next_value : now_value
  end
  return max_value
end

# 問題4.4


list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p "target：#{list}"
p "sum   ：#{sum(list.dup)}"
p "size  ：#{size(list.dup)}"
p "max   ：#{max(list.dup)}"
