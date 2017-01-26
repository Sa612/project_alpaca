class Word < ActiveRecord::Base
    STATUSES = {
        prefilled:  'Prefilled',
        pending:    'Pending',
        indexed:    'Indexed',
        refused:    'Refused'
    }
end
