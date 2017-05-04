require 'rails_helper'

RSpec.describe IndexController, type: :controller do

  describe '#index' do
    render_views

    context 'successful student lookup' do

      before do
        Student.delete_all

        first_student = Student.create(
            name: 'Liam',
            age: 5,
            active: false
        )

        second_student = Student.create(
            name: 'Peter',
            age: 7,
            active: true
        )

        get :index
      end

      it 'should return a status of 200' do
        expect(response.status).to eq 200
      end

      it 'should render the student list header' do
        expect(response.body).to have_content('Here Are The Students')
      end

      it 'should render the student names' do
        expect(response.body).to have_content('Liam')
        expect(response.body).to have_content('Peter')
      end

      it 'should render the student ages' do
        expect(response.body).to have_content('5')
        expect(response.body).to have_content('7')
      end

    end

    context 'unsuccessful student lookup' do

    end
  end

end
