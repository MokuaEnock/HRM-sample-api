class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :roles

  def has_role(role)
    role.any? { |r| r.name.underscore.to_sym == role }
  end
end
