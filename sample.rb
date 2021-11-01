class Product
    attr_reader :item, :price, :id
    @@count = 0
    def initialize(product_params)
        @item = product_params[:item]
        @price = product_params[:price]
        @id = @@count += 1 
    end
end

class Display
    attr_reader :products
    def initialize(product_params)
        @products = []
        register_product(product_params)
    end

    def register_product(product_params)
        product_params.each do |param|
        @products << Product.new(param)
        end
    end

    def disp_products
        puts "いらっしゃいませ！商品を選んで下さい。"
        @products.each do |product|
            puts "#{product.id}.#{product.item}（#{product.price}円）"
        end
    end
    
    def ask_quantity(chosen_product)
        puts "#{chosen_product.item}ですね、何個買いますか？"
    end

    def calculate(customer)
        total_price = customer.select_product_amount * customer.chosen_product.price
        if customer.select_product_amount >= 5
            puts "5個以上なので10%割引となります"
            total_price *= 0.9
        end
        puts "合計金額は#{total_price.floor}円です"
        puts "お買い上げ有難うございました"
    end
end
class Customer
    attr_reader :chosen_product, :select_product_amount
    def choose_product(products)
        while true            
            print "商品の番号を選択 > "
            select_product_id = gets.to_i
            @chosen_product = products.find{|product| product.id == select_product_id}
            break if !@chosen_product.nil?
            puts "#{products.first.id}から#{products.last.id}の番号から選んでください。"
        end
    end

    def pickup_product
        while true
            print "個数を入力 > "
            @select_product_amount = gets.to_i
            break if @select_product_amount >= 1
            puts "1個以上選んでください"
        end
    end

    
end
# 実引数-----------------------------------------------------------------------
product_params1 = [
    {item: "トマト", price: 100},
    {item: "きゅうり", price: 200},
    {item: "玉ねぎ", price: 300},
    {item: "なす", price: 400}    
]
# 追加商品----------------------------------------------------------------------
adding_product_params1 = [
    {item: "ごぼう", price: 250},
    {item: "れんこん", price: 350}
]
# 呼び出し----------------------------------------------------------------------
display1 = Display.new(product_params1)
display1.register_product(adding_product_params1)
customer = Customer.new
display1.disp_products
customer.choose_product(display1.products)
display1.ask_quantity(customer.chosen_product)
customer.pickup_product
display1.calculate(customer)