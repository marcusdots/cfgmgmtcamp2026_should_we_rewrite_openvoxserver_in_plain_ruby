byte = 1
kilobyte = 1024 * byte
megabyte = 1024 * kilobyte
gigabyte = 1024 * megabyte

string = 'a' * megabyte
max = 20 * gigabyte
an_array=string.split('')
puts an_array.inspect

while an_array.length < max
  an_array = an_array+an_array
  puts an_array.length
  puts an_array.length.to_s.reverse.gsub( %r@(\d{3})@, '\1_').reverse
  if an_array.length >= 1000 * megabyte
    puts "sleeping on purpose"
    sleep 10 
  end
end

