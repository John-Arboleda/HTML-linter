require_relative 'html_items'
require 'strscan'
require 'colorize'

module TagsAnalysis
  def tags_analysis(parsed_doc)
    tags_analysis_array = []
    parsed_doc.each_with_index do |item, index|
      tags_analysis_array += valid_tag?(item, index)
      item.reset
      tags_analysis_array += attribute_errors(item, index)
    end
    tags_analysis_array
  end

  def valid_tag?(item, index)
    result_array = []
    complete_tags = HtmlItems.new.complete_tags
    while item.check_until(%r{<(?!/)})
      item.skip_until(%r{<(?!/)})
      col = item.pos
      tag = item.scan(/\w+/)
      next if tag.nil?

      if tag != tag.downcase
        result_array.push('Warning: '
          .colorize(:yellow) + "line #{index + 1} col #{col}: tag #{tag} is not lowercase")
      end
      if complete_tags.none?(tag.downcase)
        result_array.push('Error: '
          .colorize(:red) + "line #{index + 1} col #{col}: invalid tag #{tag}")
      end
    end
    result_array
  end

  def attribute_errors(item, index)
    result_array = []
    while item.check_until(/\s(?=\w+\s*=\s*"*)/)
      item.skip_until(/\s(?=\w+\s*=\s*"*)/)
      col = item.pos
      attrb = item.scan(/\w+/)
      next if attrb.nil?

      downcase_message = 'Warning: '.colorize(:yellow) +
                         "line #{index + 1} col #{col}: attribute #{attrb} is not lowercase"
      result_array << downcase_message if attrb != attrb.downcase
      result_array += attrb_whitespace?(item, index)
    end
    result_array
  end

  def attrb_whitespace?(item, index)
    spaces_errors = []
    if item.check(/\s+(?==\s*"*)/)
      col = item.pos
      item.skip(/\s+(?==\s*"*)/)
      spaces_errors.push('Suggestion: '.colorize(:blue) +
        "line #{index + 1} col #{col}: avoid whitespace after attribute")
    end
    if item.check(/\s*=(?=\s+"*)/)
      col = item.pos
      item.skip(/\s*=(?=\s+"*)/)
      spaces_errors.push('Suggestion: '.colorize(:blue) +
        " line #{index + 1} col #{col}: avoid whitespace after attribute")
    end
    spaces_errors
  end
end
