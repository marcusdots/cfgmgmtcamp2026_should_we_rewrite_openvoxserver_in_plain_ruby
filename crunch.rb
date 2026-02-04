def help()
  puts "usage: #{$0} [|thread|ractor] count"
end

def crunch()
  40_000_000.times do |i|
    Math.sqrt i
  end
end

if ARGV.length < 1
  help
  exit 1
end

count=ARGV[-1].to_i
modell=""
if ARGV.length > 1
  modell=ARGV[0]
  raise "unsupported mode" unless modell.match %r{thread|ractor}
end

#puts "running #{$0} #{modell} #{count}"

case modell
  when ""
    count.times do |i|
      print "running single thread ##{i}\n"
      crunch
    end
  when "thread"
    thread_list = Array.new
    count.times do |i|
      thread_list << Thread.new {
         print "running thread ##{i}\n"
         crunch
      }
    end
    thread_list.each do |t|
      t.join()
    end
  when "ractor"
    ractor_list = Array.new
    count.times do |i|
      ractor_list << Ractor.new(i) do |i|
        print "running ractor ##{i}\n"
        crunch
      end
    end
    ractor_list.each do |r| r.join; end
end


