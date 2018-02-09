fabric.Sprite = fabric.util.createClass(fabric.Image, {

  type: 'sprite',

  spriteWidth: 50,
  spriteHeight: 72,
  spriteIndex: 0,

  initialize: function(element, options) {
      options || (options = {});
    if (options.width) { this.spriteWidth = options.width; }
    if (options.height) { this.spriteHeight = options.height; }
    this.callSuper('initialize', element, options);

    this.createTmpCanvas();
    this.createSpriteImages();
  },

  createTmpCanvas: function () {
    this.tmpCanvasEl = fabric.util.createCanvasElement();
    this.tmpCanvasEl.width = this.spriteWidth;
    this.tmpCanvasEl.height = this.spriteHeight;
  },

  createSpriteImages: function() {
    this.spriteImages = [];

    var steps = this._element.width / this.spriteWidth;
    //避免白屏,最终步数减一
    for (var i = 0; i < steps - 1; i++) {
        this.createSpriteImage(i);
    }
  },

  createSpriteImage: function(i) {
    var tmpCtx = this.tmpCanvasEl.getContext('2d');
    tmpCtx.clearRect(0, 0, this.tmpCanvasEl.width, this.tmpCanvasEl.height);
    tmpCtx.drawImage(this._element, -i * this.spriteWidth, 0);

    var dataURL = this.tmpCanvasEl.toDataURL('image/png');
    var tmpImg = fabric.util.createImage();

    tmpImg.src = dataURL;

    this.spriteImages.push(tmpImg);
  },

  _render: function(ctx) {
    ctx.drawImage(
      this.spriteImages[this.spriteIndex],
      -this.width / 2,
      -this.height / 2
    );
  },

  play: function() {
    var _this = this;
    this.animInterval = setInterval(function() {

      _this.onPlay && _this.onPlay();

      _this.spriteIndex++;
      if (_this.spriteIndex === _this.spriteImages.length) {
        _this.spriteIndex = 0;
      }
    }, 100);
  },

  stop: function() {
    clearInterval(this.animInterval);
  }
});

fabric.Sprite.fromURL = function(url, callback, imgOptions) {
  fabric.util.loadImage(url, function(img) {
    callback(new fabric.Sprite(img, imgOptions));
  });
};
fabric.Sprite.fromObject = function (object, callback) {
   
    //fabric.util.loadImage(object.src, function (img, error) {
    //    if (error) {
    //        callback && callback(null, error);
    //        return;
    //    }
    //    fabric.Image.prototype._initFilters.call(object, object.filters, function (filters) {
    //        object.filters = filters || [];
    //        fabric.Image.prototype._initFilters.call(object, [object.resizeFilter], function (resizeFilters) {
    //            object.resizeFilter = resizeFilters[0];
    //            var image = new fabric.Image(img, object);
    //            callback(image);
    //        });
    //    });
    //}, null, object.crossOrigin);

    fabric.Sprite.fromURL(object.src, function (sprite) {
        callback(sprite);
        setTimeout(function () {
            sprite.play();
        }, fabric.util.getRandomInt(1, 10) * 100);
        (function render() {
            canvas.renderAll();
            fabric.util.requestAnimFrame(render);
        })();
    }, { left: object.left, top: object.top, width: object.width, height: object.height });
};
fabric.Sprite.async = true;
