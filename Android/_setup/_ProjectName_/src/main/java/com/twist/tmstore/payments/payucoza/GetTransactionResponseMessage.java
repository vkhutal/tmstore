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

public class GetTransactionResponseMessage implements KvmSerializable {

    public VectorbankDepositDetails bankDepositDetails;
    public basket basket;
    public VectorcustomField customFields;
    public String displayMessage;
    public fraud fraud;
    public String merchantReference;
    public String payUReference;
    public VectoriPaymentMethod paymentMethodsUsed;
    public String pointOfFailure;
    public recurringDetails recurringDetails;
    public String requestTrace;
    public String resultCode;
    public String resultMessage;
    public String stage;
    public boolean successful;
    public WS_Enums.payloadStatusEnum transactionState;
    public boolean transactionStateSpecified;
    public WS_Enums.transactionType transactionType;
    public boolean transactionTypeSpecified;

    public GetTransactionResponseMessage() {
    }

    public GetTransactionResponseMessage(SoapObject soapObject) {
        if (soapObject == null)
            return;
        if (soapObject.hasProperty("bankDepositDetails")) {
            SoapObject j = (SoapObject) soapObject.getProperty("bankDepositDetails");
            bankDepositDetails = new VectorbankDepositDetails(j);
        }
        if (soapObject.hasProperty("basket")) {
            SoapObject j = (SoapObject) soapObject.getProperty("basket");
            basket = new basket(j);

        }
        if (soapObject.hasProperty("customFields")) {
            SoapObject j = (SoapObject) soapObject.getProperty("customFields");
            customFields = new VectorcustomField(j);
        }
        if (soapObject.hasProperty("displayMessage")) {
            Object obj = soapObject.getProperty("displayMessage");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                displayMessage = j.toString();
            } else if (obj != null && obj instanceof String) {
                displayMessage = (String) obj;
            }
        }
        if (soapObject.hasProperty("fraud")) {
            SoapObject j = (SoapObject) soapObject.getProperty("fraud");
            fraud = new fraud(j);

        }
        if (soapObject.hasProperty("merchantReference")) {
            Object obj = soapObject.getProperty("merchantReference");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                merchantReference = j.toString();
            } else if (obj != null && obj instanceof String) {
                merchantReference = (String) obj;
            }
        }
        if (soapObject.hasProperty("payUReference")) {
            Object obj = soapObject.getProperty("payUReference");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                payUReference = j.toString();
            } else if (obj != null && obj instanceof String) {
                payUReference = (String) obj;
            }
        }
        if (soapObject.hasProperty("paymentMethodsUsed")) {
            SoapObject j = (SoapObject) soapObject.getProperty("paymentMethodsUsed");
            paymentMethodsUsed = new VectoriPaymentMethod(j);
        }
        if (soapObject.hasProperty("pointOfFailure")) {
            Object obj = soapObject.getProperty("pointOfFailure");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                pointOfFailure = j.toString();
            } else if (obj != null && obj instanceof String) {
                pointOfFailure = (String) obj;
            }
        }
        if (soapObject.hasProperty("recurringDetails")) {
            SoapObject j = (SoapObject) soapObject.getProperty("recurringDetails");
            recurringDetails = new recurringDetails(j);

        }
        if (soapObject.hasProperty("requestTrace")) {
            Object obj = soapObject.getProperty("requestTrace");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                requestTrace = j.toString();
            } else if (obj != null && obj instanceof String) {
                requestTrace = (String) obj;
            }
        }
        if (soapObject.hasProperty("resultCode")) {
            Object obj = soapObject.getProperty("resultCode");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                resultCode = j.toString();
            } else if (obj != null && obj instanceof String) {
                resultCode = (String) obj;
            }
        }
        if (soapObject.hasProperty("resultMessage")) {
            Object obj = soapObject.getProperty("resultMessage");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                resultMessage = j.toString();
            } else if (obj != null && obj instanceof String) {
                resultMessage = (String) obj;
            }
        }
        if (soapObject.hasProperty("stage")) {
            Object obj = soapObject.getProperty("stage");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                stage = j.toString();
            } else if (obj != null && obj instanceof String) {
                stage = (String) obj;
            }
        }
        if (soapObject.hasProperty("successful")) {
            Object obj = soapObject.getProperty("successful");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                successful = Boolean.parseBoolean(j.toString());
            } else if (obj != null && obj instanceof Boolean) {
                successful = (Boolean) obj;
            }
        }
        if (soapObject.hasProperty("transactionState")) {
            Object obj = soapObject.getProperty("transactionState");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                transactionState = WS_Enums.payloadStatusEnum.fromString(j.toString());
            }
        }
        if (soapObject.hasProperty("transactionStateSpecified")) {
            Object obj = soapObject.getProperty("transactionStateSpecified");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                transactionStateSpecified = Boolean.parseBoolean(j.toString());
            } else if (obj != null && obj instanceof Boolean) {
                transactionStateSpecified = (Boolean) obj;
            }
        }
        if (soapObject.hasProperty("transactionType")) {
            Object obj = soapObject.getProperty("transactionType");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                transactionType = WS_Enums.transactionType.fromString(j.toString());
            }
        }
        if (soapObject.hasProperty("transactionTypeSpecified")) {
            Object obj = soapObject.getProperty("transactionTypeSpecified");
            if (obj != null && obj.getClass().equals(SoapPrimitive.class)) {
                SoapPrimitive j = (SoapPrimitive) obj;
                transactionTypeSpecified = Boolean.parseBoolean(j.toString());
            } else if (obj != null && obj instanceof Boolean) {
                transactionTypeSpecified = (Boolean) obj;
            }
        }
    }

    @Override
    public Object getProperty(int arg0) {
        switch (arg0) {
            case 0:
                return bankDepositDetails;
            case 1:
                return basket;
            case 2:
                return customFields;
            case 3:
                return displayMessage;
            case 4:
                return fraud;
            case 5:
                return merchantReference;
            case 6:
                return payUReference;
            case 7:
                return paymentMethodsUsed;
            case 8:
                return pointOfFailure;
            case 9:
                return recurringDetails;
            case 10:
                return requestTrace;
            case 11:
                return resultCode;
            case 12:
                return resultMessage;
            case 13:
                return stage;
            case 14:
                return successful;
            case 15:
                return transactionState.toString();
            case 16:
                return transactionStateSpecified;
            case 17:
                return transactionType.toString();
            case 18:
                return transactionTypeSpecified;
        }
        return null;
    }

    @Override
    public int getPropertyCount() {
        return 19;
    }

    @Override
    public void getPropertyInfo(int index, @SuppressWarnings("rawtypes") Hashtable arg1, PropertyInfo info) {
        switch (index) {
            case 0:
                info.type = PropertyInfo.VECTOR_CLASS;
                info.name = "bankDepositDetails";
                break;
            case 1:
                info.type = basket.class;
                info.name = "basket";
                break;
            case 2:
                info.type = PropertyInfo.VECTOR_CLASS;
                info.name = "customFields";
                break;
            case 3:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "displayMessage";
                break;
            case 4:
                info.type = fraud.class;
                info.name = "fraud";
                break;
            case 5:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "merchantReference";
                break;
            case 6:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "payUReference";
                break;
            case 7:
                info.type = PropertyInfo.VECTOR_CLASS;
                info.name = "paymentMethodsUsed";
                break;
            case 8:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "pointOfFailure";
                break;
            case 9:
                info.type = recurringDetails.class;
                info.name = "recurringDetails";
                break;
            case 10:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "requestTrace";
                break;
            case 11:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "resultCode";
                break;
            case 12:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "resultMessage";
                break;
            case 13:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "stage";
                break;
            case 14:
                info.type = PropertyInfo.BOOLEAN_CLASS;
                info.name = "successful";
                break;
            case 15:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "transactionState";
                break;
            case 16:
                info.type = PropertyInfo.BOOLEAN_CLASS;
                info.name = "transactionStateSpecified";
                break;
            case 17:
                info.type = PropertyInfo.STRING_CLASS;
                info.name = "transactionType";
                break;
            case 18:
                info.type = PropertyInfo.BOOLEAN_CLASS;
                info.name = "transactionTypeSpecified";
                break;
        }
    }

    @Override
    public void setProperty(int arg0, Object arg1) {
    }

}
