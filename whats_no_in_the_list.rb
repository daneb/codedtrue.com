if ARGV.empty?
  puts "Please input a source file to compare against a destination for missing contents"
else
  array_not_in_dest = []
  source = ARGV.first
  compare = ARGV.last
  File.readlines(source).each { |line|
    match = false
    File.readlines(compare).each { |line_compare|
      if line.downcase == line_compare.downcase
        match = true
        break
      end
    }
    array_not_in_dest << line unless match
  }
  puts "Items not found in destination file:"
  array_not_in_dest.each { |item_not_found| puts item_not_found }
end
