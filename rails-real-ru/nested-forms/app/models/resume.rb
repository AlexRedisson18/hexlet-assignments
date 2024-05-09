# frozen_string_literal: true

class Resume < ApplicationRecord
  validates :name, presence: true
  validates :contact, presence: true

  # BEGIN
  has_many :educations, foreign_key: 'resume_id', class_name: 'ResumeEducation', inverse_of: :resume,
                        dependent: :destroy
  has_many :works, foreign_key: 'resume_id', class_name: 'ResumeWork', inverse_of: :resume, dependent: :destroy

  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :works, reject_if: :all_blank, allow_destroy: true
  # END
end
