module MyAlipay
  module Sign

    def self.generate(params, options = {})
      method = options[:method]# || 'alipay.trade.wap.pay'
      sign_type = options[:sign_type] || MyAlipay.sign_type
      if method == 'alipay.trade.wap.pay'
        #手机网站支付
        params[:biz_content] = params[:biz_content].merge({product_code: "QUICK_WAP_PAY"}).to_json
      elsif method == 'alipay.trade.page.pay'
        #电脑网站支付
        params[:biz_content] = params[:biz_content].merge({product_code: "FAST_INSTANT_TRADE_PAY"}).to_json
      elsif method == 'alipay.trade.app.pay'
        #支付宝app支付
        params[:biz_content] = params[:biz_content].merge({product_code: "QUICK_MSECURITY_PAY"}).to_json
      end
      params = {
          app_id: MyAlipay.app_id,
          method: method,
          charset: 'UTF-8',
          #format: 'JSON',
          sign_type: 'RSA2',
          timestamp: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
          version: '1.0',
          biz_content: ''
      }.merge(params)
      hash_str = params.stringify_keys #{a:1,b:2} 转换成 {'a'= '1','b'='2'}
      sign_str = MyAlipay::Utils.params_to_string hash_str

      case sign_type
        when 'RSA2'
          sign = Rsa2.sign(MyAlipay.app_private_key, sign_str)
        when 'MD5'
          sign = 'MD5'
        else
          raise ArgumentError, "invalid sign_type #{sign_type}, allow value: 'MD5', 'RSA2'"
      end

      return sign

    end

  end
end