require 'rails_helper'

RSpec.describe DietPlan, type: :model do
  describe 'Validation test' do
    context 'If the calories field is empty' do
      it 'Can\'t register an diet_plan without calories' do
        diet_plan = DietPlan.new(calories: '', proteins: '600', carbohydrates: '500',
                          fats: '15', user_id: '1')
        expect(diet_plan).not_to be_valid
      end
    end
    context 'If the proteins field is empty' do
      it 'Can\'t register an diet_plan without proteins' do
        diet_plan = DietPlan.new(calories: '1800', proteins: '', carbohydrates: '500',
                          fats: '15', user_id: '1')
        expect(diet_plan).not_to be_valid
      end
    end
    context 'If the carbohydrates field is empty' do
      it 'Can\'t register an diet_plan without carbohydrates' do
        diet_plan = DietPlan.new(calories: '3000', proteins: '1000', carbohydrates: '',
                          fats: '15', user_id: '1')
        expect(diet_plan).not_to be_valid
      end
    end
    context 'If the fats field is empty' do
      it 'Can\'t register an diet_plan without fats' do
        diet_plan = DietPlan.new(calories: '2300', proteins: '1000', carbohydrates: '1000',
                          fats: '', user_id: '1')
        expect(diet_plan).not_to be_valid
      end
    end
  end
end
