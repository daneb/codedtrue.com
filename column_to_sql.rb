# Converts a column format file into a SQL string for use in an "IN"
# For example: select * from x where y IN ({result})
# 
if ARGV.empty?
	puts "Please provide a column spaced file to convert to a SQL string"
else 	
	sql_string = ""
	column_file = ARGV.last 
	file = File.open(column_file)
	file.each do |column_item|
		sql_string = (sql_string + "'" + column_item.chomp + "',")
	end

	sql_string.chop!	
	File.open('result.txt', 'w') { |file| file.write(sql_string) }
end