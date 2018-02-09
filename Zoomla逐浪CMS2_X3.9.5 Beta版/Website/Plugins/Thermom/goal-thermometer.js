var canvasPanel = function () {
    this.imgdir = "/Plugins/Thermom/images/";
    this.splitNum = 4;
    this.lineMaxlength = 8;
    this.lineMinLength = 3;
    this.danwei = "℃";
    this.MaxNum = 100;
    this.MinNum = 0;
    this.bgColor = 'rgb(159,3,3)';
    this.fontColor = 'rgb(159,3,3)';
    this.SplitfontSize =  '12';
    this.fontSize = '16';
    this.fontWeight = 'bold';
    this.SplitfontWeight = 'bold';
    this.fontFamily = 'Arial';
    this.SplitfontFamily = 'Arial';
    this.SplitfontColor = '#666';
    this.background = 'transparent';
    this.img1 = new Image();
    this.img1.src=this.imgdir+ "temperImg/glassBody.png";
    //绘制球部
   	this.img=new Image();
   	this.img.src = this.imgdir + "temperImg/glassBottom12.png";
    this.current = 0;
    this.timer = null;
}
canvasPanel.prototype.init =function(canvasId,opts){
    var $this = this;
    if (opts)
    {
       if (opts.danwei) { this.danwei = opts.danwei;}
    }
    //放大缩小的比例
    $this.nowWidth = $('#'+canvasId).width();
    $this.nowHeight = $('#'+canvasId).height();
    if($('#'+canvasId).find('canvas').length>0){
    	$('#'+canvasId).empty();
    }
    $('#'+canvasId).append('<canvas width='+$this.nowWidth+'px height='+$this.nowHeight+'px style="background:'+$this.background+'"></canvas>');
    $this.myCanvas = $('#'+canvasId).find('canvas')[0];
    $this.context = $this.myCanvas.getContext('2d');
    //放大缩小的倍数
   	$this.times = Math.min((this.nowWidth/100),(this.nowHeight/220)).toFixed(2);
   	$this.splitHeight = (128/$this.splitNum).toFixed(2);

   	$this.SplitFontSize =  Math.round(12*$this.times);
    $this.ValueFontSize = Math.round(16*$this.times);
    //清空画布
    $this.context.clearRect(0,0,$this.myCanvas.offsetWidth,$this.myCanvas.offsetHeight);
   	    
    //绘制圆顶
    var img2 = new Image();
    img2.src=this.imgdir+"temperImg/glassTop.png";
    img2.onload=function(){
        $this.context.drawImage(img2,52*$this.times,0,34*$this.times,12*$this.times);
    }
    
    if($this.img.complete) { // 如果图片已经存在于浏览器缓存，直接调用回调函数
	  	$this.paintBottom();//绘制柱体,水银球和底座，刻度
        $this.paintFont();
        $this.paintNowValue($this.current);
        $this.paintSplit();
	   	return false; // 直接返回，不用再处理onload事件
	}
    $this.img.onload = function(){
        $this.paintBottom();
        $this.paintFont();
        $this.paintNowValue($this.current);
        $this.paintSplit();
    }
}
//绘制刻度值
canvasPanel.prototype.paintFont = function (){
        //var $this = this;
        //$this.value = (($this.MaxNum-$this.MinNum)/$this.splitNum).toFixed(2);
        //var fontStyle = $this.SplitfontWeight+' '+Math.round($this.SplitfontSize*$this.times)+'px '+$this.SplitfontFamily;
        ////设置字体样式
        //$this.context.font = fontStyle;
        ////设置字体填充颜色
        //$this.context.fillStyle = $this.SplitfontColor;
        ////从坐标点(50,50)开始绘制文字
        //for(var i=0;i<=$this.splitNum;i++){ 
        //	var zhi = ($this.MaxNum-$this.value*i).toFixed(1);
        //    $this.context.fillText(zhi+$this.danwei, 3*$this.times, (18+$this.splitHeight*i)*$this.times);
        //}  
}
//绘制刻度
canvasPanel.prototype.paintSplit = function(){
    var $this = this;
    var smallSplit = ($this.splitHeight/5).toFixed(2);
    for(var i=0;i<$this.splitNum;i++){
        $this.context.strokeStyle='#000';
        $this.context.lineWidth=1;
        $this.context.lineCap='square';
        $this.context.beginPath();
        $this.context.moveTo(60*$this.times,(13+$this.splitHeight*i)*$this.times);
        $this.context.lineTo((60+$this.lineMaxlength)*$this.times,(13+$this.splitHeight*i)*$this.times);
        $this.context.stroke();
        $this.context.closePath();
        for(var j=1;j<5;j++){
            $this.context.beginPath();
            $this.context.moveTo(60*$this.times,(13+$this.splitHeight*i+smallSplit*j)*$this.times);
            $this.context.lineTo((60+$this.lineMinLength)*$this.times,(13+$this.splitHeight*i+smallSplit*j)*$this.times);
            $this.context.stroke();
            $this.context.closePath();
        }
    }
}
//绘制柱体和球部
canvasPanel.prototype.paintBottom = function(){
	var $this=this;
	$this.context.clearRect(45*$this.times,12*$this.times,48*$this.times,183*$this.times);
	if(!$this.img1.complete){
    	$this.img1.onload=function(){
	        $this.context.drawImage($this.img1,52*$this.times,13*$this.times,34*$this.times,130*$this.times);
	    }
    }else{
    	$this.context.drawImage($this.img1,52*$this.times,13*$this.times,34*$this.times,130*$this.times);//水银柱背景部分
    }
	$this.context.drawImage($this.img,45*$this.times,143*$this.times,48*$this.times,52*$this.times);//绘制水银球体部分
        
    $this.context.beginPath(); 
    $this.context.fillStyle=$this.bgColor;/*设置水银柱填充颜色*/ 
    $this.context.fillRect(60*$this.times,142*$this.times,19*$this.times,12*$this.times);/*绘制一个矩形，前两个参数决定开始位置，后两个分别是矩形的宽和高*/
    $this.context.closePath(); 

    var g1 = $this.context.createRadialGradient(65*$this.times,160*$this.times,0,65*$this.times,164*$this.times,12*$this.times);  
    g1.addColorStop(0.1, 'rgb(220,220,220)');    
    g1.addColorStop(1, $this.bgColor);  //球体背景色
    $this.context.fillStyle = g1;  
    $this.context.beginPath();  
    $this.context.arc(69*$this.times,167*$this.times,17*$this.times,0, Math.PI * 2, true);  
    $this.context.closePath();  
    $this.context.fill();  
}
//绘制当前值及条形柱值
canvasPanel.prototype.paintNowValue = function (num){
    var $this=this;
    if(num>$this.MaxNum){
        num = $this.MaxNum;
    }else if(num<$this.MinNum){
        num = $this.MinNum;
    }
    //当前值所在位置百分比
    var percentage = (num-$this.MinNum)/($this.MaxNum-$this.MinNum);
   
    var mHeight = Math.round((141-13)*$this.times * percentage); 
    $this.context.clearRect(45*$this.times,12*$this.times,48*$this.times,131*$this.times);
    $this.context.clearRect(0,195*$this.times,$this.nowWidth,40*$this.times);

    $this.context.drawImage($this.img1,52*$this.times,12*$this.times,34*$this.times,131*$this.times);
    
    $this.context.beginPath(); 
	$this.context.fillStyle=$this.bgColor;/*设置填充颜色*/ 
    $this.context.fillRect(59*$this.times,(141*$this.times-mHeight),20*$this.times,10*$this.times+mHeight);//绘制一个矩形，前两个参数决定开始位置，后两个分别是矩形的宽和高
    $this.context.closePath();
    $this.paintSplit();

    //设置字体样式
    var fontStyle = $this.fontWeight+' '+Math.round($this.fontSize*$this.times)+'px '+$this.fontFamily;
    $this.context.font = fontStyle;
    //设置字体填充颜色
    $this.fontColor = $this.bgColor;
    $this.context.fillStyle = $this.fontColor;
    //从坐标点(50,50)开始绘制文字
    $this.context.fillText(num+$this.danwei,45*$this.times,210*$this.times);
}