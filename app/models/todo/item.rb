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
module Todo
  class Item < ApplicationRecord
    # ----------------------------------
    # --- Relations ---
    # ----------------------------------
    belongs_to :user
    belongs_to :scope

    # ----------------------------------
    # --- Validations ---
    # ----------------------------------
    # Name
    validates :name, presence: { message: :required }
    validates :name,
              length: { in: 4..60, too_long: :tooLong,
                        too_short: :tooShort }
    # Done
    validates :done, inclusion: { in: [ true, false ] }
  end
end
