<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WordPanelIfr.aspx.cs" Inherits="WebFontPlugin.views.write.WordPanelIfr" MasterPageFile="~/Common/Master/Empty2.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
.word_wrap { display:none; background-image:url(/cmsplugins/webfontplugin/views/res/timg.jpg); background-size:cover; width:108px; height:108px; line-height:108px; text-align:center;}
.hbbg{background:url(/cmsplugins/webfontplugin/views/res/hdbg.jpg) no-repeat -4px -4px #fff;background-size:100%;
      position:absolute;width:600px;height:600px;z-index:-2;position:absolute;top:0px;left:0px;
}
.hbword{font-size:500px;position:absolute;top:0px;left:0px;z-index:-1;background-color:transparent;color:#eee;width:600px;height:600px; line-height:580px;text-align:center;}
.pen_style{border:1px solid #ddd;text-align:center;cursor:pointer;margin-bottom:5px;border-radius:5px;padding:7px;}
.pen_style:hover{background-color:rgba(70, 140, 203,1);color:#fff;}
.pen_style.active{background-color:rgba(70, 140, 203,1);color:#fff;}
</style>
<title>字体大师</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<!--<script src="/JS/Mobile/vconsole.min.js"></script>-->
<div class="container ZfontC_word" id="editorPage" onselect="return false;">
        <div class="panel panel-default ZfontC_tool" style="float:left;width:18%;">
                <div class="panel-heading"><i class="fa fa-inbox"></i> 笔触</div>
                <div class="panel-body btns">
                    <ul class="list-unstyled">
                        <li data-style="1" class="pen_style active"><i class="fa fa-paint-brush"></i> 圆润</li>
                        <li data-style="2" class="pen_style"><i class="fa fa-paint-brush"></i> 毛笔</li>
                        <li data-style="4" class="pen_style"><i class="fa fa-paint-brush"></i> 喷溅</li>
                        <li data-style="0" class="pen_style"><i class="fa fa-pencil"></i> 粉笔</li>
                        <li data-style="3" class="pen_style"><i class="fa fa-pencil"></i> 蜡笔</li>
                    </ul>
                    <div class="clearfix"></div>
                    <div class="size">
                        <div data-size="3" class="pen_size"><span style="width: 3px;"></span></div>
                        <div data-size="6" class="pen_size"><span style="width: 6px;"></span></div>
                        <div data-size="9"  class="pen_size""><span style="width: 9px;"></span></div>
                        <div data-size="12"  class="pen_size"><span style="width: 12px;"></span></div>
                        <div data-size="15"  class="pen_size active"><span style="width: 15px;"></span></div>
                        <div data-size="18"  class="pen_size"><span style="width: 18px;"></span></div>
                    </div>
                </div>
            </div>
        <div style="width:70%;float:right;">
            <div style="width: 600px; height: 600px;position:relative;">
                <canvas id="canvas_main" width="590" height="590" style="z-index:1;"></canvas>
                <div class="hbbg"></div>
                <div class="hbword showword">宋</div>
                <div runat="server" id="normal_wrap" class="text-center">
                    <input type="button" value="撤消" id="draw_pre" class="btn btn-info" />
                    <input type="button" value="恢复" id="draw_next" class="btn btn-info" />
                    <input type="button" value="清空画板" id="clearCanvas" class="btn btn-info" />
                    <input type="button" value="书写回放" id="RelpyCanvas" class="btn btn-info" />
                    <div class="text-center" style="margin-top: 50px;">
                        <a class="btn btn-lg btn-success" href="http://v.ziti163.com" target="_blank">
                            <i class="fa fa-flag fa-2x pull-left"></i>点击访问在线<br>
                            字库制作程序</a>
                    </div>
                </div>
            </div>
        </div>
        <div style="clear:both;"></div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/Plugins/Third/potrace.js"></script>
<script src="/JS/Modal/APIResult.js?v=100"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/Plugs/base64.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    var hwrite = { canvas: document.getElementById("canvas_main") };
    var vCanvasData = [];
    var vDrawCount = 0;
    var vCanvasList = new Array();
    var vCount = -1;
    
    var global = window;
        (function (global) {
            function isObject(value, ignoreArray) {
                return typeof value === "object" && value !== null
            }
            function isNumber(value) {
                return typeof value === "number"
            }
            function isString(value) {
                return typeof value === "string"
            }
            function isFunction(value) {
                return typeof value === "function"
            }
            function isArray(value) {
                return Object.prototype.toString.call(value) === "[object Array]"
            }
            function isNull(value) {
                return value === null
            }
            function isUndefined(value) {
                return typeof value === "undefined"
            }
            global.isObject = isObject;
            global.isNumber = isNumber;
            global.isString = isString;
            global.isFunction = isFunction;
            global.isArray = isArray;
            global.isNull = isNull;
            global.isUndefined = isUndefined;
            function extend() {
                var target = arguments[0] || {},
                o,
                p;
                for (var i = 1,
                len = arguments.length; i < len; i++) {
                    o = arguments[i];
                    if (!isObject(o)) continue;
                    for (p in o) {
                        target[p] = o[p]
                    }
                }
                return target
            }
            global.extend = extend; (function (global) {
                var limit = 0;
                var count = 0;
                function log() {
                    if (limit > 0) {
                        if (limit === count) return;
                        count++
                    }
                    window.console.log.apply(window.console, arguments)
                }
                log.limit = function (limitCount) {
                    limit = limitCount < 0 ? 0 : limitCount
                };
                global.log = log
            })(window);
            function Point(x, y) {
                this.x = x || 0;
                this.y = y || 0
            }
            Point.create = function (o, y) {
                if (isArray(o)) return new Point(o[0], o[1]);
                if (isObject(o)) return new Point(o.x, o.y);
                return new Point(o, y)
            };
            Point.add = function (p1, p2) {
                return new Point(p1.x + p2.x, p1.y + p2.y)
            };
            Point.subtract = function (p1, p2) {
                return new Point(p1.x - p2.x, p1.y - p2.y)
            };
            Point.scale = function (p, scaleX, scaleY) {
                if (isObject(scaleX)) {
                    scaleY = scaleX.y;
                    scaleX = scaleX.x
                } else if (!isNumber(scaleY)) {
                    scaleY = scaleX
                }
                return new Point(p.x * scaleX, p.y * scaleY)
            };
            Point.equals = function (p1, p2) {
                return p1.x == p2.x && p1.y == p2.y
            };
            Point.angle = function (p) {
                return Math.atan2(p.y, p.x)
            };
            Point.distance = function (p1, p2) {
                var a = p1.x - p2.x;
                var b = p1.y - p2.y;
                return Math.sqrt(a * a + b * b)
            };
            Point.dot = function (p1, p2) {
                return p1.x * p2.x + p1.y * p2.y
            };
            Point.cross = function (p1, p2) {
                return p1.x * p2.y - p1.y * p2.x
            };
            Point.interpolate = function (p1, p2, f) {
                var dx = p2.x - p1.x;
                var dy = p2.y - p1.y;
                return new Point(p1.x + dx * f, p1.y + dy * f)
            };
            Point.polar = function (length, radian) {
                return new Point(length * Math.sin(radian), length * Math.cos(radian))
            };
            Point.prototype = {
                add: function (p) {
                    return Point.add(this, p)
                },
                subtract: function (p) {
                    return Point.subtract(this, p)
                },
                scale: function (scaleX, scaleY) {
                    return Point.scale(this, scaleX, scaleY)
                },
                equals: function (p) {
                    return Point.equals(this, p)
                },
                angle: function () {
                    return Point.angle(this)
                },
                distance: function (p) {
                    return Point.distance(this, p)
                },
                length: function () {
                    return Math.sqrt(this.x * this.x + this.y * this.y)
                },
                set: function (x, y) {
                    if (isObject(x)) {
                        y = x.y;
                        x = x.x
                    }
                    this.x = x || 0;
                    this.y = y || 0;
                    return this
                },
                offset: function (x, y) {
                    if (isObject(x)) {
                        y = x.y;
                        x = x.x
                    }
                    this.x += x || 0;
                    this.y += y || 0;
                    return this
                },
                normalize: function (thickness) {
                    if (isNull(thickness) || isUndefined(thickness)) {
                        thickness = 1
                    }
                    var length = this.length();
                    if (length > 0) {
                        this.x = this.x / length * thickness;
                        this.y = this.y / length * thickness
                    }
                    return this
                },
                negate: function () {
                    this.x *= -1;
                    this.y *= -1;
                    return this
                },
                perp: function () {
                    this.x = -y;
                    this.y = x;
                    return this
                },
                clone: function () {
                    return Point.create(this)
                },
                toArray: function () {
                    return [this.x, this.y]
                },
                toString: function () {
                    return "(x:" + this.x + ", y:" + this.y + ")"
                }
            };
            global.Point = Point
        })(window);
        (function () {
            function h(a) {
                return document.getElementById(a)
            }
            if (hwrite.canvas) {
                var vCanvas = hwrite.canvas;
                var vContext = hwrite.canvas.getContext("2d");         
                var ctx = vContext
            }
            function getCookie(name) {
                var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
                if (arr != null) return unescape(arr[2]);
                return null
            }
            var penpen = 15;
            var DEFAULT_BRUSHINK_SIZE = penpen * 3;
            var INK_AMOUNT = 6;
            var SPLASH_RANGE = 66;
            var SPLASH_INK_SIZE = 6;
            var BACKGROUND_COLOR = "";
            var DEFAULT_BRUSHCRAYON_SIZE = penpen * 3;
            var COLOR_LIST = ["rgb(0, 0, 0)"];
            var ALPHA = 1;
            function r() {
				//如果方向变更,刷新
                function a() {
                    "number" == typeof window.orientation && 0 !== window.orientation || "function" != typeof r || location.reload()
                }
                window.onorientationchange = a;
                if ("number" == typeof window.orientation && 0 !== window.orientation){a();}
				if(false){}
                else {
                    r = null;
                    var d = hwrite.canvas;
                    var f = new v(d);
                    window.PENSIZE && (f.c = window.PENSIZE);
                    h("clearCanvas").onclick = function () {
                        if (!confirm("确定要清空画板吗")) { return false; }
                        if (vCanvasData.length <= 0) {
                            return;
                        } else {
                            f.A();
                            vDrawCount = 0;
                            vCount = -1;
                            s = 0;
                            n = "";
                            vCanvasData = [];
                            vCanvasList = new Array();
                            f.vI = 0
                        }
                    };
                    $(".pen_size").click(function () {
                        var $this = $(this);
                        $this.siblings(".pen_size").removeClass("active").end().addClass("active");
                        var size = $this.data("size");
                        setPenSize(size);
                        document.cookie = "pen="+size+";path=/";
                        document.cookie = "pendx=" + parseInt(size / 3) + ";path=/";
                    });
                    $(".pen_style").click(function () {
                        var $this = $(this);
                        $this.siblings(".pen_style").removeClass("active").end().addClass("active");
                        var style = $this.data("style");
                        setPenType(style);
                        document.cookie = "bishua=" + style + ";path=/";
                    });
                    h("draw_pre").onclick = function () {
                        f.pre()
                    };
                    h("draw_next").onclick = function () {
                        f.next()
                    };
                    h("RelpyCanvas").onclick = function () {
                        ReWrite()
                    };
                    document.ontouchmove = function (a) {
                        a.preventDefault()
                    };
                    //-------------------------------------------
                    //var l = 0,
                    //penSize = h("penSize"),
                    //penType = h("penType");
                    //-------------------------------------------
                    var bishua = getCookie("bishua");
                    if (!bishua) {
                        $(".pen_style[data-style=1]").click();
                    } else {
                        $(".pen_style[data-style=" + bishua + "]").click();
                    }
                    //-------------------------------------------
                    function setPenSize(a) {
                        f.c = a;
                        brushInk.size = a * 3;
                        brushCrayon.size = a * 3
                    }
                    function setPenType(a) {
                        f.penType = parseInt(a)
                    }
                    function setPenColor(a) {
                        f.color = a;
                        brushInk.color = a;
                        currentColor = a;
                        vColor = a;
                        ctx.fillStyle = a
                    }
                    var _vSetTimeOut;
                    function ReWrite() {
                        if (vCanvasData.length <= 0) {
                            //    alert("你尚未书写内容");
                            return;
                        }
                        f.write = false;
                        f.A();
                        vDrawCount = 0;
                        r = 0;
                        n = "";
                        f.w();
                        if (_vSetTimeOut) {
                            clearTimeout(_vSetTimeOut)
                        }
                        f.setDrawFalse();
                        var i = 0,
                        j = 0;
                        if (vCount == -1) {
                            f.write = true;
                            alert("已经没有笔划了");
                            return
                        }
                        function write() {
                            //会有null值进入
                            if (!vCanvasData[i]) { i++; _vSetTimeOut = setTimeout(write, 10); return;}
                            var _vX = vCanvasData[i].XY[j];
                            var _vY = vCanvasData[i].XY[j + 1];
                            var _vCWH = vCanvas.width;
                            var _vCWHH = vCanvas.height;
                            _vX = _vX * (_vCWH / vCanvasData[i].VW);
                            _vY = _vY * (_vCWHH / vCanvasData[i].VW);
                            if (j == 0 || j == vCanvasData[i].XY.length - 2) {
                                f.setDrawFalse();
                                f.relpy(_vX, _vY);
                                f.w();
                                if (vCanvasData[i].VC == 0) {
                                    setPenColor("rgba(0,0,0, 1)")
                                } else {
                                    setPenColor("rgba(0,0,0, 1)")
                                }
                                setPenSize(vCanvasData[i].VS * (_vCWH / vCanvasData[i].VW));
                                f.t(_vX, _vY, vCanvasData[i].VP);
                                f.setDrawTrue(vCanvasData[i].VP, _vX, _vY)
                            }
                            try {
                                f.t(_vX, _vY, vCanvasData[i].VP)
                            } catch (e) {
                                alert(e.message);
                            }
                            j += 2;
                            if (j > vCanvasData[i].XY.length - 2) {
                                if (i == vCount) {
                                    f.write = true;
                                    return
                                } else {
                                    i++;
                                    j = 0
                                }
                            }
                            _vSetTimeOut = setTimeout(write, 10)
                        }
                        write()
                    }
                    g("editor")
                }
            }
            function q(a, b) {
                b = b || "";
                if (25 == a.length) return window.shareData.image;
                if (27 == a.length) return window.shareData.image;
                if (28 == a.length) return window.shareData.image
            }
            function g(a, b) {
                "upload" == a && "" != b ? (u(), h("editorPage").style.display = "block", h("uploadPage").style.display = "block", h("uploadPage").innerHTML = b) : "editor" == a ? -1 !== navigator.userAgent.indexOf("MSIE") ? document.write('<div style="font-size:2em;text-align:center;padding:2em;">' + (k.a10 || "\u4f7f\u7528\u6211\u5b57\u9177\u5199\u5b57\u9700\u8981\u4f7f\u7528\u652f\u6301HTML5\u7684\u6d4f\u89c8\u5668\uff0c\u5982\u6700\u65b0\u7248\u7684360\u6d4f\u89c8\u5668\u3001Chrome\u3001\u767e\u5ea6\u3001UC\u3001\u706b\u72d0\u7b49\u6d4f\u89c8\u5668\u3002") + "</div>") : (u(), h("editorPage").style.display = "block") : "show" == a && "" != b ? (u(), h("showPage").style.display = "block", h("showImg").src = b) : "share" == a && (h("uploadPage").style.display = "none", h("shareAlert").style.display = "block", setTimeout(function () {
                    h("shareAlert").style.display = "none"
                },
                15e3))
            }
            function u() {
                
            }
            function v(a) {
                if (a.nodeType) this.canvas = a;
                else if ("string" == typeof a) this.canvas = document.getElementById(a);
                else return;
                this.D()
            }
            function w(a, b, c, d) {
                if (!c.p.complete || !c.o.complete) return "";
                d = d || 590;
                a = a || "png";
                b = b || .7;
                var e = hwrite.canvas;
                e.width = e.height = d;
                var f, l, h, k, g = c.canvas.width,
                m = c.canvas.height;
                if (1.8 < g / d) for (f = hwrite.canvas, l = hwrite.canvas, h = f.getContext("2d"), k = l.getContext("2d"), f.width = g, f.height = m, h.drawImage(c.canvas, 0, 0, g, m) ; 1.8 < g / d;) g = Math.round(.6 * g),
                m = Math.round(.6 * m),
                l.width = g,
                l.height = m,
                k.drawImage(f, 0, 0, g, m),
                f.width = g,
                f.height = m,
                h.drawImage(l, 0, 0, g, m);
                else f = c.canvas;
                l = e.getContext("2d");
                l.drawImage(c.o, 0, 0, d, d);
                l.drawImage(f, 0, 0, d, d);
                l.drawImage(c.p, d / 590 * 19, d / 590 * 16, d / 590 * 101, d / 590 * 39);
                return e.toDataURL("image/" + a, b)
            }
            if (hwrite.canvas) {
                function Hair(x, y, lineWidth, inkAmount) {
                    this.x = x || 0;
                    this.y = y || 0;
                    this.lineWidth = lineWidth;
                    this.inkAmount = inkAmount;
                    this._currentLineWidth = this.lineWidth;
                    this._latest = {
                        x: this.x,
                        y: this.y
                    }
                }
                Hair.prototype = {
                    update: function (strokeX, strokeY, strokeLength) {
                        this._latest.x = this.x;
                        this._latest.y = this.y;
                        this.x += strokeX;
                        this.y += strokeY;
                        var per = Math.min(this.inkAmount / strokeLength, 1);
                        this._currentLineWidth = this.lineWidth * per
                    },
                    draw: function (ctx, color) {
                        ctx.save();
                        ctx.lineCap = "round";
                        line(ctx, this._latest, this, color, this._currentLineWidth);
                        ctx.restore()
                    }
                };
                function Drop(x, y, amount, color, strokeId) {
                    this.x = x || 0;
                    this.y = y || 0;
                    this.amount = random(amount, amount * .5);
                    this.life = this.amount * 1.5;
                    this.color = color;
                    this.strokeId = strokeId;
                    this._latest = {
                        x: this.x,
                        y: this.y
                    }
                }
                Drop.prototype = {
                    _xrate: 0,
                    update: function (brushInk) {
                        var dx = brushInk.x - this.x;
                        var dy = brushInk.y - this.y;
                        if (brushInk.size * .3 > Math.sqrt(dx * dx + dy * dy) && brushInk.strokeId !== this.strokeId) {
                            this.life = 0;
                            return
                        }
                        this._latest.x = this.x;
                        this._latest.y = this.y;
                        this.y += random(this.life * .5);
                        this.x += this.life * this._xrate;
                        this.life -= random(.05, .01);
                        if (random() < .03) {
                            this._xrate += random(.03, -.03)
                        } else if (random() < .05) {
                            this._xrate *= .01
                        }
                    },
                    draw: function (ctx) {
                        ctx.save();
                        ctx.lineCap = ctx.lineJoin = "round";
                        line(ctx, this._latest, this, this.color, this.amount + this.life * .3);
                        ctx.restore()
                    }
                };
                function BrushInk(x, y, size, inkAmount, splashRange, splashInkSize) {
                    this.x = x;
                    this.y = y;
                    this.size = size;
                    this.inkAmount = inkAmount;
                    this.splashRange = splashRange;
                    this.splashInkSize = splashInkSize;
                    this.color = {
                        h: 0,
                        s: 0,
                        l: 0,
                        a: 1,
                        toString: function () {
                            return "hsla(" + this.h + ", " + this.s + "%, " + this.l + "%, " + this.a + ")"
                        }
                    };
                    this.resetTip();
                    this._drops = []
                }
                BrushInk.prototype = {
                    isStroke: false,
                    strokeId: null,
                    _latest: null,
                    _strokeRenderCount: 0,
                    _dropCount: 0,
                    _hairs: null,
                    _latestStrokeLength: 0,
                    set: function (p) {
                        if (!this._latest) {
                            this._latest = p.clone()
                        } else {
                            this._latest.set(this)
                        }
                        Point.prototype.set.call(this, p)
                    },
                    update: function (p) {
                        this.set(p);
                        this._latestStrokeLength = this.subtract(this._latest).length()
                    },
                    startStroke: function () {
                        this.resetTip();
                        this.strokeId = new Date().getTime();
                        this._dropCount = random(6, 3) | 0;
                        this.isStroke = true
                    },
                    endStroke: function () {
                        this.isStroke = false;
                        this._strokeRenderCount = 0;
                        this._dropCount = 0;
                        this.strokeId = null
                    },
                    resetTip: function () {
                        var hairs = this._hairs = [];
                        var inkAmount = this.inkAmount;
                        var hairNum = this.size * 2;
                        var range = this.size / 2;
                        var rx, ry, c0, x0, y0;
                        var c = random(Math.PI * 2),
                        cv,
                        sv,
                        x,
                        y;
                        for (var i = 0,
                        r; i < hairNum; i++) {
                            rx = random(range);
                            ry = rx / 2;
                            c0 = random(Math.PI * 2);
                            x0 = rx * Math.sin(c0);
                            y0 = ry * Math.cos(c0);
                            cv = Math.cos(c);
                            sv = Math.sin(c);
                            x = this.x + x0 * cv - y0 * sv;
                            y = this.y + x0 * sv + y0 * cv;
                            hairs[i] = new Hair(x, y, 10, inkAmount)
                        }
                        this.color.h += 140
                    },
                    render: function (ctx, mouseX, mouseY) {
                        this._strokeRenderCount++;
                        if (this._strokeRenderCount % 120 === 0 && this._dropCount < 10) {
                            this._dropCount++
                        }
                        if (!this._latest) {
                            this._latest = {
                                x: mouseX,
                                y: mouseY
                            }
                        } else {
                            this._latest.x = this.x;
                            this._latest.y = this.y
                        }
                        this.x = mouseX;
                        this.y = mouseY;
                        var dx = this.x - this._latest.x;
                        var dy = this.y - this._latest.y;
                        var dist = this._latestStrokeLength = Math.sqrt(dx * dx + dy * dy);
                        var hairs = this._hairs;
                        var i, len;
                        for (i = 0, len = hairs.length; i < len; i++) {
                            hairs[i].update(dx, dy, dist)
                        }
                        if (this.isStroke) {
                            var color = this.color.toString();
                            for (i = 0, len = hairs.length; i < len; i++) {
                                hairs[i].draw(ctx, color)
                            }
                            if (dist > 30) {
                                this.drawSplash(ctx, this.splashRange, 0)
                            } else if (dist && dist < 10 && random() < 0 && this._dropCount) {
                                this._drops.push(new Drop(this.x, this.y, random(this.size * .25, this.size * .1), color, this.strokeId));
                                this._dropCount--
                            }
                            vDrawCount++
                        }
                        var drops = this._drops,
                        drop;
                        for (i = 0, len = drops.length; i < len; i++) {
                            drop = drops[i];
                            drop.update(this);
                            drop.draw(ctx);
                            if (drop.life < 0) {
                                drops.splice(i, 1);
                                len--;
                                i--
                            }
                        }
                    },
                    renders: function (ctx, mouseX, mouseY) {
                        this._strokeRenderCount++;
                        if (this._strokeRenderCount % 120 === 0 && this._dropCount < 10) {
                            this._dropCount++
                        }
                        if (!this._latest) {
                            this._latest = {
                                x: mouseX,
                                y: mouseY
                            }
                        } else {
                            this._latest.x = this.x;
                            this._latest.y = this.y
                        }
                        this.x = mouseX;
                        this.y = mouseY;
                        var dx = this.x - this._latest.x;
                        var dy = this.y - this._latest.y;
                        var dist = this._latestStrokeLength = Math.sqrt(dx * dx + dy * dy);
                        var hairs = this._hairs;
                        var i, len;
                        for (i = 0, len = hairs.length; i < len; i++) {
                            hairs[i].update(dx, dy, dist)
                        }
                        if (this.isStroke) {
                            var color = this.color.toString();
                            for (i = 0, len = hairs.length; i < len; i++) {
                                hairs[i].draw(ctx, color)
                            }
                            if (dist > 30) {
                                this.drawSplash(ctx, this.splashRange, this.splashInkSize)
                            } else if (dist && dist < 10 && random() < .025 && this._dropCount) {
                                this._drops.push(new Drop(this.x, this.y, random(this.size * .15, this.size * .1), color, this.strokeId));
                                this._dropCount--
                            }
                            vDrawCount++
                        }
                        var drops = this._drops,
                        drop;
                        for (i = 0, len = drops.length; i < len; i++) {
                            drop = drops[i];
                            drop.update(this);
                            drop.draw(ctx);
                            if (drop.life < 0) {
                                drops.splice(i, 1);
                                len--;
                                i--
                            }
                        }
                    },
                    removeDrop: function () {
                        this._drops = []
                    },
                    drawSplash: function (ctx, range, maxSize) {
                        var num = random(12, 0);
                        var c, r, x, y;
                        ctx.save();
                        for (var i = 0; i < num; i++) {
                            r = random(range, 1);
                            c = random(Math.PI * 2);
                            x = this.x + r * Math.sin(c);
                            y = this.y + r * Math.cos(c);
                            dot(ctx, x, y, this.color.toString(), random(maxSize, 0))
                        }
                        ctx.restore()
                    }
                };
                function BrushCrayon(x, y, size, inkAmount) {
                    Point.call(this, x, y);
                    this.size = size;
                    this.inkAmount = inkAmount;
                    this._latest = null;
                    this._latestStrokeLength = 0
                }
                BrushCrayon.prototype = extend({},
                Point.prototype, {
                    set: function (p) {
                        if (!this._latest) {
                            this._latest = p.clone()
                        } else {
                            this._latest.set(this)
                        }
                        Point.prototype.set.call(this, p)
                    },
                    update: function (p) {
                        this.set(p);
                        this._latestStrokeLength = this.subtract(this._latest).length()
                    },
                    draw: function (ctx, x, y) {
                        this._latest.set(x, y);
                        var v = this.subtract(this._latest);
                        var s = Math.ceil(this.size / 2);
                        var stepNum = Math.floor(v.length() / s) + 1;
                        v.normalize(s);
                        var sep = 2.5;
                        var dotSize = sep * Math.min(this.inkAmount / this._latestStrokeLength * 3, 1);
                        var dotNum = Math.ceil(this.size * sep);
                        var range = this.size / 2;
                        var i, j, p, r, c, x, y;
                        vDrawCount++;
                        ctx.save();
                        ctx.fillStyle = currentColor;
                        ctx.beginPath();
                        for (i = 0; i < dotNum; i++) {
                            for (j = 0; j < stepNum; j++) {
                                p = this._latest.add(v.scale(j));
                                r = random(range);
                                c = random(Math.PI * 2);
                                w = random(dotSize, dotSize / 2);
                                _vh = random(dotSize, dotSize / 2);
                                x = p.x + r * Math.sin(c) - w / 2;
                                y = p.y + r * Math.cos(c) - _vh / 2;
                                ctx.rect(x, y, w, _vh)
                            }
                        }
                        ctx.fill();
                        ctx.restore()
                    },
                    fenbidraw: function (ctx, x, y) {
                        this._latest.set(x, y);
                        var v = this.subtract(this._latest);
                        var s = Math.ceil(this.size / 200);
                        var stepNum = Math.floor(v.length() / s) + 1;
                        v.normalize(s);
                        var sep = 1.8;
                        var dotSize = sep * Math.min(this.inkAmount / this._latestStrokeLength * 3, 1);
                        var dotNum = Math.ceil(this.size * sep);
                        var range = this.size / 2;
                        var i, j, p, r, c, x, y;
                        vDrawCount++;
                        ctx.save();
                        ctx.fillStyle = currentColor;
                        ctx.beginPath();
                        for (i = 0; i < dotNum; i++) {
                            for (j = 0; j < stepNum; j++) {
                                p = this._latest.add(v.scale(j));
                                r = random(range);
                                c = random(Math.PI * 2);
                                w = random(dotSize, dotSize / 2);
                                _vvh = random(dotSize, dotSize / 2);
                                x = p.x + r * Math.sin(c) - w / 2;
                                y = p.y + r * Math.cos(c) - _vvh / 2;
                                ctx.rect(x, y, w, _vvh)
                            }
                        }
                        ctx.fill();
                        ctx.restore()
                    }
                });
                var bMouseDown = false;
                var BubbleBrush = {
                    iPrevX: 0,
                    iPrevY: 0,
                    startCurve: function (x, y) {
                        this.iPrevX = x;
                        this.iPrevY = y
                    },
                    draw: function (x, y) {
                        var iXAbs = Math.abs(x - this.iPrevX);
                        var iYAbs = Math.abs(y - this.iPrevY);
                        iXAbs = iXAbs > 30 ? 30 : iXAbs;
                        iYAbs = iYAbs > 30 ? 30 : iYAbs;
                        if (iXAbs > 10 || iYAbs > 10) {
                            ctx.beginPath();
                            ctx.arc(this.iPrevX, this.iPrevY, (iXAbs + iYAbs) * .5, 0, Math.PI * 2, false);
                            ctx.fill();
                            ctx.stroke();
                            ctx.restore();
                            this.iPrevX = x;
                            this.iPrevY = y;
                            vDrawCount++
                        }
                    }
                };
                var mouse = {
                    x: 0,
                    y: 0
                };
                try {
                    var brushInk = new BrushInk(0, 0, DEFAULT_BRUSHINK_SIZE, INK_AMOUNT, SPLASH_RANGE, SPLASH_INK_SIZE);
                    function loopInk() {
                        brushInk.render(hwrite.canvas.getContext("2d"), mouse.x, mouse.y)
                    }
                    function loopInks() {
                        brushInk.renders(hwrite.canvas.getContext("2d"), mouse.x, mouse.y)
                    }
                } catch (e) {
                    alert(e)
                }
                var mouseCrayon = new Point();
                var isMouseDownCrayon = false;
                var brushCrayon;
                var currentColorIndex = 0;
                var currentColor = COLOR_LIST[currentColorIndex];
                var brushCrayon_color = currentColor;
                var initTrue = false;
                var vBrushNullCall = false;
                var vDefaultPen = false;
                try {
                    var brushCrayon = new BrushCrayon(0, 0, DEFAULT_BRUSHCRAYON_SIZE, 50);
                    function loopCrayon() {
                        brushCrayon.update(mouseCrayon);
                        initTrue = true
                    }
                } catch (e) {
                    alert(e)
                }
            }
            var A = navigator.userAgent.match(/ OS (\d+).*? Mac OS/) || !1,
            n = "",
            s = 0,
            y = -1 !== navigator.userAgent.indexOf("NetType/WIFI"),
            t = -1 !== navigator.userAgent.indexOf("Messenger"),
            k = window.LANG || {};
            v , v.prototype = {
                lineWidth: 1,
                color: "rgba(0,0,0, 1)",
                c: penpen,
                b: 320,
                v: "",
                k: 0,
                penType: 2,
                x: 0,
                y: 0,
                vI: 0,
                write: true,
                D: function () {
                    var a = this;
                    var _vThis = this;
                    if (this.canvas.getContext) {
                        this.a = this.canvas.getContext("2d");
                        this.a.strokeStyle = this.color;
                        this.a.fillStyle = this.color;
                        this.h(this.canvas, "selectstart",
                        function () {
                            return !1
                        });
                        this.o = new Image();
                        this.o.src = this.v;
                        var b = function (c) {
                            var d, e;
                            if ("touchstart" == c.type) {
                                if (2 <= c.touches.length) return;
                                d = c.touches[0].pageX;
                                e = c.touches[0].pageY;
                                a.f(a.canvas, "mousedown", b)
                            } else d = c.pageX,
                            e = c.pageY;
                            if (_vThis.write) {
                                _vThis.setDrawFalse();
                                a.F(d, e, c.type);
                                _vThis.setDrawTrue(_vThis.penType, d, c)
                            }
                            c.preventDefault()
                        };
                        this.h(this.canvas, "touchstart", b);
                        this.h(this.canvas, "mousedown", b);
                        setInterval(loopInk, 1e3 / 60);
                        setInterval(loopInks, 1e3 / 60);
                        setInterval(loopCrayon, 1e3 / 60)
                    }
                },
                F: function (a, b, c) {
                    var d = this;
                    this.relpy(a, b);
                    this.g && (this.f(document, "mousemove", this.g), this.f(document, "touchmove", this.g), this.f(document, "mouseup", this.j), this.f(document, "touchend", this.j));
                    var _vXYI = 0;
                    var _vTI = 0;
                    this.g = function (a) {
                        var b, c;
                        if ("touchmove" == a.type) {
                            if (2 <= a.touches.length) return;
                            b = a.touches[0].pageX;
                            c = a.touches[0].pageY
                        } else b = a.pageX,
                        c = a.pageY;
                        try {
                            b -= d.i.left;
                            c -= d.i.top;
                            d.addJson(vCanvasData[d.vI].XY, _vXYI++, b.toFixed(2) * 1);
                            d.addJson(vCanvasData[d.vI].XY, _vXYI++, c.toFixed(2) * 1)
                        } catch (e) {
                            alert(e)
                        }
                        d.t(b, c, d.penType);
                        a.preventDefault()
                    };
                    this.j = function () {
                        vCanvasList[++vCount] = hwrite.canvas.getContext("2d").canvas.toDataURL();
                        d.addJson(vCanvasData[d.vI].XY, _vXYI++, 0);
                        d.addJson(vCanvasData[d.vI].XY, _vXYI++, 0);
                        d.G();
                        isMouseDownCrayon = false;
                        vDefaultPen = false;
                        brushInk.endStroke();
                        bMouseDown = false;
                        vBrushNullCall = false;
                        d.vI++
                    };
                    "touchstart" == c ? (this.h(document, "touchmove", this.g), this.h(document, "touchend", this.j)) : (this.h(document, "mousemove", this.g), this.h(document, "mouseup", this.j));
                    this.w();
                    try {
                        var _vCWidth = this.canvas.getBoundingClientRect().width;
                        var _vCHeight = this.canvas.getBoundingClientRect().height;
                        d.addJson(vCanvasData, d.vI, {
                            VW: _vCWidth,
                            VC: d.color,
                            VS: d.c,
                            VP: d.penType,
                            XY: []
                        })
                    } catch (e) {
                        console.log(e)
                    }
                    a -= d.i.left;
                    b -= d.i.top;
                    this.t(a, b, d.penType)
                },
                t: function (a, b, _vType) {
                    var c;
                    c = 0;
                    mouse.x = a,
                    mouse.y = b;
                    var _vThis = this;
                    switch (_vType) {
                        case 0:
                            if (isMouseDownCrayon && initTrue) {
                                brushCrayon.fenbidraw(vContext, a, b)
                            }
                            mouseCrayon.set(a, b);
                            brushCrayon.update(mouseCrayon);
                            break;
                        case 1:
                            vContext.beginPath();
                            if (vBrushNullCall) {
                                _vThis.BrushNuLL(c, a, b)
                            }
                            break;
                        case 2:
                            brushInk.render(vContext, a, b);
                            break;
                        case 3:
                            if (isMouseDownCrayon && initTrue) {
                                brushCrayon.draw(vContext, a, b)
                            }
                            mouseCrayon.set(a, b);
                            brushCrayon.update(mouseCrayon);
                            break;
                        case 4:
                            brushInk.renders(vContext, a, b);
                            break
                    }
                },
                q: function (a, b) {
                    var c = a.x,
                    d = a.y,
                    e = a.r,
                    f = A ? 4 : 2;
                    if (!this.e || 0 !== e) {
                        var g = this.d.length ? this.d[0] : null;
                        if (e) {
                            this.a.moveTo(this.e.x, this.e.y);
                            if (!this.s && (this.s = 1, g && e > g.r * f)) for (e /= 4, f = 1; 4 >= f; f++) this.u(c + f / 4 * (this.e.x - c), d + f / 4 * (this.e.y - d));
                            b || (b = e < .003125 * this.b ? this.b / 320 * this.c * 1.625 : e < .00625 * this.b ? this.b / 320 * this.c * 1.375 : e < .009375 * this.b ? this.b / 320 * this.c * 1.25 : e < .015625 * this.b ? this.b / 320 * this.c * 1.125 : e < .021875 * this.b ? this.b / 320 * this.c : e < .028125 * this.b ? this.b / 320 * this.c * .875 : e < .034375 * this.b ? this.b / 320 * this.c * .75 : e < .046875 * this.b ? this.b / 320 * this.c * .625 : e < .0625 * this.b ? this.b / 320 * this.c * .5 : this.b / 320 * this.c * .375);
                            this.n = b;
                            Math.abs(this.lineWidth - this.n) > this.b / 320 * this.c * .025 && (this.lineWidth -= (this.lineWidth - this.n) / 8, this.a.lineWidth = this.lineWidth)
                        }
                        this.e = a;
                        this.u(c, d)
                    }
                },
                G: function () {
                    this.f(document, "mousemove", this.g);
                    this.f(document, "touchmove", this.g);
                    this.f(document, "mouseup", this.j);
                    this.f(document, "touchend", this.j); --this.a.lineWidth;
                    for (var a; this.d.length;) a = this.d.shift(),
                    this.q(a, this.b / 320 * this.c / 4)
                },
                A: function () {
                    this.e = null;
                    this.k = 0;
                    vDrawCount = 0;
                    this.a.clearRect(0, 0, this.canvas.width, this.canvas.height);
                    this.a.beginPath()
                },
                u: function (a, b) {
                    var c, d, e;
                    this.a.fillStyle = this.color;
                    this.a.strokeStyle = this.color;
                    this.a.lineTo(this.e.x, this.e.y);
                    this.a.stroke();
                    this.a.beginPath();
                    this.a.strokeStyle = "rgba(0, 0, 0, 0)";
                    if (this.l || this.m) if (c = this.l - a, d = this.m - b, e = Math.sqrt((this.l - a) * (this.l - a) + (this.m - b) * (this.m - b)), Math.abs(e) > this.lineWidth / 3) {
                        e = Math.floor(Math.abs(e) / (this.lineWidth / 3));
                        for (var f = 1; f <= e; f++) Math.abs(this.lineWidth - this.n) > this.b / 320 * this.c * .025 && (this.lineWidth -= Math.round(this.lineWidth - this.n) / 8, this.a.lineWidth = this.lineWidth),
                        this.a.arc(this.l - f / e * c, this.m - f / e * d, this.lineWidth, 0, 2 * Math.PI),
                        this.a.fill(),
                        this.a.stroke(),
                        this.a.beginPath()
                    }
                    this.a.arc(a, b, this.lineWidth, 0, 2 * Math.PI);
                    this.a.fill();
                    this.a.stroke();
                    this.a.beginPath();
                    this.l = a;
                    this.m = b
                },
                w: function () {
                    this.m = this.l = 0
                },
                h: function (a, b, c) {
                    a.attachEvent ? a.attachEvent("on" + b, c) : a.addEventListener(b, c, !1)
                },
                f: function (a, b, c) {
                    a.detachEvent ? a.detachEvent("on" + b, c) : a.removeEventListener(b, c, !1)
                },
                B: function (a, b) {
                    return w(a, b, this, 590)
                },
                C: function (a, b) {
                    return w(a, b, this, 80)
                },
                Remove: function (a, b, c) {
                    a.removeEventListener(b, c, !1)
                },
                BrushNuLL: function (c, a, b) {
                    if (this.d.length && (c = this.d[this.d.length - 1], c = Math.sqrt((c.x - a) * (c.x - a) + (c.y - b) * (c.y - b)), 0 == c)) {
                        return
                    }
                    vDrawCount++;
                    this.d.push({
                        x: a,
                        y: b,
                        r: c
                    });
                    3 <= this.d.length && (c = this.d.shift(), this.q(c))
                },
                Brushyb: function (c, a, b) {
                    if (this.d.length && (c = this.d[this.d.length - 1], c = Math.sqrt((c.x - a) * (c.x - a) + (c.y - b) * (c.y - b)), 0 == c)) {
                        return
                    }
                    vDrawCount++;
                    this.d.push({
                        x: a,
                        y: b,
                        r: c
                    });
                    3 <= this.d.length && (c = this.d.shift(), this.mg(c))
                },
                setDrawTrue: function (_vType, d, c) {
                    d -= this.i.left;
                    c -= this.i.top;
                    switch (_vType) {
                        case 0:
                            isMouseDownCrayon = true;
                            break;
                        case 1:
                            vBrushNullCall = true;
                            break;
                        case 2:
                            brushInk.startStroke();
                            break;
                        case 3:
                            isMouseDownCrayon = true;
                            break;
                        case 4:
                            brushInk.startStroke();
                            break
                    }
                },
                setDrawFalse: function () {
                    isMouseDownCrayon = false;
                    vDefaultPen = false;
                    brushInk.endStroke();
                    bMouseDown = false;
                    vBrushNullCall = false
                },
                relpy: function (a, b) {
                    var d = this;
                    this.i = this.canvas.getBoundingClientRect();
                    this.i = {
                        left: this.i.left + (window.scrollX || window.pageXOffset),
                        top: this.i.top + (window.scrollY || window.pageYOffset)
                    };
                    window.getSelection() ? window.getSelection().removeAllRanges() : document.selection.empty();
                    this.a.moveTo(a - this.i.left, b - this.i.top);
                    this.e = null;
                    this.s = 0;
                    this.d = [];
                    this.lineWidth = this.c / 2 * (this.b / 320)
                },
                addJson: function (json, key, value) {
                    return json[key] = value
                },
                pre: function () {
                    try {
                        if (vCount >= 0) {
                            var vThis = this;
                            var img = new Image();
                            if (vCount - 1 > -1) {
                                img.src = vCanvasList[--vCount];
                                img.onload = function () {
                                    vThis.vI = vCount + 1;
                                    vThis.a.clearRect(0, 0, vThis.canvas.width, vThis.canvas.height);
                                    vThis.a.drawImage(img, 0, 0);
                                    vThis.write = true
                                }
                            } else {
                                --vCount;
                                vThis.a.clearRect(0, 0, vThis.canvas.width, vThis.canvas.height)
                            }
                        } else if (vCanvasData.length <= 0) {
                            return;
                        } else {
                            return;
                        }
                    } catch (e) { }
                },
                next: function () {
                    try {
                        if (vCount < vCanvasList.length - 1) {
                            var vThis = this;
                            var img = new Image(); ++vCount;
                            img.src = vCanvasList[vCount];
                            img.onload = function () {
                                vThis.vI = vCount + 1;
                                vThis.a.clearRect(0, 0, vThis.canvas.width, vThis.canvas.height);
                                vThis.a.drawImage(img, 0, 0);
                                vThis.write = true
                            }
                        } else if (vCanvasData.length <= 0) {
                            return;
                        } else {
                            return;
                        }
                    } catch (e) { console.log("next",e.message); }
                }
            },
            r()
        })();
        function line(ctx, p1, p2, color, lineWidth) {
            ctx.strokeStyle = color;
            ctx.lineWidth = lineWidth;
            ctx.beginPath();
            ctx.moveTo(p1.x, p1.y);
            ctx.lineTo(p2.x, p2.y);
            ctx.stroke()
        }
        function dot(ctx, x, y, color, size) {
            ctx.fillStyle = color;
            ctx.beginPath();
            ctx.arc(x, y, size / 2, 0, Math.PI * 2, false);
            ctx.fill()
        }
        function random(max, min) {
            if (typeof max !== "number") {
                return Math.random()
            } else if (typeof min !== "number") {
                min = 0
            }
            return Math.random() * (max - min) + min
        }
    </script>
<script>
    var editor = { api: "/webfont/api.aspx?action=", wordMod: null, bkfont: true };
      editor.init = function () {
        editor.wordMod = { "id": 0, "unicode": "23435", "word": "宋", "writeid": 0, "vCanvasData": null, "vCanvasList": null, "vCount": 0 };
        $(".showword").text(editor.wordMod.word);
    }
    //保存当前文字,并加载下一个
    editor.newfont = function () {

    }
    editor.urlToList = function () { location = "/WebFont/Write/WordList.aspx?ID="+editor.wordMod.writeid; }
    editor.init();
    editor.toggle = function (btn) {
        //bkfont
        var $wrap = $(".word_wrap");
        editor.bkfont = !editor.bkfont;
        if (editor.bkfont) {
            $(btn).html('<i class="fa fa-eye"></i>');
            $wrap.hide();
            $(".hbword").show();
        }
        else {
            $(btn).html('<i class="fa fa-eye-slash"></i>');
            $wrap.show();
            $(".hbword").hide();
        }
    }
</script>
</asp:Content>
