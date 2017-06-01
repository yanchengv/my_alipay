module MyAlipay
  module Wap
    module Test


      def self.test_sign
        params ='app_id=2016080200146859&biz_content={"subject":"测试数据","out_trade_no":"123456","total_amount":"100","product_code":"QUICK_WAP_PAY"}&charset=UTF-8&method=alipay.trade.wap.pay&sign_type=RSA2&timestamp=2014-07-24 03:07:50&version=1.0'
        #params = 'app_id=2016080200146859&biz_content={"button":[{"actionParam":"ZFB_HFCZ","actionType":"out","name":"话费充值"},{"name":"查询","subButton":[{"actionParam":"ZFB_YECX","actionType":"out","name":"余额查询"},{"actionParam":"ZFB_LLCX","actionType":"out","name":"流量查询"},{"actionParam":"ZFB_HFCX","actionType":"out","name":"话费查询"}]},{"actionParam":"http://m.alipay.com","actionType":"link","name":"最新优惠"}]}&charset=UTF-8&method=alipay.mobile.public.menu.add&sign_type=RSA2&timestamp=2014-07-24 03:07:50&version=1.0'
        rsa = OpenSSL::PKey::RSA.new(Base64.decode64(MyAlipay.app_private_key))
        digest = OpenSSL::Digest::SHA256.new
        Base64.strict_encode64(rsa.sign(digest, params))

      end

      def self.test_sign2
        params ='{"subject":"测试数据","out_trade_no":"123456","total_amount":"100","product_code":"QUICK_WAP_PAY"}'
        MyAlipay::Wap::Sign.generate_wap_sign params
      end


      TEST_RSA_PRIVATE_KEY = <<EOF
-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKM1WEl/09gMU3U8
V3hJcS/GaMPR2f7FDiVC7qjwdsZfPh179FFVMkMvjyrDGfzWVqvlw1IiNueENFeb
19lyvO7BuOrFc6/Y6/sxkBr9YkRx++nddxKDEo8HngUtW8ej+vG4wrbGmmzjsulz
u+mmS+Leh9tdbrVL5pPRNYWRQxOfAgMBAAECgYB7xOSjOJFK8m4IJi6fRfLULD8e
4XHUR1Qm5c9fxpwMbAYLDgmF9HodgV+tKi/3EgTAb4nkK5Y/lH6tQb47ZUvo/lKz
RlIVZ6Rm76V07g/+5exIZzTyvdD9T2fLeYQwKV/2JYUv0KSYWPvWykdaV4aNkCuw
mxTUjvhDxK/Ns31CIQJBANI1Y3gGBqbBIN9wxjx3ShBtt/U8YnipUJ92eTI7OU9p
ZsCIFPoeYG/X40miwDb5ouPnvJTtzuY4PkPokEefN9MCQQDGwurqa8RNK2APA62U
CdZbJuWimkdHEc53IKvD/l2tWVFqhVAy8bs+3LGzBNfuxUuAxOoQm9n0IVRaH5jn
l8GFAkEAijuTmsUTsKsGDAmkQvULHnyYYUuBUem92+9TycWKbX9Zk7ipWsWJE2N7
0tuU3VISXR7yM1mjGl/YCl4wKvk4AwJAE1DkBY4dkKZTeoIP/2AJXehkzq2Rmb2I
RBl/t9djgTI58FEuXxUQ7mYCOvSQi5rO4J/CY4TR5KDMksmZUYB1BQJAIEfVDxz4
5yoHL7L+6EoC5TWxUxFMN7z7FhObyKeaLKj3inEsbjfcPCA09zPUce0FSKBc/dVh
DEorJMaPK5vXiA==
-----END PRIVATE KEY-----
EOF
    end
  end

end

