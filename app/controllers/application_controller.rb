class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_resource, only: [:show, :edit, :update]
  before_filter :include_module

  private
      def set_resource
          @resource_name 	= params[:controller].slice(/[\w]+$/).singularize
          @resource_const 	= @resource_name.titleize.gsub(" ", "").constantize

          @resource         = @resource_const.find(params[:id] || params[(@resource_name + "_id").to_sym])
          instance_variable_set("@#{@resource_name}", @resource)
      end

      def include_module
          controller_module   = (params[:controller] + "_helper").camelize
          if defined? controller_module.constantize
              self.class.send(:include, controller_module.constantize)
              self.class.send(:helper, controller_module.constantize)
          end
      end
end
