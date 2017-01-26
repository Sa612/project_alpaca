class AddStatusToWord < ActiveRecord::Migration
    def change
        add_column :words, :status, :string, :default => Word::STATUSES.keys[0].to_s
    end
end
