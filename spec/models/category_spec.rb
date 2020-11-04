require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validation test' do
    context 'If the title field is empty' do
      it 'Can\'t register an category without title' do
        category = Category.new(title: '', user_id: '1')
        expect(category).not_to be_valid
      end
    end
  end
end
