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
class Todo::ScopeSerializer
  include JSONAPI::Serializer
  
  set_key_transform :camel_lower

  attributes :id, :name, :nickname
end
