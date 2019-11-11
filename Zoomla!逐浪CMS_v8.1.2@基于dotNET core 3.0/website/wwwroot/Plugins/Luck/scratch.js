function ScratchMod(pars) {
    if (typeof pars !== "object") { return null; }
    var supportCanvas, init, canvas, container = $(pars.container); try { document.createElement("canvas").getContext("2d"); container.html("<canvas style='width: " + pars.width + "px;height:" + pars.height + "px'></canvas>"); canvas = container.find("canvas").get(0); supportCanvas = true; init = initHtml5; } catch (e) { container.html("<div style='width: " + pars.width + "px;height:" + pars.height + "px'></div>"); canvas = container.find("div").get(0); supportCanvas = false; init = initAntique; }
    function initHtml5() {
        if (typeof pars.eraseRadius === "undefined") { pars.eraseRadius = 15; }
        var ctx, w = pars.width, h = pars.height, offsetX = $(canvas).offset()["left"], offsetY = $(canvas).offset()["top"], mousedown = false, start = false, end = false, interval, sampleCD = pars.sampleCD, existPen = typeof pars.penImgSrc !== "undefined", penPath = []; if (typeof sampleCD === "undefined") { sampleCD = 500; }
        function callback() {
            if (end || typeof pars.sampleCallback !== "function") { return; }
            var result = pars.sampleCallback(eraseRate()); if (!result) { clearInterval(interval); interval = setTimeout(callback, sampleCD); } else { end = true; eraseAll(); }
        }
        function eraseAll() { ctx.fillRect(0, 0, w, h); }
        function eraseRate() {
            var step = 1; if (typeof pars.sampleStep !== "undefined") { step = pars.sampleStep; if (step < 1) { step = 1; } }
            var add = step * 4; var imageData = ctx.getImageData(0, 0, w, h).data; var eraseTotal = 0; for (var i = 3, len = imageData.length; i < len; i += add) { if (imageData[i] === 0) { eraseTotal++; } }
            return eraseTotal / ((w * h) / step);
        }
        function eventDown(e) { e.preventDefault(); mousedown = true; if (!start && typeof pars.startCallback === "function") { start = true; pars.startCallback("canvas"); } }
        function eventUp(e) { e.preventDefault(); mousedown = false; callback(); penPath = []; }
        function eventMove(e) {
            e.preventDefault(); if (mousedown) {
                if (e.changedTouches) { e = e.changedTouches[e.changedTouches.length - 1]; }
                var x = (e.clientX + document.body.scrollLeft || e.pageX) - offsetX || 0, y = (e.clientY + document.body.scrollTop || e.pageY) - offsetY || 0; penPath.push({ 'x': x, 'y': y }); penPathTask();
            }
        }
        function penPathTask() { var len = penPath.length; if (len > 1) { var xy1 = penPath[0], xy2 = penPath[1], x1 = xy1.x, y1 = xy1.y, x2 = xy2.x, y2 = xy2.y, vectorX = x2 - x1, vectorY = y2 - y1, accuracy = 1, currentPercent; penPath.splice(0, 1); for (var i = 1; i <= 100; i += accuracy) { currentPercent = i / 100; erase(x1 + vectorX * currentPercent, y1 + vectorY * currentPercent); } } }
        function erase(x, y) { if (existPen) { ctx.drawImage(penImg, x - penImg.width / 2, y - penImg.height / 2); } else { ctx.beginPath(); ctx.arc(x, y, pars.eraseRadius, 0, Math.PI * 2); ctx.fill(); } }
        canvas.width = w; canvas.height = h; if (typeof pars.bgImgSrc !== "undefined") { canvas.style.backgroundImage = 'url(' + bgImg.src + ')'; }
        ctx = canvas.getContext('2d'); if (typeof pars.imgSrc !== "undefined") { ctx.drawImage(img, 0, 0, w, h); } else {
            if (typeof pars.color === "undefined" || pars.color === null) { ctx.fillStyle = 'gray'; } else { ctx.fillStyle = pars.color; }
            ctx.fillRect(0, 0, w, h);
        }
        ctx.globalCompositeOperation = 'destination-out'; canvas.addEventListener('touchstart', eventDown); canvas.addEventListener('touchend', eventUp); canvas.addEventListener('touchmove', eventMove); canvas.addEventListener('mousedown', eventDown); canvas.addEventListener('mouseup', eventUp); document.addEventListener('mouseup', eventUp); canvas.addEventListener('mousemove', eventMove); callback();
    }
    function initAntique() {
        var $canvas = $(canvas), start = false; $canvas.css('backgroundImage', 'url(' + img.src + ')'); $canvas.on('mousedown touchstart', eventDown); function eventDown(e) {
            e.preventDefault(); if (!start) {
                start = true; if (typeof pars.bgImgSrc !== "undefined") { $canvas.css('backgroundImage', 'url(' + bgImg.src + ')'); }
                if (typeof pars.startCallback === "function") { pars.startCallback("div"); }
            }
        }
    }
    var img = new Image(), bgImg = new Image(), penImg = new Image(); bgImg.onload = function () { bgImgLoading = false; if (!bgImgLoading && !imgLoading && !penImgLoading) { init(); } }; img.onload = function () { imgLoading = false; if (!bgImgLoading && !imgLoading && !penImgLoading) { init(); } }; penImg.onload = function () { penImgLoading = false; if (!bgImgLoading && !imgLoading && !penImgLoading) { init(); } }; var bgImgLoading, imgLoading, penImgLoading; if (typeof pars.imgSrc !== "undefined") { imgLoading = true; img.src = pars.imgSrc; } else { imgLoading = false; }
    if (typeof pars.bgImgSrc !== "undefined") { bgImgLoading = true; bgImg.src = pars.bgImgSrc; } else { bgImgLoading = false; }
    if (supportCanvas && typeof pars.penImgSrc !== "undefined") { penImgLoading = true; penImg.src = pars.penImgSrc; } else { penImgLoading = false; }
    return canvas;
}