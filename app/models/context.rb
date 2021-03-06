# == Schema Information
#
# Table name: contexts
#
#  id            :uuid             not null, primary key
#  id_from_tc    :string
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  credential_id :uuid
#
class Context < ApplicationRecord
  has_many :launches, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :resources, dependent: :destroy

  belongs_to :credential
end
