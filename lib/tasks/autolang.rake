# coding: utf-8

# Copyright © 2008 Chris Blackburn <cblackburn : at : cbciweb.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# “Software”), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.

require 'autolang'

namespace :autolang do
  desc "Translate strings into a new language."
  task :translate do
    if !ENV['L'] or !ENV['POT_FILE']
      puts "Usage: L=language_code POT_FILE=po/my_app.pot rake autolang:translate"
      puts "  language_codes are 2 letter ISO 639 codes "
      puts "  if you do not have a pot file, use gettext and updatepo first (google helps...)"
      puts ""
      puts "Example: Translate all msgids into Spanish."
      puts "  L=es POT_FILE=po/my_app.pot rake autolang:translate"
      exit
    end
    
    pot_file = ENV['POT_FILE']
    po_file = File.join(File.dirname(pot_file),ENV['L'],"#{ENV['L']}.po")

    # If the directory doesn't exist created it
    lang_dir = File.dirname(po_file)
    if !FileTest.exist?(lang_dir)
      puts "Creating new language directory: #{lang_dir}"
      Dir.mkdir(lang_dir)
    end

    # copy the main po file if it doesn't exist
    if !FileTest.exist?(po_file)
      puts "Generating new language file: #{po_file}"
      `msginit -i #{pot_file} -o #{po_file} -l #{ENV['L']}`
    end

    # translate existing po file
    lines = []
    msgid = ""
    msgstr = ""
    puts "Translating..."
    File.foreach(po_file) do |line|
      #read string to translate
      if msgid = Autolang.extract_msgid(line)
        puts msgid
        puts msgstr = Autolang.translate(msgid)
        puts '-'*80

      #replace translation
      elsif line =~ /^msgstr/
        unless msgstr.empty?
          line = "msgstr \"#{msgstr}\""
        end
      end

      #output to po file
      lines << line.strip
    end

    #write new translation file
    File.open(po_file, "w+") do |file|
      file.write(lines*"\n")
    end
  end
end