class Wordlist < ActiveRecord::Base
  before_save :ensure_uuid_generation
  validate :uuid_not_changed
  self.primary_key = 'uuid'

  private

  def ensure_uuid_generation
    self.uuid ||= SecureRandom.uuid if self.new_record?
  end

  def uuid_not_changed
    if self.uuid_changed? and self.persisted?
      self.errors.add(:uuid, "can't be updated")
    end
  end
end
