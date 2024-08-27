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
FactoryBot.define do
  factory :scope, :class => Todo::Scope do
    name { Faker::Name.unique.name }
    nickname { Faker::Name.initials }
  end
end
