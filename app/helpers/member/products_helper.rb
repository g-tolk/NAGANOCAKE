module Member::ProductsHelper
	TAX = 1.08
  def price_included_tax(non_taxed_price)
  (non_taxed_price * TAX).ceil
  end
end
