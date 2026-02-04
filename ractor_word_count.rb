wordcount = Hash.new(0)
portlist = []

ARGV.each do |infile|
  port = Ractor::Port.new
  portlist << port
  Ractor.new( infile, port) do |open_this_file, report_results_here|
    filewordcount=Hash.new(0)
    #                     [Array].                      [[Array]].[Array].
    IO.readlines( open_this_file).map { _1.split( %r.[^\w\d]. )} .flatten.each do |word_or_number|
      filewordcount[word_or_number] += 1
    end
    report_results_here.send filewordcount
  end
end

portlist.each do |ractor_result|
  local_hash = ractor_result.receive
  local_hash.each do |k, v|
    wordcount[k] += v
  end
end

puts wordcount.inspect
