# frozen_string_literal: true

class Task < ApplicationRecord
  # BEGIN
  belongs_to :user
  belongs_to :status
  # END
end
