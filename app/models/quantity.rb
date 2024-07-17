class Quantity < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '個' },
    { id: 3, name: '本' },
    { id: 4, name: 'パック' },
    { id: 5, name: 'g' },
    { id: 6, name: '切れ' },
    { id: 7, name: '缶' },
    { id: 8, name: '束' }
  ]

  include ActiveHash::Associations
  has_many :foods
end