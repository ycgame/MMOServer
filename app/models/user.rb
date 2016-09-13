class User < ApplicationRecord

  validates :name, uniqueness: true

  def as_json options = {}

    j = {}
    j[:status] = options.has_key?(:status) ? options[:status] : 200
    j[:message] = options.has_key?(:message) ? options[:message] : ""
    j[:user] = super
    j

  end

end
