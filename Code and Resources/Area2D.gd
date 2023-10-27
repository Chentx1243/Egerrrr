extends Area2D

signal abc #定义了一个信号
var vec:Vector2=Vector2(1,1) #小球的初始速度
var init_position #一个用来记录初始位置的变量
func _ready():
	self.add_to_group("ball")
	#使用init...来记录小球的初始位置
	init_position=position
	

	#await的使用：
	#用time1变量来存储 计时器中返回的信号
	#get_tree().create_timer(3) 这个代码会在计时器3秒后 emit：timeout信号
	var time1 = get_tree().create_timer(3)
	#等待 直到接收到 time1.timeout 信号
	await time1.timeout
	#下方对信号abc进行一个连接：
	self.connect("abc",Callable(self,"test_signal"))
	#下面对信号abc进行一个发送
	emit_signal("abc")
	pass

#这是一个用来测试信号abc是否正常绑定的测试函数
func test_signal():
	print("123123")


func _process(delta):
	self.position = self.position + vec
	if(Input.get_action_strength("复位")>0):
		self.position=init_position
		Count.re()
func _physics_process(delta):
		if(Input.get_action_strength("加速")>0):
			position=position+(vec)*5
func rset():
	if(vec.x>0):
		Count.player1 += 1
	else:
		Count.player2 += 1
	position = init_position
