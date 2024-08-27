# == Schema Information
#
# Table name: todo_items
#
#  id         :bigint           not null, primary key
#  done       :boolean
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  scope_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_todo_items_on_scope_id  (scope_id)
#  index_todo_items_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Todo::Item, type: :model do
  subject { FactoryBot.create(:item) }

  describe 'attributs' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without done' do
      subject.done = nil

      expect(subject).not_to be_valid
    end

    it 'is not valid without name' do
      subject.name = nil

      expect(subject).not_to be_valid
    end
  end
end
