module Admin::WordsHelper
    #
    # VIEWS OUTPUT HELPER METHODS
    #

    # Return the status in a label
    def admin_word_status_lbl(status)
        css_class = 'default'

        case status
        when Word::STATUSES.keys[0] # Prefilled
            css_class = 'defalt'
        when Word::STATUSES.keys[1] # Pending
            css_class = 'warning'
        when Word::STATUSES.keys[2] # Approved
            css_class = 'success'
        when Word::STATUSES.keys[3] # Refused
            css_class = 'danger'
        end

        "<span class='label label-#{css_class}'>#{Word::STATUSES[status.to_sym]}</span>".html_safe
    end
end
