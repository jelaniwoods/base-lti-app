# == Schema Information
#
# Table name: enrollments
#
#  id         :uuid             not null, primary key
#  roles      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  context_id :uuid
#  user_id    :uuid
#
class Enrollment < ApplicationRecord
  belongs_to :context
  has_many :launches, dependent: :destroy
  has_many :submissions, dependent: :destroy
  belongs_to :user
end
