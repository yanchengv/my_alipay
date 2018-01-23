module MyAlipay
  class Client
    class << self
      GATEWAY_URL = 'https://openapi.alipayde.com/gateway.do'
      def get_alipay_url(params, options = {})
        sign_params = MyAlipay::Sign.generate params
        MyAlipay.gateway_url + '?' + sign_params[:sign_str] + "&sign=#{ERB::Util.url_encode(sign_params[:sign])}"
      end
    end

  end
end