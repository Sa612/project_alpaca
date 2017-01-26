class Admin::CoursesController < Admin::BaseController
    # List of parameters allowed to change the active record fields
    STRONG_PARAMS = [
        :name, :description, :rating, :category_id, :sub_category_id, :status, :picture
    ]

    private
    def resource_params
      params.require(:course).permit(STRONG_PARAMS)
    end
end
