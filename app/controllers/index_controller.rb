class IndexController < ApplicationController

  def index
    @student_list = Student.all


  end

end
