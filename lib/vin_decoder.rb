require 'hpricot'
require 'net/http'
require 'net/https'
require 'cgi'
module VinDecoder
  USERAGENT = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1'

  class Generic
    attr_accessor :info
    URL = "http://www.decodethis.com/Default.aspx"

    def decode(vin)
      hash = {}
      Hpricot(RestClient.get URL, :params => {:tabid => 65, :vin => vin}).search('.tab').search('tr')[1..-1].each do |tr|
        tr.search('td').each_slice(2) do |row|
          k = row.first.inner_html.parameterize.underscore.to_sym
          v = row.last.inner_html.strip.gsub(/&#.{0,}?;/, '') # remove html entity garbage
          hash[k] = v
        end
      end
      @info = hash
    rescue => e
      Logger.new(STDOUT).info "Decoding vin #{vin} was failed. Reason: #{e}"
    end

    def self.decode(vin)
      new.decode(vin)
    end
  end

end
