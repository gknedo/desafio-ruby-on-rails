class BatchImport < ApplicationRecord
  before_create :set_defaults

  enum status: {
    processing: 1,
    completed: 2
  }

  private
  def set_defaults
    self.status ||= 1
  end
end
