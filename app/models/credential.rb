# == Schema Information
#
# Table name: credentials
#
#  id               :uuid             not null, primary key
#  consumer_key     :string
#  consumer_secret  :string
#  enabled          :boolean          default(TRUE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  administrator_id :uuid
#
class Credential < ApplicationRecord
  belongs_to :administrator
  has_many :consumptions, dependent: :destroy

  has_many :tool_consumers, through: :consumptions
  has_many :launches, through: :tool_consumers

  has_secure_token :consumer_key
  has_secure_token :consumer_secret

  def create_tool_provider(params = {})
    IMS::LTI::ToolProvider.new(consumer_key, consumer_secret, params)
  end
end
