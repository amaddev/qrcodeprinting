codeunit 50110 "QR Code Printing"
{
    procedure ConvertTextToQRCode(
        TextToQRCode: Text;
        Height: Decimal;
        Width: Decimal;
        VAR TempBlob: Record TempBlob TEMPORARY)
    var
        BarcodeWriter: DotNet BarcodeWriter;
        BarCodeFormat: DotNet BarcodeFormat;
        EncodingOption: DotNet EncodingOption;
        BitMatrix: DotNet BitMatrix;
        ImageFormat: DotNet ImageFormat2;
        QrCodeBitmap: DotNet QrCodeBitmap;
        cuFileManagement: Codeunit "File Management";
        TextToQR: Text;
        SaveLocation: Text;
        BmpFormat: Label '.bmp';
    begin
        EncodingOption := EncodingOption.EncodingOptions();
        EncodingOption.Height := Height;
        EncodingOption.Width := Width;

        BarcodeWriter := BarcodeWriter.BarcodeWriter();
        BarcodeWriter.Format := BarCodeFormat.QR_CODE;
        BarcodeWriter.Options := EncodingOption;

        BitMatrix := BarcodeWriter.Encode(TextToQRCode);
        QrCodeBitmap := BarcodeWriter.Write(BitMatrix);
        SaveLocation := TemporaryPath() + TextToQRCode + BmpFormat;
        if not IsServiceTier then
            if Exists(SaveLocation) then
                erase(SaveLocation);

        QrCodeBitmap.Save(SaveLocation, ImageFormat.Bmp);
        cuFileManagement.BLOBImportFromServerFile(TempBlob, SaveLocation);
    end;
}