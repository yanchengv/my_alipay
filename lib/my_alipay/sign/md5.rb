module MyAlipay
  module Sign
    class MD5
      def self.sign(key, string)
        Digest::MD5.hexdigest("#{string}#{key}")
      end

      #验签
      def self.verify?(key, string, sign)
        sign == sign(key, string)
      end
    end
  end
end