module Member::CartProductsHelper

	TAX = 1.08
  def price_included_tax(non_taxed_price)
  (non_taxed_price * TAX).ceil
  end

  def sub_total(non_taxed_price,quantity)
		(non_taxed_price * TAX).ceil * quantity
  end

end