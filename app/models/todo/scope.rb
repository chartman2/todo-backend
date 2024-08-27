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
module Todo
  class Scope < ApplicationRecord
    # ----------------------------------
    # --- Validations ---
    # ----------------------------------
    # Name
    validates :name, presence: { message: :required }
    validates :name,
              length: { in: 4..60, too_long: :tooLong,
                        too_short: :tooShort }
    # Nickname
    validates :nickname, presence: { message: :required }
    validates :nickname,
              length: { in: 1..15, too_long: :tooLong,
                        too_short: :tooShort }
  end
end
