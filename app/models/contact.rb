class Contact < ApplicationRecord
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
          contact = find_by_id(row["id"]) || new
          contact.attributes = row.to_hash.slice(*['first_name', 'last_name', 'email', 'phone', 'address_line_1', 'city', 'province', 'country_name', 'postcode', 'date_added', 'how_did_you_hear_about_us', 'what_is_your_budget', 'what_is_your_favourite_color'])
          contact.save!
        end
    end    
    def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
        when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
        else raise "Unknown file type: #{file.original_filename}"
        end
      end  
end
