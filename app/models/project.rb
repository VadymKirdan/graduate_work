class Project < ActiveRecord::Base
  has_many :reports, dependent: :destroy
end
