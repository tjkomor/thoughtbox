require 'uri'
class Link < ActiveRecord::Base
  include ActiveModel::Validations
  validate :valid_link?

  validates :url, :title, presence: true, uniqueness: true

  def valid_link?
    uri = URI.parse(self.url)
    errors.add(:base, "Please submit a valid URL") unless uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    false
  end
end
