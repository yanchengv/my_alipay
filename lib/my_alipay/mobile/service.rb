module MyAlipay
  module Mobile
    module Service
      GATEWAY_URL = 'https://openapi.alipayde.com/gateway.do'

      #手机支付宝app支付url
      def self.create_alipay_trade_app_pay_url(params, options = {})
        params.merge!({method: 'alipay.trade.app.pay'})[:biz_content].merge!({product_code: "QUICK_MSECURITY_PAY"})
        sign_params = MyAlipay::Sign.generate params
        sign_params[:sign_str] + "&sign=#{ERB::Util.url_encode(sign_params[:sign])}"
      end


    end
  end
end
