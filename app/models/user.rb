class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  PROFILE_TITLE = [
    'Black Belt',
    'White Belt',
    'Blue Belt',
    'Purple Belt',
    'Brown Belt',
    ].freeze

    def name
      "#{first_name} #{last_name}".strip
    end

    def self.ransackable_attributes(auth_object = nil)
      ['country', 'city']
    end


    def self.ransackable_associations(auth_object = nil)
      []
    end


end
