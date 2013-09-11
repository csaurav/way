# Binary search algorithm implementation

class BinarySearch
  KEY_NOT_FOUND = -1  
  def initialize
    list = get_list
    min = 0
    max = list.length-1
    puts ""
    key = get_key
    
    value = binary_search(list,min,max,key)
    
    if value == KEY_NOT_FOUND
      puts "Key not found" 
    else
      puts "Key #{key} is present in position #{value}"
    end
  end
  
  def get_list
    puts "\nEnter list: \n"
    list = gets.chomp
    arr = list.split.map(&:to_i).sort
  end
  
  def get_key
    puts "\nEnter key to be searched: \n"  
    key = gets.chomp
    key.to_i
  end
  
  def binary_search(arr,min,max,key)
    return KEY_NOT_FOUND if (arr.empty? or (min > max))
    mid = mid_point(min,max)
    if arr[mid] > key
      binary_search(arr,min,mid-1,key)
    elsif arr[mid] < key
      binary_search(arr,mid+1,max,key)
    else
      # key has been found
      return mid
    end
  end
  
  #find the mid point in the array
  def mid_point(min,max)
    (min+max)/2
  end
end


bs = BinarySearch.new