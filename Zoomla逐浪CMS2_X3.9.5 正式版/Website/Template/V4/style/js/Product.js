var Product = { apiUrl: "/API/Mod/shop_cart.ashx?action=", proid: 0,proModel:{}, $pronum: $("#Pronum") };
//将商品提交至购物车
Product.addToCart=function(){
    var ref=this;
    var pronum=ref.$pronum.val();
    var url="/Cart/Cart.aspx?ID="+ref.proid+"&pronum="+pronum;
    $.post(url,{},function(){
        alert("加入购物车成功!");
    })
}
Product.submitToCart = function () {
    var ref = this;
    var pronum = ref.$pronum.val();
    var url = "/Cart/Cart.aspx?ID=" + ref.proid + "&pronum=" + pronum;
    location = url;
}
Product.minus = function () {
    var ref = this;
    var pronum = ref.$pronum.val();
    if (pronum && pronum > 1) { pronum--; }
    else { pronum = 1; }
    ref.$pronum.val(pronum);
}
Product.plus = function () {
    var ref = this;
    var pronum = ref.$pronum.val();
    if (pronum && pronum > 0) { pronum++; }
    else { pronum = 1; }
    ref.$pronum.val(pronum);
}
Product.addFav = function () {
    var ref=this;
    var packet = { favurl: location.pathname, infoid: ref.proid, type: 2, title: $("title").text() };
    $.post("/API/mod/collect.ashx?action=add", packet, function (data) {
        var model = JSON.parse(data);
        if (APIResult.isok(model)) {
            alert("收藏成功!");
        } else {
            alert("收藏失败!原因:" + model.retmsg);
        }
    });
}
Product.init = function () {
    console.log("Product inited");
}