module MyAlipay
  module Wap
    module Service
      GATEWAY_URL = 'https://openapi.alipayde.com/gateway.do'

      #手机支付url
      def self.create_alipay_trade_wap_pay_url(params, options = {})
        params.merge!({method: 'alipay.trade.wap.pay'})[:biz_content].merge!({product_code: "QUICK_WAP_PAY"})
        sign_params = MyAlipay::Sign.generate params
        MyAlipay.gateway_url + '?' + sign_params[:sign_str] + "&sign=#{ERB::Util.url_encode(sign_params[:sign])}"
      end


    end
  end
end
