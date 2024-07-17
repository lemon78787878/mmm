class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '野菜' },
    { id: 3, name: '肉' },
    { id: 4, name: '魚介' },
    { id: 5, name: '主食・粉' },
    { id: 6, name: '調味料' },
    { id: 7, name: 'スパイス' },
    { id: 8, name: '卵・乳・豆' },
    { id: 9, name: 'デザート' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :foods
end