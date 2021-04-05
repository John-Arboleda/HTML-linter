require 'strscan'
require 'colorize'

module DocAnalysis
  
  def doctype?(parsed_doc)
    doctype_regex = /<!DOCTYPE(\s*)(.*)(>)/
    doctype_exist = parsed_doc.any? { |i| i.scan(doctype_regex) }
    if doctype_exist
      return "DOCTYPE tag found"
    else
      return "DOCTYPE tag not found"
    end
  end

  
  #   # unless doc.match(/<!DOCTYPE html>/)
  #   #   self.result.push("DOCTYPE tag not found")
  #   #   @@successful &&= true
  #   # end
  
  #   # Doctype must be the first tag / match the first tag different
  #   doctype_pos = doc =~ /<!DOCTYPE html>/
  #   puts doctype_pos
  #   first_diff_doctype = doc =~ /<!DOCTYPE html>/
  #   puts first_diff_doctype

  #   # Doctype html must be declare
  # end

  # def print_succesful
  #   if @@successful
  #     puts "Analysis Successful"
  #   else
  #     puts self.result
  #   end
  # end

end

  


