class Veg < ApplicationRecord

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ヴィーガン(完全菜食)' },
    { id: 3, name: 'ラクト・ベジタリアン(乳菜食)' },
    { id: 4, name: 'ラクト・オボ・ベジタリアン(乳卵菜食)' },
    { id: 5, name: 'ペスコ・ベジタリアン(魚乳卵菜食)' }
    { id: 6, name: 'ポーヨー・ベジタリアン(鳥魚乳卵菜食)' }
    { id: 7, name: 'これからベジタリアンに挑戦' }
  ]

  include ActiveHash::Associations
  has_many :users
end
