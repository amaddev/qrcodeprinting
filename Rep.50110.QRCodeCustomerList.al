report 50110 "QR Code - Customer List"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = 'QRCodeCustomerList.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }
            column(QR_Code; TempBlob.Blob)
            {

            }

            trigger OnAfterGetRecord()
            begin
                Clear(TempBlob);
                QRCodePrinting.ConvertTextToQRCode("No.", 200, 200, TempBlob);
            end;
        }
    }
    var
        TempBlob: Record TempBlob;
        QRCodePrinting: Codeunit "QR Code Printing";
}