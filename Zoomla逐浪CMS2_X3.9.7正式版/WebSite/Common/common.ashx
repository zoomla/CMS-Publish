<%@ WebHandler Language="C#" Class="common" %>

using System;
using System.Web;
using System.IO;
using ThoughtWorks.QRCode.Codec;
using System.Drawing;
using System.Drawing.Imaging;
using ZoomLa.BLL.Helper.Addon;
using ZoomLa.Common;

public class common :IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string data = DataConverter.CStr(context.Request["url"]);
        string img = DataConverter.CStr(context.Request["img"]);
        if (string.IsNullOrEmpty(data)) { return; }
        System.Drawing.Image image = null;
        if (string.IsNullOrEmpty(img))
        {
            QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
            qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE;
            qrCodeEncoder.QRCodeScale = 4;//大小
            qrCodeEncoder.QRCodeVersion = 0;//版本
            qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.L;//纠错级别
            image = qrCodeEncoder.Encode(data, System.Text.Encoding.UTF8);
        }
        else
        {
            img = function.VToP(img);
            image = QRCodeHelper.CreateQRCodeWithLogo(data, img);
        }
        MemoryStream stream = new MemoryStream();
        image.Save(stream, ImageFormat.Jpeg);
        HttpContext.Current.Response.ClearContent();
        HttpContext.Current.Response.ContentType = "image/Gif";
        HttpContext.Current.Response.BinaryWrite(stream.ToArray());
    }
    public bool IsReusable { get { return false; } }
}