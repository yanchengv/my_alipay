module MyAlipay
  module Wap
    module Notify

      def self.wap_notify params
        params.stringify_keys
        params.delete('sign_type')
        params.delete('controller')
        params.delete('action')
        sign =  params.delete('sign')
        sign = Base64.decode64(sign)
        sign_str = MyAlipay::Utils.params_to_string params
        digest = OpenSSL::Digest::SHA256.new
        pkey = OpenSSL::PKey::RSA.new(Base64.decode64(MyAlipay.alipay_public_key))
        pkey.verify(digest, sign, sign_str)
      end
    end
  end
end
