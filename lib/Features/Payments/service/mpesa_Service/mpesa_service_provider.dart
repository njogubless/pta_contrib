// lib/shared/services/mpesa_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class MpesaService {
  static const String _baseUrl = 'https://sandbox.safaricom.co.ke'; // Change to production URL for live
  static const String _consumerKey = 'YOUR_CONSUMER_KEY';
  static const String _consumerSecret = 'YOUR_CONSUMER_SECRET';
  static const String _businessShortCode = 'YOUR_BUSINESS_SHORTCODE';
  static const String _passkey = 'YOUR_PASSKEY';
  static const String _callbackUrl = 'YOUR_CALLBACK_URL';

  Future<MpesaResult> initiateSTKPush({
    required String phoneNumber,
    required double amount,
    required String accountReference,
    required String transactionDesc,
  }) async {
    try {
      // Get access token
      final accessToken = await _getAccessToken();
      if (accessToken == null) {
        return MpesaResult(
          success: false,
          errorMessage: 'Failed to get access token',
        );
      }

      // Generate timestamp and password
      final timestamp = _generateTimestamp();
      final password = _generatePassword(timestamp);

      // Format phone number (remove leading + and add 254 if not present)
      String formattedPhone = phoneNumber.replaceAll('+', '');
      if (formattedPhone.startsWith('0')) {
        formattedPhone = '254${formattedPhone.substring(1)}';
      }
      if (!formattedPhone.startsWith('254')) {
        formattedPhone = '254$formattedPhone';
      }

      // Prepare request body
      final requestBody = {
        'BusinessShortCode': _businessShortCode,
        'Password': password,
        'Timestamp': timestamp,
        'TransactionType': 'CustomerPayBillOnline',
        'Amount': amount.toInt(),
        'PartyA': formattedPhone,
        'PartyB': _businessShortCode,
        'PhoneNumber': formattedPhone,
        'CallBackURL': _callbackUrl,
        'AccountReference': accountReference,
        'TransactionDesc': transactionDesc,
      };

      // Make STK push request
      final response = await http.post(
        Uri.parse('$_baseUrl/mpesa/stkpush/v1/processrequest'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['ResponseCode'] == '0') {
        return MpesaResult(
          success: true,
          checkoutRequestId: responseData['CheckoutRequestID'],
          merchantRequestId: responseData['MerchantRequestID'],
          responseCode: responseData['ResponseCode'],
          responseDescription: responseData['ResponseDescription'],
        );
      } else {
        return MpesaResult(
          success: false,
          errorMessage: responseData['errorMessage'] ?? 
                       responseData['ResponseDescription'] ?? 
                       'STK push failed',
          responseCode: responseData['ResponseCode'],
        );
      }
    } catch (e) {
      return MpesaResult(
        success: false,
        errorMessage: 'Network error: $e',
      );
    }
  }

  Future<TransactionStatus> queryTransactionStatus(String checkoutRequestId) async {
    try {
      final accessToken = await _getAccessToken();
      if (accessToken == null) {
        return TransactionStatus(
          isFailed: true,
          errorMessage: 'Failed to get access token',
        );
      }

      final timestamp = _generateTimestamp();
      final password = _generatePassword(timestamp);

      final requestBody = {
        'BusinessShortCode': _businessShortCode,
        'Password': password,
        'Timestamp': timestamp,
        'CheckoutRequestID': checkoutRequestId,
      };

      final response = await http.post(
        Uri.parse('$_baseUrl/mpesa/stkpushquery/v1/query'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final resultCode = responseData['ResultCode'];
        
        if (resultCode == '0') {
          return TransactionStatus(
            isCompleted: true,
            mpesaReceiptNumber: responseData['MpesaReceiptNumber'],
          );
        } else if (resultCode == '1032') {
          // Transaction cancelled by user
          return TransactionStatus(
            isFailed: true,
            errorMessage: 'Transaction was cancelled',
          );
        } else if (resultCode == '1037') {
          // Timeout
          return TransactionStatus(
            isFailed: true,
            errorMessage: 'Transaction timed out',
          );
        } else if (resultCode == '1001') {
          // Insufficient funds
          return TransactionStatus(
            isFailed: true,
            errorMessage: 'Insufficient funds',
          );
        } else if (resultCode == '1025') {
          // Invalid phone number
          return TransactionStatus(
            isFailed: true,
            errorMessage: 'Invalid phone number',
          );
        } else if (resultCode != null) {
          return TransactionStatus(
            isFailed: true,
            errorMessage: responseData['ResultDesc'] ?? 'Transaction failed',
          );
        }
        
        // Transaction is still pending
        return TransactionStatus(isPending: true);
      } else {
        return TransactionStatus(
          isFailed: true,
          errorMessage: 'Failed to query transaction status',
        );
      }
    } catch (e) {
      return TransactionStatus(
        isFailed: true,
        errorMessage: 'Network error: $e',
      );
    }
  }

  Future<String?> _getAccessToken() async {
    try {
      final credentials = '$_consumerKey:$_consumerSecret';
      final encodedCredentials = base64Encode(utf8.encode(credentials));

      final response = await http.get(
        Uri.parse('$_baseUrl/oauth/v1/generate?grant_type=client_credentials'),
        headers: {
          'Authorization': 'Basic $encodedCredentials',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['access_token'];
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  String _generateTimestamp() {
    final now = DateTime.now();
    return '${now.year}'
        '${now.month.toString().padLeft(2, '0')}'
        '${now.day.toString().padLeft(2, '0')}'
        '${now.hour.toString().padLeft(2, '0')}'
        '${now.minute.toString().padLeft(2, '0')}'
        '${now.second.toString().padLeft(2, '0')}';
  }

  String _generatePassword(String timestamp) {
    final data = '$_businessShortCode$_passkey$timestamp';
    return base64Encode(utf8.encode(data));
  }
}

class MpesaResult {
  final bool success;
  final String? checkoutRequestId;
  final String? merchantRequestId;
  final String? responseCode;
  final String? responseDescription;
  final String? errorMessage;

  MpesaResult({
    required this.success,
    this.checkoutRequestId,
    this.merchantRequestId,
    this.responseCode,
    this.responseDescription,
    this.errorMessage,
  });
}

class TransactionStatus {
  final bool isCompleted;
  final bool isPending;
  final bool isFailed;
  final String? mpesaReceiptNumber;
  final String? errorMessage;

  TransactionStatus({
    this.isCompleted = false,
    this.isPending = false,
    this.isFailed = false,
    this.mpesaReceiptNumber,
    this.errorMessage,
  });
}