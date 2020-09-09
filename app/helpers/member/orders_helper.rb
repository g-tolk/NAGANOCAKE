module Member::OrdersHelper

	POSTAGE = 800
	TAX = 1.08

	def postage
		POSTAGE
	end

  def price_included_tax(non_taxed_price)
  (non_taxed_price * TAX).ceil
  end

  def sub_total(non_taxed_price,quantity)
		(non_taxed_price * TAX).ceil * quantity
  end
end
