class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items

  validates :name, :description, :unit_price, presence: true

  before_destroy :destroy_dependent_invoices, prepend: true

  def destroy_dependent_invoices
    invoices.unscope(:where)
            .group('invoices.id')
            .having("'{#{id}}' = (ARRAY_AGG(DISTINCT item_id))")
            .destroy_all
  end
end
