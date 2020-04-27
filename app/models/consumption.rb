# == Schema Information
#
# Table name: consumptions
#
#  id               :uuid             not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  credential_id    :uuid
#  tool_consumer_id :uuid
#
class Consumption < ApplicationRecord
  belongs_to :credential
  belongs_to :tool_consumer
end
