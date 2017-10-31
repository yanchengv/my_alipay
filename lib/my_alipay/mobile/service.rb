module MyAlipay
  module Mobile
    module Service
      GATEWAY_URL = 'https://openapi.alipayde.com/gateway.do'

      #手机支付宝app支付url
      def self.create_alipay_trade_app_pay_url(params, options = {})
        sign_params = MyAlipay::Sign.generate params,{method: 'alipay.trade.app.pay'}
        MyAlipay.gateway_url + '?' + sign_params[:sign_str] + "&sign=#{ERB::Util.url_encode(sign_params[:sign])}"
      end



    end
  end
end
