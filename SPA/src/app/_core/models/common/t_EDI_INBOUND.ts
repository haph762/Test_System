export interface T_EDI_INBOUND {
    factory: string;
    supplier_Code: string;
    invoice: string;
    cMatl_Code: string;
    declare_No: string;
    declare_Type: string;
    declare_Date: string | null;
    unloading_Location: string;
    terms_Of_Trade: string;
    hS_Code: string;
    cMatl_Unit: string;
    supplier_Declare_No: string;
    con_No: string;
    con_Type: string;
    batch_No: string;
    declare_Quantity: number;
    declare_Unit_Price: number;
    amount_USD: number;
    amount_VND: number;
    insur_Fee: number;
    trans_Fee: number;
    invoice_Date: string;
    close_State: string;
    insert_By: string;
    insert_At: string;
    update_By: string;
    update_At: string | null;
}