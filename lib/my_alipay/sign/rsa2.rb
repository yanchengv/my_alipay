module MyAlipay
  module Sign
    class Rsa2
      #rsa2 SHA256
      def self.sign(key, string)
        #如果秘钥key开头没有-----BEGIN PRIVATE KEY-----和-----END PRIVATE KEY-----需要base64解码，如果有则不需要进行解码
        rsa = OpenSSL::PKey::RSA.new(Base64.decode64(key))
        digest = OpenSSL::Digest::SHA256.new
        sign = Base64.strict_encode64(rsa.sign(digest, string))
        {sign_str: string, sign: sign}
      end

    end
  end
end

#sign_string = "app_id=2016080200146859&biz_content={\"subject\":\"测试数据\",\"out_trade_no\":\"123456\",\"total_amount\":\"100\",\"product_code\":\"QUICK_WAP_PAY\"}&charset=UTF-8&method=alipay.trade.wap.pay&sign_type=RSA2&timestamp=2014-07-24 03:07:50&version=1.0"