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
FactoryBot.define do
  factory :item, :class => Todo::Item do
    done { Faker::Boolean.boolean }
    name { Faker::Name.unique.name }
    scope { FactoryBot.create(:scope) }
    user { FactoryBot.create(:user) }
  end
end
