@count = 1000 #商品总数量
@mutex = Mutex.new
 
def buy(num) #购买商品的方法
  @mutex.lock #锁定当前线程资源，还有try_lock方法，如果另一个线程已锁定资源，try_lock返回false而不是等待
  if @count >= num #判断商品数量是否比商品总数小
    Thread.pass #暂停线程
    @count -= num 
    puts "#{num}件购买成功\n"
  else
    puts "#{num}件购买失败\n"
  end
  @mutex.unlock #解锁
end
 
#三个线程并发购买
t1 = Thread.new(111) {|num| buy(num)}
t2 = Thread.new(888) {|num| buy(num)}
t3 = Thread.new(10) {|num| buy(num)}
t4 = Thread.new(2) {|num| buy(num)}
t1.join
t2.join
t3.join
t4.join







