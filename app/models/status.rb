class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '入居者' },
    { id: 3, name: '申込者' }
  ]

  include ActiveHash::Associations
  has_many :users

end