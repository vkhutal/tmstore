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
import org.ksoap2.serialization.SoapPrimitive;

import java.util.Hashtable;

public class eft implements KvmSerializable {

    public String accountNumber;
    public String accountType;
    public String amountInCents;
    public String bankName;
    public String branchNumber;
    public String currency;
    public String eventType;
    public String reference;
    public String settlementDate;
    public String timeLimit;
    public String defaultPM;
    public String pmId;

    public eft() {
    }

    public eft(SoapObject soapObject) {
        if (soapObject == null)
            return;
        if (soapObject.hasProperty("accountNumber")) {
            Object obj = soapObject.getProperty("accountNumber");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                accountNumber = j.toString();
            } else if (obj != null && obj instanceof String) {
                accountNumber = (String) obj;
            }
        }
        if (soapObject.hasProperty("accountType")) {
            Object obj = soapObject.getProperty("accountType");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                accountType = j.toString();
            } else if (obj != null && obj instanceof String) {
                accountType = (String) obj;
            }
        }
        if (soapObject.hasProperty("amountInCents")) {
            Object obj = soapObject.getProperty("amountInCents");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                amountInCents = j.toString();
            } else if (obj != null && obj instanceof String) {
                amountInCents = (String) obj;
            }
        }
        if (soapObject.hasProperty("bankName")) {
            Object obj = soapObject.getProperty("bankName");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                bankName = j.toString();
            } else if (obj != null && obj instanceof String) {
                bankName = (String) obj;
            }
        }
        if (soapObject.hasProperty("branchNumber")) {
            Object obj = soapObject.getProperty("branchNumber");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                branchNumber = j.toString();
            } else if (obj != null && obj instanceof String) {
                branchNumber = (String) obj;
            }
        }
        if (soapObject.hasProperty("currency")) {
            Object obj = soapObject.getProperty("currency");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                currency = j.toString();
            } else if (obj != null && obj instanceof String) {
                currency = (String) obj;
            }
        }
        if (soapObject.hasProperty("eventType")) {
            Object obj = soapObject.getProperty("eventType");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                eventType = j.toString();
            } else if (obj != null && obj instanceof String) {
                eventType = (String) obj;
            }
        }
        if (soapObject.hasProperty("reference")) {
            Object obj = soapObject.getProperty("reference");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                reference = j.toString();
            } else if (obj != null && obj instanceof String) {
                reference = (String) obj;
            }
        }
        if (soapObject.hasProperty("settlementDate")) {
            Object obj = soapObject.getProperty("settlementDate");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                settlementDate = j.toString();
            } else if (obj != null && obj instanceof String) {
                settlementDate = (String) obj;
            }
        }
        if (soapObject.hasProperty("timeLimit")) {
            Object obj = soapObject.getProperty("timeLimit");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                timeLimit = j.toString();
            } else if (obj != null && obj instanceof String) {
                timeLimit = (String) obj;
            }
        }
        if (soapObject.hasProperty("defaultPM")) {
            Object obj = soapObject.getProperty("defaultPM");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                defaultPM = j.toString();
            } else if (obj != null && obj instanceof String) {
                defaultPM = (String) obj;
            }
        }
        if (soapObject.hasProperty("pmId")) {
            Object obj = soapObject.getProperty("pmId");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                pmId = j.toString();
            } else if (obj != null && obj instanceof String) {
                pmId = (String) obj;
            }
        }
    }

    @Override
    public Object getProperty(int arg0) {
        switch (arg0) {
            case 0:
                return accountNumber;
            case 1:
                return accountType;
            case 2:
                return amountInCents;
            case 3:
                return bankName;
            case 4:
                return branchNumber;
            case 5:
                return currency;
            case 6:
                return eventType;
            case 7:
                return reference;
            case 8:
                return settlementDate;
            case 9:
                return timeLimit;
            case 10:
                return defaultPM;
            case 11:
                return pmId;
        }
        return null;
    }

    @Override
    public int getPropertyCount() {
        return 12;
    }

    @Override
    public void getPropertyInfo(int index, @SuppressWarnings("rawtypes") Hashtable arg1, PropertyInfo info) {
        switch (index) {
            case 0:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "accountNumber";
                break;
            case 1:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "accountType";
                break;
            case 2:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "amountInCents";
                break;
            case 3:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "bankName";
                break;
            case 4:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "branchNumber";
                break;
            case 5:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "currency";
                break;
            case 6:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "eventType";
                break;
            case 7:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "reference";
                break;
            case 8:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "settlementDate";
                break;
            case 9:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "timeLimit";
                break;
            case 10:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "defaultPM";
                break;
            case 11:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "pmId";
                break;
        }
    }

    @Override
    public void setProperty(int arg0, Object arg1) {
    }

}
