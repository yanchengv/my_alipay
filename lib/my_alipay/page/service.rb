module MyAlipay
  module Page
    module Service
      GATEWAY_URL = 'https://openapi.alipayde.com/gateway.do'

      #电脑网站支付url
      def self.create_alipay_trade_page_pay_url(params, options = {})
        sign_params = MyAlipay::Sign.generate params,{method: 'alipay.trade.page.pay'}
        MyAlipay.gateway_url + '?' + sign_params[:sign_str] + "&sign=#{ERB::Util.url_encode(sign_params[:sign])}"
      end



    end
  end
end