class Managee < ApplicationRecord
  belongs_to :user
  belongs_to :managee, class_name: 'User'
end
