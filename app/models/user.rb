class User < ApplicationRecord
        has_many :events
        has_many :registrations
        has_many :reviews
end
