require "http"
require "zip"
require "csv"
require "json"

class GouvDataExtractor
    def self.extract(link)
      assoList = []
      response = HTTP.get(link)
      # puts "extract"
      if response.status.success?
        zip = response.to_s
        puts "if success"
        Zip::InputStream.open(StringIO.new(zip)) do |file|
          # puts "zip"
          while (entry = file.get_next_entry)
            # puts "entry"
            # Parsing of file in UTF-8 BOM with ; as separators and first line header.
            CSV.parse(file.read.force_encoding("UTF-8").sub("\uFEFF", ""), headers: true, col_sep: ";") do |row|
              association = AssociationFactory.createFromDataGouvCSVLine(row.to_h)
              if !association.nil?
                assoList.push(association)
              end
            end
          end
        end
      end
      assoList
    end
end
