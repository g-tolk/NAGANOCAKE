module Admin::ProductsHelper
  POSTAGE = 800
   TAX = 1.08
   def postage
   	   POSTAGE
   end

   def all_total(non_taxed_price,quantity)
   	 (non_taxed_price * TAX).ceil + POSTAGE
   end



	def price_included_tax(non_taxed_price)
	  (non_taxed_price * TAX).ceil
    end

	def sub_total(non_taxed_price,quantity)
		(non_taxed_price * TAX)
	end

end
