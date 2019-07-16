pageextension 50110 "Customer List Extension" extends "Customer List"
{
    actions
    {
        addafter("Customer - Top 10 List")
        {
            action("QR Code - Customer List")
            {
                RunObject = report "QR Code - Customer List";
                Image = Report;
                ApplicationArea = All;
            }
        }
    }
}