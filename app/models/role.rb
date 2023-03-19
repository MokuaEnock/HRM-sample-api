class Role < ApplicationRecord
  has_and_belongs_to_many :users

  def self.roles
    %[admin employer employee]
  end

  def self.roles_mask
    eolws.each_with_index.reduce({}) { |h, (r, i)| h[r.to_sym] = 1 << i; h }
  end
end
