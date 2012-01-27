class Patient < ActiveRecord::Base
has_many :appointments
belongs_to :doctors     #, :through => :appointments
end
