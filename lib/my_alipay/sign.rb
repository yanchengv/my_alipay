module MyAlipay
  module Sign

    def self.generate(params, options = {})
      sign_type = options[:sign_type] || MyAlipay.sign_type
      #因为中文乱码问题，所以替换params[:biz_content] = params[:biz_content].to_json
      params[:biz_content] = JSON.generate(params[:biz_content],ascii_only: true)
      params.merge!({
          app_id: MyAlipay.app_id,
          charset: 'UTF-8',
          #format: 'JSON',
          sign_type: 'RSA2',
          timestamp: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
          version: '1.0'
      })
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