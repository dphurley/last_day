require 'rails_helper'

RSpec.feature 'HomePages', type: :feature do

  describe 'when viewing all of the users on the home page' do
    before do
      create_four_students_in_database
    end

    it 'shows all of the users when the page loads' do
      given_i_am_on_the_home_page
      when_the_page_loads
      then_i_should_see_all_of_the_students
      and_i_should_see_the_list_of_students_by_name_and_age
    end
  end


  private

  def create_four_students_in_database
    Student.delete_all

    Student.create(
        name: 'Josh',
        age: 2
    )

    Student.create(
        name: 'Ray',
        age: 3
    )

    Student.create(
        name: 'Rush',
        age: 4
    )

    Student.create(
        name: 'Felicia',
        age: 5
    )
  end

  def given_i_am_on_the_home_page
    visit '/'
  end

  def when_the_page_loads
    #   page should have already loaded at this point
  end

  def then_i_should_see_all_of_the_students
    student_list = page.find_by_id('student-list')
    expect(student_list).to be_truthy
  end

  def and_i_should_see_the_list_of_students_by_name_and_age
    student_elements = page.all('#student')

    expect(student_elements.size).to eq 4

    first_student = student_elements.first

    first_student_name = first_student.find('#student-name').text
    expect(first_student_name).to eq 'Josh'

    first_student_age = first_student.find('#student-age').text
    expect(first_student_age).to eq '2'
  end

end
