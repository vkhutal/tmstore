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

public class productLineItem implements KvmSerializable {

    public String amount;
    public String costAmount;
    public String description;
    public String giftMessage;
    public String productCode;
    public String quantity;
    public String recipientAddress1;
    public String recipientAddress2;
    public String recipientCity;
    public String recipientCountryCode;
    public String recipientEmail;
    public String recipientFirstName;
    public String recipientLastName;
    public String recipientPhone;
    public String recipientPostalCode;
    public String recipientStateCode;
    public String shippingNumber;
    public String sku;

    public productLineItem() {
    }

    public productLineItem(SoapObject soapObject) {
        if (soapObject == null)
            return;
        if (soapObject.hasProperty("amount")) {
            Object obj = soapObject.getProperty("amount");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                amount = j.toString();
            } else if (obj != null && obj instanceof String) {
                amount = (String) obj;
            }
        }
        if (soapObject.hasProperty("costAmount")) {
            Object obj = soapObject.getProperty("costAmount");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                costAmount = j.toString();
            } else if (obj != null && obj instanceof String) {
                costAmount = (String) obj;
            }
        }
        if (soapObject.hasProperty("description")) {
            Object obj = soapObject.getProperty("description");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                description = j.toString();
            } else if (obj != null && obj instanceof String) {
                description = (String) obj;
            }
        }
        if (soapObject.hasProperty("giftMessage")) {
            Object obj = soapObject.getProperty("giftMessage");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                giftMessage = j.toString();
            } else if (obj != null && obj instanceof String) {
                giftMessage = (String) obj;
            }
        }
        if (soapObject.hasProperty("productCode")) {
            Object obj = soapObject.getProperty("productCode");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                productCode = j.toString();
            } else if (obj != null && obj instanceof String) {
                productCode = (String) obj;
            }
        }
        if (soapObject.hasProperty("quantity")) {
            Object obj = soapObject.getProperty("quantity");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                quantity = j.toString();
            } else if (obj != null && obj instanceof String) {
                quantity = (String) obj;
            }
        }
        if (soapObject.hasProperty("recipientAddress1")) {
            Object obj = soapObject.getProperty("recipientAddress1");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                recipientAddress1 = j.toString();
            } else if (obj != null && obj instanceof String) {
                recipientAddress1 = (String) obj;
            }
        }
        if (soapObject.hasProperty("recipientAddress2")) {
            Object obj = soapObject.getProperty("recipientAddress2");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                recipientAddress2 = j.toString();
            } else if (obj != null && obj instanceof String) {
                recipientAddress2 = (String) obj;
            }
        }
        if (soapObject.hasProperty("recipientCity")) {
            Object obj = soapObject.getProperty("recipientCity");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                recipientCity = j.toString();
            } else if (obj != null && obj instanceof String) {
                recipientCity = (String) obj;
            }
        }
        if (soapObject.hasProperty("recipientCountryCode")) {
            Object obj = soapObject.getProperty("recipientCountryCode");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                recipientCountryCode = j.toString();
            } else if (obj != null && obj instanceof String) {
                recipientCountryCode = (String) obj;
            }
        }
        if (soapObject.hasProperty("recipientEmail")) {
            Object obj = soapObject.getProperty("recipientEmail");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                recipientEmail = j.toString();
            } else if (obj != null && obj instanceof String) {
                recipientEmail = (String) obj;
            }
        }
        if (soapObject.hasProperty("recipientFirstName")) {
            Object obj = soapObject.getProperty("recipientFirstName");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                recipientFirstName = j.toString();
            } else if (obj != null && obj instanceof String) {
                recipientFirstName = (String) obj;
            }
        }
        if (soapObject.hasProperty("recipientLastName")) {
            Object obj = soapObject.getProperty("recipientLastName");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                recipientLastName = j.toString();
            } else if (obj != null && obj instanceof String) {
                recipientLastName = (String) obj;
            }
        }
        if (soapObject.hasProperty("recipientPhone")) {
            Object obj = soapObject.getProperty("recipientPhone");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                recipientPhone = j.toString();
            } else if (obj != null && obj instanceof String) {
                recipientPhone = (String) obj;
            }
        }
        if (soapObject.hasProperty("recipientPostalCode")) {
            Object obj = soapObject.getProperty("recipientPostalCode");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                recipientPostalCode = j.toString();
            } else if (obj != null && obj instanceof String) {
                recipientPostalCode = (String) obj;
            }
        }
        if (soapObject.hasProperty("recipientStateCode")) {
            Object obj = soapObject.getProperty("recipientStateCode");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                recipientStateCode = j.toString();
            } else if (obj != null && obj instanceof String) {
                recipientStateCode = (String) obj;
            }
        }
        if (soapObject.hasProperty("shippingNumber")) {
            Object obj = soapObject.getProperty("shippingNumber");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                shippingNumber = j.toString();
            } else if (obj != null && obj instanceof String) {
                shippingNumber = (String) obj;
            }
        }
        if (soapObject.hasProperty("sku")) {
            Object obj = soapObject.getProperty("sku");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                sku = j.toString();
            } else if (obj != null && obj instanceof String) {
                sku = (String) obj;
            }
        }
    }

    @Override
    public Object getProperty(int arg0) {
        switch (arg0) {
            case 0:
                return amount;
            case 1:
                return costAmount;
            case 2:
                return description;
            case 3:
                return giftMessage;
            case 4:
                return productCode;
            case 5:
                return quantity;
            case 6:
                return recipientAddress1;
            case 7:
                return recipientAddress2;
            case 8:
                return recipientCity;
            case 9:
                return recipientCountryCode;
            case 10:
                return recipientEmail;
            case 11:
                return recipientFirstName;
            case 12:
                return recipientLastName;
            case 13:
                return recipientPhone;
            case 14:
                return recipientPostalCode;
            case 15:
                return recipientStateCode;
            case 16:
                return shippingNumber;
            case 17:
                return sku;
        }
        return null;
    }

    @Override
    public int getPropertyCount() {
        return 18;
    }

    @Override
    public void getPropertyInfo(int index, @SuppressWarnings("rawtypes") Hashtable arg1, PropertyInfo info) {
        switch (index) {
            case 0:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "amount";
                break;
            case 1:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "costAmount";
                break;
            case 2:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "description";
                break;
            case 3:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "giftMessage";
                break;
            case 4:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "productCode";
                break;
            case 5:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "quantity";
                break;
            case 6:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "recipientAddress1";
                break;
            case 7:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "recipientAddress2";
                break;
            case 8:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "recipientCity";
                break;
            case 9:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "recipientCountryCode";
                break;
            case 10:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "recipientEmail";
                break;
            case 11:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "recipientFirstName";
                break;
            case 12:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "recipientLastName";
                break;
            case 13:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "recipientPhone";
                break;
            case 14:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "recipientPostalCode";
                break;
            case 15:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "recipientStateCode";
                break;
            case 16:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "shippingNumber";
                break;
            case 17:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "sku";
                break;
        }
    }

    @Override
    public void setProperty(int arg0, Object arg1) {
    }

}
