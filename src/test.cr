require "./test/*"
require "kemal"
require "http/client"
require "csv"
require "benchmark"

module Test
  get "/" do
    ticker = nil
    share_prices = nil
    render "src/views/hello.ecr"
  end
  get "/company" do |env|
    ticker = env.params.query["ticker"]
    if ticker
      file_path = "http://real-chart.finance.yahoo.com/table.csv?s=#{ticker}&a=07&b=19&c=2004&d=02&e=27&f=2016&g=d&ignore=.csv"
      if file_path
        response = HTTP::Client.get(file_path)
        share_prices = CSV.parse(response.body)
        share_prices.delete_at(0)
        share_prices.map! do |share_price|
          [share_price.first, share_price.last]
        end
        share_prices = share_prices.to_h.to_json
      end
    end
    render "src/views/hello.ecr"
  end
  Kemal.run
end

