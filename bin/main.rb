require_relative '../lib/parsed_doc.rb'


analysis = ParsedDoc.new("index.html")
# puts analysis.parsed_array
puts analysis.result
# analysis.doctype?(doc)
# analysis.print_succesful