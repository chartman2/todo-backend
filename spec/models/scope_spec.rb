# == Schema Information
#
# Table name: todo_scopes
#
#  id         :bigint           not null, primary key
#  name       :string
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Todo::Scope, type: :model do
  subject { FactoryBot.create(:scope) }

  describe 'attributs' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without name' do
      subject.name = nil

      expect(subject).not_to be_valid
    end

    it 'is not valid without nickname' do
      subject.nickname = nil

      expect(subject).not_to be_valid
    end
  end
end
