module MyAlipay
  module Wap
    module Sign

      #rsa2 SHA256
      def self.generate_wap_sign(params)
        params[:biz_content] = params[:biz_content].to_json
        params = {
            app_id: MyAlipay.app_id,
            method: 'alipay.trade.wap.pay',
            charset: 'UTF-8',
            #format: 'JSON',
            sign_type: 'RSA2',
            timestamp: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
            version: '1.0',
            biz_content: ''
        }.merge(params)

        hash_str =  params.stringify_keys #{a:1,b:2} 转换成 {'a'= '1','b'='2'}
        sign_str = MyAlipay::Utils.params_to_string hash_str
        #sign_str = "app_id=2016080200146859&biz_content={\"subject\":\"测试数据\",\"out_trade_no\":\"123456\",\"total_amount\":\"100\",\"product_code\":\"QUICK_WAP_PAY\"}&charset=UTF-8&method=alipay.trade.wap.pay&sign_type=RSA2&timestamp=2014-07-24 03:07:50&version=1.0"
        #如果秘钥key开头没有-----BEGIN PRIVATE KEY-----和-----END PRIVATE KEY-----需要base64解码，如果有则不需要进行解码
        rsa = OpenSSL::PKey::RSA.new(Base64.decode64(MyAlipay.app_private_key))
        digest = OpenSSL::Digest::SHA256.new
        sign = Base64.strict_encode64(rsa.sign(digest, sign_str))
        {sign_str: sign_str,sign: sign}
      end

    end
  end
end
