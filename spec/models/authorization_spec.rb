require 'rails_helper'

RSpec.describe Authorization, type: :model do
  
  describe '#create_with_omniauth' do
    it 'is a class method' do
      expect(Authorization).to respond_to(:create_with_omniauth)
    end
    context 'it creates a valid Authorization' do
      let(:user) {FactoryGirl.create(:user)}
      let(:auth) {FactoryGirl.create(:valid_authorization, user: user)}
      
      it 'creates an Authorization with a provider' do
        expect(auth.provider).to eq("github")
        
      end
      it 'creates an Authorization with a uid' do
        expect(auth.uid).to eq('123456') 
      end 
      it 'creates an Authorization with a user_id' do
        expect(auth.user_id).to eq(user.id)
      end
    end
    context 'it creates an invalid Authorization' do
      let(:user) {User.new}
      it "is invalid without a user_id" do
        user.name = "SUNY Tester"
        user.email = "stester@binghamton.edu"
        user.id = {}
        auth = FactoryGirl.build(:authorization, user: user)
        expect(auth.user_id).to be_nil
      end
    end
  end 
end