# frozen_string_literal: true

class BatchImport < ApplicationRecord
  before_create :set_defaults

  enum status: {
    processing: 1,
    completed: 2
  }

  def import! file
    File.open(file.path, "r").each_line do |line|
      true
    end
  end

  private

  def set_defaults
    self.status ||= 1
  end
end
