class Admin::BaseController < ApplicationController
    DEFAULT_EMPTY_CONTROLLER_ACTIONS = ['index', 'edit', 'show']

    layout 'admin'

	before_filter  :set_resources, only: [:index]
	after_filter   :set_notice,    only: [:create, :update]

    # Defile defalt empty methods
    DEFAULT_EMPTY_CONTROLLER_ACTIONS.each do |action_name|
        define_method action_name do
        end
    end

    # Define default new method
    def new
        @resource_name 	= params[:controller].slice(/[\w]+$/).singularize
        @resource_const = @resource_name.titleize.gsub(" ", "").constantize

        @resource       = @resource_const.new
        instance_variable_set("@#{@resource_name}", @resource)
    end

    def create
        @resource_name 	= params[:controller].slice(/[\w]+$/).singularize
        @resource_const = @resource_name.titleize.gsub(" ", "").constantize

        @resource       = @resource_const.create(resource_params)
        redirect_to send("edit_admin_#{@resource_name}_path", @resource)
    end

    def update
        @resource.update_attributes(resource_params)
        redirect_to send("edit_admin_#{@resource_name}_path", @resource)
    end

	private
		def set_resources
			@resource_name 	= params[:controller].slice(/[\w]+$/).singularize
			@resource_const = @resource_name.titleize.gsub(" ", "").constantize

			@search			= @resource_const.search(params[:q])

			@resources		= (params[:q].present?) ? @search.result : @resource_const.all

			@resources		= @resources.page(params[:page] || 1).per(params[:per_page] || Kaminari.config.default_per_page)

			instance_variable_set("@#{@resource_name.pluralize}", @resources)
		end

        def set_notice
            flash[:notice] = @resource
        end
end
