module MyAlipay
  module Utils

    def self.params_to_string(params)
      params.delete_if{|key,value| !value.present?}.sort.map { |item| item.join('=') }.join('&').delete('#')
    end

    def self.params_to_decoded_string(params)
      params.sort.map { |key, value| %Q(#{key}=#{CGI.unescape(value.to_s)}) }.join('&')
    end
    # 退款批次号，支付宝通过此批次号来防止重复退款操作，所以此号生成后最好直接保存至数据库，不要在显示页面的时候生成
    # 共 24 位(8 位当前日期 + 9 位纳秒 + 1 位随机数)
    def self.generate_batch_no
      t = Time.now
      batch_no = t.strftime('%Y%m%d%H%M%S') + t.nsec.to_s
      batch_no.ljust(24, rand(10).to_s)
    end
  end
end
