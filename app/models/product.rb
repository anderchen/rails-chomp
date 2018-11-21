class Product < ApplicationRecord
  include PgSearch

  pg_search_scope :search_product,
                  against: [
                    [:name, 'A'],
                    [:ingredients, 'C'],
                    [:brand, 'B'],
                    [:category, 'D'],
                    :traces
                  ],
                  using: {
                    tsearch: { prefix: true }
                  }

  mount_uploader :photo, PhotoUploader

  belongs_to :user

  has_many :reviews, dependent: :destroy

  has_many :product_restrictions, dependent: :destroy
  has_many :diets, through: :product_restrictions
  CATEGORIES = ['Achocolatados',
                'Aveia',
                'Azeites, óleos e vinagres',
                'Bebidas',
                'Biscoitos',
                'Café e chá',
                'Carnes, aves e peixes',
                'Cereais',
                'Congelados e pratos prontos',
                'Conservas e enlatados',
                'Doces',
                'Farinhas',
                'Frutas',
                'Grãos',
                'Leite e derivados',
                'Massas',
                'Outros',
                'Ovos',
                'Pães, torradas e bolos',
                'Sorvete',
                'Temperos e Condimentos',
                'Verduras e legumes']

  validates :name, presence: true
  validates :brand, presence: true
  validates :ingredients, presence: true
  validates :user_id, presence: true
  validates :validation, default: false
  # validates :category, inclusion: { in: CATEGORIES }

  accepts_nested_attributes_for :diets, :product_restrictions
end
