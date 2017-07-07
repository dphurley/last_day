class IndexController < ApplicationController

  def index
    @students = Student.all
  end

  def self.add_two_numbers(first_number, second_number)
    first_number + second_number
  end

end
