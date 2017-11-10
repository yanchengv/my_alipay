require 'openssl'
require 'base64'
module MyAlipay
  module Sign
    class Rsa
      def self.sign(key, string)
        rsa = OpenSSL::PKey::RSA.new(Base64.decode64(key))
        digest = OpenSSL::Digest::SHA1.new
        sign = Base64.strict_encode64(rsa.sign(digest, string))
        {sign_str: string, sign: sign}
      end

      #验签
      def self.verify?(key, string, sign)
        digest = OpenSSL::Digest::SHA1.new
        pkey = OpenSSL::PKey::RSA.new(Base64.decode64(key))
        pkey.verify(digest, sign, string)
      end
    end
  end
end