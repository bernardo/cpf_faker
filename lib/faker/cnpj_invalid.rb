module Faker
  class CNPJInvalid
    class << self
      # Generates an invalid CNPJ number with numbers only. Returns a string, since it may have leading zeros.
      #
      # Example:
      #  Faker::CNPJInvalid.numeric  #=> "57222068000132"
      def numeric
        cnpj_root = Array.new(14) { rand(10) }
        cnpj_root.join
      end
      alias numbers numeric
      alias number numeric

      # Generates an invalid CNPJ number, including separators. Returns a string.
      #
      # Example:
      #  Faker::CNPJInvalid.numeric  #=> "22.792.949/0001-04"
      def pretty
        cnpj = numeric.to_s.rjust(14, "0")
        "%s.%s.%s/%s-%s" % [cnpj[0,2], cnpj[2,3], cnpj[5,3], cnpj[8,4], cnpj[12,2]]
      end
      alias cnpj pretty
      alias formatted pretty

    end
  end

end
