class Patient < ActiveRecord::Base
has_many :appointments
belongs_to :doctor     #, :through => :appointments
end
