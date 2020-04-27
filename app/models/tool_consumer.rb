# == Schema Information
#
# Table name: tool_consumers
#
#  id                     :uuid             not null, primary key
#  instance_contact_email :string
#  instance_description   :string
#  instance_guid          :string
#  instance_name          :string
#  instance_url           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class ToolConsumer < ApplicationRecord
  has_one :launch, dependent: :destroy
  has_many :consumptions, dependent: :destroy
  has_many :credentials, through: :consumptions

  validates :instance_guid, presence: true, uniqueness: true
end
