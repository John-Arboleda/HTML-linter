require_relative 'html_items.rb'
require 'strscan'
require 'colorize'

module DocAnalysis
  
  def basic_analysis(parsed_doc)
    basic_analysis_array = []
    doctype_regex = /^<!DOCTYPE(\s*)(.*)(>)/
    doctype_exist = parsed_doc.any? { |i| i.scan(doctype_regex) }
    basic_analysis_array.push("DOCTYPE tag not found") if !doctype_exist
    basic_analysis_array
  end

  def tags_analysis(parsed_doc)
    complete_tags = HtmlItems.new().complete_tags
    tags_analysis_array = []
    parsed_array.each_with_index do |item, index| 
      while item.check_until(/<(?!\/)/)
        item.skip_until(/<(?!\/)/)
        col = item.pos
        tag = item.scan(/\w+/)
        next if tag.nil?
        if tag != tag.downcase
          tags_analysis_array.push("Warning: line #{index + 1} col #{col}: tag #{tag} is not lowercase")
        end
        if complete_tags.none?(tag.downcase)
          tags_analysis_array.push("Error: line #{index + 1} col #{col}: invalid tag #{tag}")
        end
      end
    end
    tags_analysis_array
  end
end

  


