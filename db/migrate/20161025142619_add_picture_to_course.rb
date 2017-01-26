class AddPictureToCourse < ActiveRecord::Migration
    def up
        add_attachment :courses, :picture
    end

    def down
        remove_attachment :courses, :picture
    end
end
