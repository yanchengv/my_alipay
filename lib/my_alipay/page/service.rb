module MyAlipay
  module Page
    module Service
      GATEWAY_URL = 'https://openapi.alipayde.com/gateway.do'

      #电脑网站支付url
      def self.create_alipay_trade_page_pay_url(params, options = {})
        params.merge!({method: 'alipay.trade.page.pay'})[:biz_content].merge!({product_code: "FAST_INSTANT_TRADE_PAY"})
        sign_params = MyAlipay::Sign.generate params
        MyAlipay.gateway_url + '?' + sign_params[:sign_str] + "&sign=#{ERB::Util.url_encode(sign_params[:sign])}"
      end



    end
  end
end