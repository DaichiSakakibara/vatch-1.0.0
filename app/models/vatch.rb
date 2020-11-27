class Vatch < ApplicationRecord

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Rainbow Vatch' },
    { id: 3, name: 'Gold Vatch' },
    { id: 4, name: 'Silver Vatch' },
    { id: 5, name: 'Bronze Vantch' }
    { id: 6, name: 'Green Vantch' }
  ]

  include ActiveHash::Associations
  has_many :users
end