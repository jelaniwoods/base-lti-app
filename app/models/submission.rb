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
  after_update_commit :pass_back_grade

  belongs_to :resource
  belongs_to :enrollment
  
  has_one    :user, through: :enrollment
  has_one    :context, through: :resource

  def pass_back_grade
    provider = IMS::LTI::ToolProvider.new(
      context.credential.consumer_key,
      context.credential.consumer_secret,
      enrollment.launches.last.payload,
    )

    provider.post_replace_result!(score) if provider.outcome_service?
  end
end
