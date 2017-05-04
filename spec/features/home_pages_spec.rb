require 'rails_helper'

RSpec.feature 'HomePages', type: :feature do

  scenario 'when I successfully view the students' do
    create_four_students_in_database

    visit '/index/index'

    given_i_am_on_the_home_page
    when_i_view_the_student_list
    then_i_should_see_the_list_of_students_by_name_and_age
  end

  private

  def given_i_am_on_the_home_page
    header = page.find_by_id('home-page-header')
    expect(header).to be_truthy
  end

  def when_i_view_the_student_list
    student_list = page.find_by_id('student-list')
    expect(student_list).to be_truthy
  end

  def then_i_should_see_the_list_of_students_by_name_and_age
    student_elements = page.all('#student')

    expect(student_elements.size).to eq 4

    first_student = student_elements.first

    first_student_name = first_student.find('#student-name').text
    expect(first_student_name).to eq 'Josh'

    first_student_age = first_student.find('#student-age').text
    expect(first_student_age).to eq '2'
  end

  def create_four_students_in_database
    Student.delete_all

    Student.create(
      name: 'Josh',
      age: 2,
      active: true
    )

    Student.create(
        name: 'Ray',
        age: 3,
        active: true
    )

    Student.create(
        name: 'Rush',
        age: 4,
        active: true
    )

    Student.create(
        name: 'Felicia',
        age: 5,
        active: true
    )
  end

end
