module MyAlipay
  module Wap
    module Service
      GATEWAY_URL = 'https://openapi.alipaydev.com/gateway.do'
      #ALIPAYCONFIG = YAML.load_file("config/myalipay.yml")[Rails.env].with_indifferent_access.freeze

      #手机支付url
      def self.create_alipay_trade_wap_pay_url(params, options = {})
        sign_params = MyAlipay::Wap::Sign.generate_wap_sign params
        MyAlipay.gateway_url + '?' + sign_params[:sign_str] + "&sign=#{ERB::Util.url_encode(sign_params[:sign])}"
      end



    end
  end
end
