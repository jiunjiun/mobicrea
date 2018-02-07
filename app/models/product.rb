class Product < ApplicationRecord
  belongs_to :collection

  has_many :summernote_uploads, dependent: :destroy
  has_many :items, class_name: 'ProductItem', dependent: :destroy
  has_many :photos, class_name: 'ProductPhoto', dependent: :destroy

  has_many :product_relations, dependent: :destroy
  has_many :relations, through: :product_relations

  validates_presence_of :name

  before_destroy :destroy_relation

  def self.id_options
    Product.all.map do |t|
      [ t.name, t.id ]
    end
  end

  def prev
    Product.where("id < ?", self.id).last
  end

  def next
    Product.where("id > ?", self.id).first
  end

  def destroy_relation
    ProductRelation.where(relation_id: self.id).destroy_all
  end
end
