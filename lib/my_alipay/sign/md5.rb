module MyAlipay
  module Sign
    class MD5
      def self.sign(key, string)
        sign = Digest::MD5.hexdigest("#{string}#{key}")
        {sign_str: string, sign: sign}
      end

      #验签
      def self.verify?(key, string, sign)
        sign == sign(key, string)
      end
    end
  end
end