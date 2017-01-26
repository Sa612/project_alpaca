module ApplicationHelper

    # Layout partial path helper for 'application_v1' layout
    def partial_application_v1(name)
        return 'layouts/application_v1_partial/' + name
    end

    # Layout partial path helper for 'admin' layout
    def partial_admin(name)
        return 'layouts/admin/' + name
    end

    # Assets pipeline file path helper
    def assets_application_v1(name)
        return 'layouts/v1/controllers/' + name
    end
end
