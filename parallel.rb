require 'parallel'

def crunch()
  40_000_000.times do |i|
    Math.sqrt i
  end
end

count = (1..10).to_a

results = Parallel.map( count , in_processes: 10) do |item|
  crunch
end
