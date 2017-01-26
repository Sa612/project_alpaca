class Course < ActiveRecord::Base
    has_attached_file :picture,
         styles: { small: "750x420", thumb: "100x56>" }, default_url: "/images/:style/missing.png"

    validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    # SEARCH ENGINE SECTION
    searchable do
        text :name, :description
    end
    # END - SEARCH ENGINE SECTION
end
