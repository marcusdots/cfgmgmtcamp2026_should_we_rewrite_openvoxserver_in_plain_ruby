require 'concurrent-ruby'

def crunch()
  40_000_000.times do |i|
    Math.sqrt i
  end
end

numbers = (1..10).to_a

pool = Concurrent::FixedThreadPool.new(16)

futures = numbers.map do |n|
  Concurrent::Future.execute(executor: pool) do
    crunch
  end
end

# Wait for all tasks and collect results
results = futures.map(&:value)

pool.shutdown
pool.wait_for_termination

puts results.inspect
