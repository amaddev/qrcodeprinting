dotnet
{
    assembly("System.Drawing")
    {
        type(System.Drawing.Imaging.ImageFormat; ImageFormat2) { }
        type(System.Drawing.Bitmap; QrCodeBitmap) { }
    }


    assembly("zxing")
    {
        type(ZXing.BarcodeFormat; BarcodeFormat) { }
        type(ZXing.BarcodeWriter; BarcodeWriter) { }
        type(ZXing.Common.EncodingOptions; EncodingOption) { }
        type(ZXing.Common.BitMatrix; BitMatrix) { }
    }
}

