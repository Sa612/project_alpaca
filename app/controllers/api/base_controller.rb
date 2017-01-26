class Api::BaseController < ApplicationController
    before_filter  :set_resources, only: [:index]

    private
		def set_resources
			@resource_name 	= params[:controller].slice(/[\w]+$/).singularize
			@resource_const = @resource_name.titleize.gsub(" ", "").constantize

			@search			= @resource_const.search(params[:q])

			@resources		= (params[:q].present?) ? @search.result : @resource_const.all

			@resources		= @resources.page(params[:page] || 1).per(params[:per_page] || Kaminari.config.default_per_page)

			instance_variable_set("@#{@resource_name.pluralize}", @resources)
		end
end
