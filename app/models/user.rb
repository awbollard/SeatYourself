class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email. Bro, do you even type?")
    end
  end
end

class User < ActiveRecord::Base
	
	validates :first_name, :last_name, presence: true
	validates :email, presence: true, email: true

	has_secure_password

	has_many :reservations
	has_many :restaurants, through: :reservations

	has_many :owned_restaurants, class_name: "Restaurant", foreign_key: "owner_id"
end
