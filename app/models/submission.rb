# == Schema Information
#
# Table name: submissions
#
#  id            :uuid             not null, primary key
#  score         :float            default(0.0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  enrollment_id :uuid
#  resource_id   :uuid
#
class Submission < ApplicationRecord
  belongs_to :resource
  belongs_to :enrollment
end
