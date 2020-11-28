def quick_sort(before_list)
  return partitioning(before_list)
end

def partitioning(before_list)
  # ソートが必要ない場合、元の配列を返却する
  # 配列の要素数が2でない場合、ソートする
  if before_list.length < 2 then
    return before_list
  elsif before_list.length == 2 then
    return sort(before_list)
  end

  pibot = before_list.shift
  smaller = []
  larger = []

  before_list.each do | element |
    if element < pibot then
      smaller.push(element)
    else
      larger.push(element)
    end
  end
  smaller = partitioning(smaller)
  larger = partitioning(larger)
  return smaller.push(pibot, larger).flatten
end

def sort(list)
  if list[0] < list[1] then
    return [list[0], list[1]]
  else
    return [list[1], list[0]]
  end
end

list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].shuffle
p list
p quick_sort(list)
