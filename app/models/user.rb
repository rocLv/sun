# == Schema Information
#
# Table name: users
#
#  birthday   :date
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :birthday, presence: true
end
