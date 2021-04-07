require_relative '../lib/parsed_doc.rb'
require_relative '../lib/html_items.rb'
require 'strscan'

analysis = ParsedDoc.new("index.html")

puts analysis.result

#p complete_tags = HtmlItems.new().complete_tags

# parsed_array = analysis.parsed_array

#<(?!\/)\w+\s

# tags_array = HtmlItems.new().complete_tags
# item = parsed_array[23]

# item.skip_until(/\s(?=\w+="*)/)
# p item.scan(/\w+/)
# item.skip_until(/\s(?=\w+="*)/)
# p item.scan(/\w+/)
# item.skip_until(/\s(?=\w+="*)/)
# p item.scan(/\w+/)

#parsed_array.each_with_index do |item, index| 
# if item.check_until(/(?<=\s)\w+(?=="*)/)
#   item.skip_until(/<(?!\/)/)
#   col = item.pos
#   tag = item.scan(/\w+/)
#   if tag != tag.downcase
#     puts "Warning: line #{index + 1} col #{col}: tag #{tag} is not lowercased"
#   end
#   if tags_array.none?(tag.downcase)
#     puts "Error: line #{index + 1} col #{col}: invalid tag #{tag}"
#   end
# end
#end



