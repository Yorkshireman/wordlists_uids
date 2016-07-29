class Wordlist < ActiveRecord::Base
  before_save :ensure_uuid_generation
  validate :uuid_not_changed
  self.primary_key = 'uuid'

  private

  def ensure_uuid_generation
    self.uuid ||= SecureRandom.uuid if new_record?
  end

  def uuid_not_changed
    return unless uuid_changed? && persisted?
    errors.add(:uuid, "can't be updated")
  end
end
