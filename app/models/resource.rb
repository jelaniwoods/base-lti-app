# == Schema Information
#
# Table name: resources
#
#  id         :uuid             not null, primary key
#  id_from_tc :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  context_id :uuid
#
class Resource < ApplicationRecord
  belongs_to :context
  has_many :launches, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :submissions, dependent: :destroy
end
