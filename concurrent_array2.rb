require 'concurrent'

numbers = (1..10_000).to_a

result = Concurrent::Promises.map( numbers ) do |i|
  i*i
end

puts result.inspect
