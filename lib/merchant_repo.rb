require_relative 'merchant'

class MerchantRepository
  attr_reader :merchants, :sales_engine
  def initialize(merchant_list, sales_engine)
    @merchants = merchant_list
    @sales_engine = sales_engine
  end

  def all
    merchants
  end

  def find_by_id(id)
    merchants.find do |merchant|
      merchant.id == id
    end
  end

  def find_by_name(name)
    merchants.find do |merchant|
      merchant.name.downcase == name.downcase
    end
  end

  def find_all_by_name(fragment)
    merchants.find_all do |merchant|
      merchant.name.downcase.include?(fragment.downcase)
    end
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end
end
