#Đề 3 - bài 1
#======================

#Get array with 
arr = Array.new(5) { |i| gets.chomp.to_i }

#Sum of array
p 'Sum of array'
p arr.sum

#Proc
proc_test = Proc.new do |i|
  if i == 6 or i == 7
    i
  else
    i * i
  end
end

arr.map! do |x|
  proc_test.call(x)
end

#Square
p 'Square'
p arr