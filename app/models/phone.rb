class Phone < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '携帯電話' },
    { id: 3, name: '自宅' }
  ]

  include ActiveHash::Associations
  has_many :individuals

end