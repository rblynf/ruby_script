@count = 1000 #商品总数量
@mutex = Mutex.new
 
def buy(num) #购买商品的方法
  @mutex.synchronize do  #使用synchronize锁定当前线程，接受一个代码块
    if @count >= num #判断商品数量是否比商品总数小
      Thread.pass #暂停线程
      @count -= num 
      puts "#{num}件购买成功\n"
    else
      puts "#{num}件购买失败\n"
    end
  end
end
 
#三个线程并发购买
# t1 = Thread.new(999) {|num| buy(num)}
# t2 = Thread.new(10) {|num| buy(num)}
# t3 = Thread.new(2) {|num| buy(num)}

t1 = Thread.new{ buy(999)}
t2 = Thread.new{ buy(10)}
t3 = Thread.new{ buy(2)}
t1.join
t2.join
t3.join
