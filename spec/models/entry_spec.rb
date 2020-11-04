require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'Validation test' do
    context 'If the calories field is empty' do
      it 'Can\'t register an entry without calories' do
        entry = Entry.new(calories: '', proteins: '100', carbohydrates: '100',
                          fats: '5', meal_type: 'Breakfast', category_id: '1', user_id: '1')
        expect(entry).not_to be_valid
      end
    end
    context 'If the proteins field is empty' do
      it 'Can\'t register an entry without proteins' do
        entry = Entry.new(calories: '200', proteins: '', carbohydrates: '100',
                          fats: '5', meal_type: 'Breakfast', category_id: '1', user_id: '1')
        expect(entry).not_to be_valid
      end
    end
    context 'If the carbohydrates field is empty' do
      it 'Can\'t register an entry without carbohydrates' do
        entry = Entry.new(calories: '300', proteins: '100', carbohydrates: '',
                          fats: '5', meal_type: 'Breakfast', category_id: '1', user_id: '1')
        expect(entry).not_to be_valid
      end
    end
    context 'If the fats field is empty' do
      it 'Can\'t register an entry without fats' do
        entry = Entry.new(calories: '300', proteins: '100', carbohydrates: '100',
                          fats: '', meal_type: 'Breakfast', category_id: '1', user_id: '1')
        expect(entry).not_to be_valid
      end
    end
    context 'If the meal_type field is empty' do
      it 'Can\'t register an entry without meal_type' do
        entry = Entry.new(calories: '300', proteins: '100', carbohydrates: '100',
                          fats: '5', meal_type: '', category_id: '1', user_id: '1')
        expect(entry).not_to be_valid
      end
    end
    context 'If the category_id field is empty' do
      it 'Can\'t register an entry without category_id' do
        entry = Entry.new(calories: '100', proteins: '100', carbohydrates: '100',
                          fats: '5', meal_type: 'Breakfast', category_id: '', user_id: '1')
        expect(entry).not_to be_valid
      end
    end
  end
end
