class ContactsController < ApplicationController
    def index
        @allcontacts = Contact.all
        @contacts = Contact.where.not(email: nil, 
                                      phone: nil, 
                                      address_line_1: nil, 
                                      city: nil, 
                                      province: nil, 
                                      country_name: nil,
                                      postcode: nil, 
                                      date_added: nil )
        @uniquecontacts = @contacts.select("DISTINCT ON (email) *").order("email, date_added DESC")
        @invalidcontacts = @allcontacts - @contacts
        @duplicates = @contacts - @uniquecontacts
    end
end
