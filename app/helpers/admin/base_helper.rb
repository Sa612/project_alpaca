module Admin::BaseHelper
    #
    # VIEWS OUTPUT HELPER METHODS
    #

    # Return date falue in string type and with default format: dd-mm-yyyy
    def date(date, format='%d-%m-%Y')
        return date ? date.strftime(format) : '---'
    end
end
