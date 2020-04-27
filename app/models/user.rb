# == Schema Information
#
# Table name: users
#
#  id             :uuid             not null, primary key
#  first_name     :string
#  id_from_tc     :string
#  last_name      :string
#  preferred_name :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class User < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :launches, dependent: :destroy
end
