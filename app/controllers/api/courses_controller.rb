class Api::CoursesController < Api::BaseController
    def index
        render json: [Course.first] * 20
    end
end
