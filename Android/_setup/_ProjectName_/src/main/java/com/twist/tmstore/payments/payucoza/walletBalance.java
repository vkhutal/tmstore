package com.twist.tmstore.payments.payucoza;

//------------------------------------------------------------------------------
// <wsdl2code-generated>
//    This code was generated by http://www.wsdl2code.com version  2.5
//
// Date Of Creation: 7/4/2014 4:34:19 PM
//    Please dont change this code, regeneration will override your changes
//</wsdl2code-generated>
//
//------------------------------------------------------------------------------
//
//This source code was auto-generated by Wsdl2Code  Version
//

import org.ksoap2.serialization.KvmSerializable;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;

import java.util.Hashtable;

public class walletBalance implements KvmSerializable {

    public Vectorbalance balance;

    public walletBalance() {
    }

    public walletBalance(SoapObject soapObject) {
        if (soapObject == null)
            return;
        if (soapObject.hasProperty("Balance")) {
            SoapObject j = (SoapObject) soapObject.getProperty("Balance");
            balance = new Vectorbalance(j);
        }
    }

    @Override
    public Object getProperty(int arg0) {
        switch (arg0) {
            case 0:
                return balance;
        }
        return null;
    }

    @Override
    public int getPropertyCount() {
        return 1;
    }

    @Override
    public void getPropertyInfo(int index, @SuppressWarnings("rawtypes") Hashtable arg1, PropertyInfo info) {
        switch (index) {
            case 0:
                info.type = PropertyInfo.VECTOR_CLASS;
                info.name = "Balance";
                break;
        }
    }

    @Override
    public void setProperty(int arg0, Object arg1) {
    }

}
