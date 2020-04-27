# == Schema Information
#
# Table name: launches
#
#  id               :uuid             not null, primary key
#  payload          :jsonb            not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  context_id       :uuid
#  enrollment_id    :uuid
#  resource_id      :uuid
#  tool_consumer_id :uuid
#  user_id          :uuid
#
class Launch < ApplicationRecord
  belongs_to :context
  belongs_to :resource
  belongs_to :enrollment
  belongs_to :tool_consumer
  belongs_to :user

  has_one :credential, through: :tool_consumer, source: :credentials
end
