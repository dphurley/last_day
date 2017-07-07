require 'rails_helper'

RSpec.describe IndexController, type: :controller do

  describe '#index' do
    render_views

    before do

      Student.delete_all

      allow(Student)
          .to receive(:all)
                  .with(any_args)
                  .and_return(
                      [
                          OpenStruct.new(
                              name: 'Clark',
                              age: 14
                          ),
                          OpenStruct.new(
                              name: 'Ben',
                              age: 12
                          ),
                          OpenStruct.new(
                              name: 'Monica',
                              age: 12
                          )
                      ]
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
      expect(response.body).to have_content('Clark')
      expect(response.body).to have_content('Ben')
      expect(response.body).to have_content('Monica')
    end

    it 'should render the student ages' do
      expect(response.body).to have_content('14')
      expect(response.body).to have_content('12')
      expect(response.body).to have_content('12')
    end

  end

  describe '#add_two_numbers' do

    it 'should return 4 for 2 + 2' do
      sum = described_class.add_two_numbers(2, 2)

      expect(sum).to eq 4
    end

  end

end
