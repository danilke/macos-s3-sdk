//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSSNSResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSSNSResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSNSResources

+ (instancetype)sharedInstance {
    static AWSSNSResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSNSResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"uid\":\"sns-2010-03-31\",\
    \"apiVersion\":\"2010-03-31\",\
    \"endpointPrefix\":\"sns\",\
    \"protocol\":\"query\",\
    \"serviceAbbreviation\":\"Amazon SNS\",\
    \"serviceFullName\":\"Amazon Simple Notification Service\",\
    \"signatureVersion\":\"v4\",\
    \"xmlNamespace\":\"http://sns.amazonaws.com/doc/2010-03-31/\"\
  },\
  \"operations\":{\
    \"AddPermission\":{\
      \"name\":\"AddPermission\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddPermissionInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Adds a statement to a topic's access control policy, granting access for the specified AWS accounts to the specified actions.</p>\"\
    },\
    \"CheckIfPhoneNumberIsOptedOut\":{\
      \"name\":\"CheckIfPhoneNumberIsOptedOut\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CheckIfPhoneNumberIsOptedOutInput\"},\
      \"output\":{\
        \"shape\":\"CheckIfPhoneNumberIsOptedOutResponse\",\
        \"resultWrapper\":\"CheckIfPhoneNumberIsOptedOutResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ThrottledException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidParameterException\"}\
      ],\
      \"documentation\":\"<p>Accepts a phone number and indicates whether the phone holder has opted out of receiving SMS messages from your account. You cannot send SMS messages to a number that is opted out.</p> <p>To resume sending messages, you can opt in the number by using the <code>OptInPhoneNumber</code> action.</p>\"\
    },\
    \"ConfirmSubscription\":{\
      \"name\":\"ConfirmSubscription\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ConfirmSubscriptionInput\"},\
      \"output\":{\
        \"shape\":\"ConfirmSubscriptionResponse\",\
        \"resultWrapper\":\"ConfirmSubscriptionResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"SubscriptionLimitExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Verifies an endpoint owner's intent to receive messages by validating the token sent to the endpoint by an earlier <code>Subscribe</code> action. If the token is valid, the action creates a new subscription and returns its Amazon Resource Name (ARN). This call requires an AWS signature only when the <code>AuthenticateOnUnsubscribe</code> flag is set to \\\"true\\\".</p>\"\
    },\
    \"CreatePlatformApplication\":{\
      \"name\":\"CreatePlatformApplication\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreatePlatformApplicationInput\"},\
      \"output\":{\
        \"shape\":\"CreatePlatformApplicationResponse\",\
        \"resultWrapper\":\"CreatePlatformApplicationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates a platform application object for one of the supported push notification services, such as APNS and GCM, to which devices and mobile apps may register. You must specify PlatformPrincipal and PlatformCredential attributes when using the <code>CreatePlatformApplication</code> action. The PlatformPrincipal is received from the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is \\\"SSL certificate\\\". For GCM, PlatformPrincipal is not applicable. For ADM, PlatformPrincipal is \\\"client id\\\". The PlatformCredential is also received from the notification service. For WNS, PlatformPrincipal is \\\"Package Security Identifier\\\". For MPNS, PlatformPrincipal is \\\"TLS certificate\\\". For Baidu, PlatformPrincipal is \\\"API key\\\".</p> <p>For APNS/APNS_SANDBOX, PlatformCredential is \\\"private key\\\". For GCM, PlatformCredential is \\\"API key\\\". For ADM, PlatformCredential is \\\"client secret\\\". For WNS, PlatformCredential is \\\"secret key\\\". For MPNS, PlatformCredential is \\\"private key\\\". For Baidu, PlatformCredential is \\\"secret key\\\". The PlatformApplicationArn that is returned when using <code>CreatePlatformApplication</code> is then used as an attribute for the <code>CreatePlatformEndpoint</code> action. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. For more information about obtaining the PlatformPrincipal and PlatformCredential for each of the supported push notification services, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/mobile-push-apns.html\\\">Getting Started with Apple Push Notification Service</a>, <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/mobile-push-adm.html\\\">Getting Started with Amazon Device Messaging</a>, <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/mobile-push-baidu.html\\\">Getting Started with Baidu Cloud Push</a>, <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/mobile-push-gcm.html\\\">Getting Started with Google Cloud Messaging for Android</a>, <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/mobile-push-mpns.html\\\">Getting Started with MPNS</a>, or <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/mobile-push-wns.html\\\">Getting Started with WNS</a>. </p>\"\
    },\
    \"CreatePlatformEndpoint\":{\
      \"name\":\"CreatePlatformEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreatePlatformEndpointInput\"},\
      \"output\":{\
        \"shape\":\"CreateEndpointResponse\",\
        \"resultWrapper\":\"CreatePlatformEndpointResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Creates an endpoint for a device and mobile app on one of the supported push notification services, such as GCM and APNS. <code>CreatePlatformEndpoint</code> requires the PlatformApplicationArn that is returned from <code>CreatePlatformApplication</code>. The EndpointArn that is returned when using <code>CreatePlatformEndpoint</code> can then be used by the <code>Publish</code> action to send a message to a mobile app or by the <code>Subscribe</code> action for subscription to a topic. The <code>CreatePlatformEndpoint</code> action is idempotent, so if the requester already owns an endpoint with the same device token and attributes, that endpoint's ARN is returned without creating a new endpoint. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p> <p>When using <code>CreatePlatformEndpoint</code> with Baidu, two attributes must be provided: ChannelId and UserId. The token field must also contain the ChannelId. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html\\\">Creating an Amazon SNS Endpoint for Baidu</a>. </p>\"\
    },\
    \"CreateTopic\":{\
      \"name\":\"CreateTopic\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateTopicInput\"},\
      \"output\":{\
        \"shape\":\"CreateTopicResponse\",\
        \"resultWrapper\":\"CreateTopicResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TopicLimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates a topic to which notifications can be published. Users can create at most 100,000 topics. For more information, see <a href=\\\"http://aws.amazon.com/sns/\\\">http://aws.amazon.com/sns</a>. This action is idempotent, so if the requester already owns a topic with the specified name, that topic's ARN is returned without creating a new topic.</p>\"\
    },\
    \"DeleteEndpoint\":{\
      \"name\":\"DeleteEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteEndpointInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes the endpoint for a device and mobile app from Amazon SNS. This action is idempotent. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p> <p>When you delete an endpoint that is also subscribed to a topic, then you must also unsubscribe the endpoint from the topic.</p>\"\
    },\
    \"DeletePlatformApplication\":{\
      \"name\":\"DeletePlatformApplication\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeletePlatformApplicationInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes a platform application object for one of the supported push notification services, such as APNS and GCM. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\"\
    },\
    \"DeleteTopic\":{\
      \"name\":\"DeleteTopic\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTopicInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes a topic and all its subscriptions. Deleting a topic might prevent some messages previously sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a topic that does not exist does not result in an error.</p>\"\
    },\
    \"GetEndpointAttributes\":{\
      \"name\":\"GetEndpointAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetEndpointAttributesInput\"},\
      \"output\":{\
        \"shape\":\"GetEndpointAttributesResponse\",\
        \"resultWrapper\":\"GetEndpointAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the endpoint attributes for a device on one of the supported push notification services, such as GCM and APNS. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\"\
    },\
    \"GetPlatformApplicationAttributes\":{\
      \"name\":\"GetPlatformApplicationAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetPlatformApplicationAttributesInput\"},\
      \"output\":{\
        \"shape\":\"GetPlatformApplicationAttributesResponse\",\
        \"resultWrapper\":\"GetPlatformApplicationAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the attributes of the platform application object for the supported push notification services, such as APNS and GCM. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\"\
    },\
    \"GetSMSAttributes\":{\
      \"name\":\"GetSMSAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetSMSAttributesInput\"},\
      \"output\":{\
        \"shape\":\"GetSMSAttributesResponse\",\
        \"resultWrapper\":\"GetSMSAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ThrottledException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidParameterException\"}\
      ],\
      \"documentation\":\"<p>Returns the settings for sending SMS messages from your account.</p> <p>These settings are set with the <code>SetSMSAttributes</code> action.</p>\"\
    },\
    \"GetSubscriptionAttributes\":{\
      \"name\":\"GetSubscriptionAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetSubscriptionAttributesInput\"},\
      \"output\":{\
        \"shape\":\"GetSubscriptionAttributesResponse\",\
        \"resultWrapper\":\"GetSubscriptionAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns all of the properties of a subscription.</p>\"\
    },\
    \"GetTopicAttributes\":{\
      \"name\":\"GetTopicAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTopicAttributesInput\"},\
      \"output\":{\
        \"shape\":\"GetTopicAttributesResponse\",\
        \"resultWrapper\":\"GetTopicAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns all of the properties of a topic. Topic properties returned might differ based on the authorization of the user.</p>\"\
    },\
    \"ListEndpointsByPlatformApplication\":{\
      \"name\":\"ListEndpointsByPlatformApplication\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEndpointsByPlatformApplicationInput\"},\
      \"output\":{\
        \"shape\":\"ListEndpointsByPlatformApplicationResponse\",\
        \"resultWrapper\":\"ListEndpointsByPlatformApplicationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Lists the endpoints and endpoint attributes for devices in a supported push notification service, such as GCM and APNS. The results for <code>ListEndpointsByPlatformApplication</code> are paginated and return a limited list of endpoints, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListEndpointsByPlatformApplication</code> again using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\"\
    },\
    \"ListPhoneNumbersOptedOut\":{\
      \"name\":\"ListPhoneNumbersOptedOut\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListPhoneNumbersOptedOutInput\"},\
      \"output\":{\
        \"shape\":\"ListPhoneNumbersOptedOutResponse\",\
        \"resultWrapper\":\"ListPhoneNumbersOptedOutResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ThrottledException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidParameterException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of phone numbers that are opted out, meaning you cannot send SMS messages to them.</p> <p>The results for <code>ListPhoneNumbersOptedOut</code> are paginated, and each page returns up to 100 phone numbers. If additional phone numbers are available after the first page of results, then a <code>NextToken</code> string will be returned. To receive the next page, you call <code>ListPhoneNumbersOptedOut</code> again using the <code>NextToken</code> string received from the previous call. When there are no more records to return, <code>NextToken</code> will be null.</p>\"\
    },\
    \"ListPlatformApplications\":{\
      \"name\":\"ListPlatformApplications\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListPlatformApplicationsInput\"},\
      \"output\":{\
        \"shape\":\"ListPlatformApplicationsResponse\",\
        \"resultWrapper\":\"ListPlatformApplicationsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the platform application objects for the supported push notification services, such as APNS and GCM. The results for <code>ListPlatformApplications</code> are paginated and return a limited list of applications, up to 100. If additional records are available after the first page results, then a NextToken string will be returned. To receive the next page, you call <code>ListPlatformApplications</code> using the NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\"\
    },\
    \"ListSubscriptions\":{\
      \"name\":\"ListSubscriptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListSubscriptionsInput\"},\
      \"output\":{\
        \"shape\":\"ListSubscriptionsResponse\",\
        \"resultWrapper\":\"ListSubscriptionsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the requester's subscriptions. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptions</code> call to get further results.</p>\"\
    },\
    \"ListSubscriptionsByTopic\":{\
      \"name\":\"ListSubscriptionsByTopic\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListSubscriptionsByTopicInput\"},\
      \"output\":{\
        \"shape\":\"ListSubscriptionsByTopicResponse\",\
        \"resultWrapper\":\"ListSubscriptionsByTopicResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the subscriptions to a specific topic. Each call returns a limited list of subscriptions, up to 100. If there are more subscriptions, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListSubscriptionsByTopic</code> call to get further results.</p>\"\
    },\
    \"ListTopics\":{\
      \"name\":\"ListTopics\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTopicsInput\"},\
      \"output\":{\
        \"shape\":\"ListTopicsResponse\",\
        \"resultWrapper\":\"ListTopicsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the requester's topics. Each call returns a limited list of topics, up to 100. If there are more topics, a <code>NextToken</code> is also returned. Use the <code>NextToken</code> parameter in a new <code>ListTopics</code> call to get further results.</p>\"\
    },\
    \"OptInPhoneNumber\":{\
      \"name\":\"OptInPhoneNumber\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"OptInPhoneNumberInput\"},\
      \"output\":{\
        \"shape\":\"OptInPhoneNumberResponse\",\
        \"resultWrapper\":\"OptInPhoneNumberResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ThrottledException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"InvalidParameterException\"}\
      ],\
      \"documentation\":\"<p>Use this request to opt in a phone number that is opted out, which enables you to resume sending SMS messages to the number.</p> <p>You can opt in a phone number only once every 30 days.</p>\"\
    },\
    \"Publish\":{\
      \"name\":\"Publish\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PublishInput\"},\
      \"output\":{\
        \"shape\":\"PublishResponse\",\
        \"resultWrapper\":\"PublishResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"EndpointDisabledException\"},\
        {\"shape\":\"PlatformApplicationDisabledException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Sends a message to all of a topic's subscribed endpoints. When a <code>messageId</code> is returned, the message has been saved and Amazon SNS will attempt to deliver it to the topic's subscribers shortly. The format of the outgoing message to each subscribed endpoint depends on the notification protocol.</p> <p>To use the <code>Publish</code> action for sending a message to a mobile endpoint, such as an app on a Kindle device or mobile phone, you must specify the EndpointArn for the TargetArn parameter. The EndpointArn is returned when making a call with the <code>CreatePlatformEndpoint</code> action. </p> <p>For more information about formatting messages, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html\\\">Send Custom Platform-Specific Payloads in Messages to Mobile Devices</a>. </p>\"\
    },\
    \"RemovePermission\":{\
      \"name\":\"RemovePermission\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RemovePermissionInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Removes a statement from a topic's access control policy.</p>\"\
    },\
    \"SetEndpointAttributes\":{\
      \"name\":\"SetEndpointAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetEndpointAttributesInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Sets the attributes for an endpoint for a device on one of the supported push notification services, such as GCM and APNS. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. </p>\"\
    },\
    \"SetPlatformApplicationAttributes\":{\
      \"name\":\"SetPlatformApplicationAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetPlatformApplicationAttributesInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Sets the attributes of the platform application object for the supported push notification services, such as APNS and GCM. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html\\\">Using Amazon SNS Mobile Push Notifications</a>. For information on configuring attributes for message delivery status, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html\\\">Using Amazon SNS Application Attributes for Message Delivery Status</a>. </p>\"\
    },\
    \"SetSMSAttributes\":{\
      \"name\":\"SetSMSAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetSMSAttributesInput\"},\
      \"output\":{\
        \"shape\":\"SetSMSAttributesResponse\",\
        \"resultWrapper\":\"SetSMSAttributesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottledException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Use this request to set the default settings for sending SMS messages and receiving daily SMS usage reports.</p> <p>You can override some of these settings for a single message when you use the <code>Publish</code> action with the <code>MessageAttributes.entry.N</code> parameter. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html\\\">Sending an SMS Message</a> in the <i>Amazon SNS Developer Guide</i>.</p>\"\
    },\
    \"SetSubscriptionAttributes\":{\
      \"name\":\"SetSubscriptionAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetSubscriptionAttributesInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Allows a subscription owner to set an attribute of the topic to a new value.</p>\"\
    },\
    \"SetTopicAttributes\":{\
      \"name\":\"SetTopicAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetTopicAttributesInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Allows a topic owner to set an attribute of the topic to a new value.</p>\"\
    },\
    \"Subscribe\":{\
      \"name\":\"Subscribe\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SubscribeInput\"},\
      \"output\":{\
        \"shape\":\"SubscribeResponse\",\
        \"resultWrapper\":\"SubscribeResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"SubscriptionLimitExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AuthorizationErrorException\"}\
      ],\
      \"documentation\":\"<p>Prepares to subscribe an endpoint by sending the endpoint a confirmation message. To actually create a subscription, the endpoint owner must call the <code>ConfirmSubscription</code> action with the token from the confirmation message. Confirmation tokens are valid for three days.</p>\"\
    },\
    \"Unsubscribe\":{\
      \"name\":\"Unsubscribe\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UnsubscribeInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"AuthorizationErrorException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes a subscription. If the subscription requires authentication for deletion, only the owner of the subscription or the topic's owner can unsubscribe, and an AWS signature is required. If the <code>Unsubscribe</code> call does not require authentication and the requester is not the subscription owner, a final cancellation message is delivered to the endpoint, so that the endpoint owner can easily resubscribe to the topic if the <code>Unsubscribe</code> request was unintended.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ActionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"action\"}\
    },\
    \"AddPermissionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TopicArn\",\
        \"Label\",\
        \"AWSAccountId\",\
        \"ActionName\"\
      ],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic whose access control policy you wish to modify.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"label\",\
          \"documentation\":\"<p>A unique identifier for the new policy statement.</p>\"\
        },\
        \"AWSAccountId\":{\
          \"shape\":\"DelegatesList\",\
          \"documentation\":\"<p>The AWS account IDs of the users (principals) who will be given access to the specified actions. The users must have AWS accounts, but do not need to be signed up for this service.</p>\"\
        },\
        \"ActionName\":{\
          \"shape\":\"ActionsList\",\
          \"documentation\":\"<p>The action you want to allow for the specified principal(s).</p> <p>Valid values: any Amazon SNS action name.</p>\"\
        }\
      }\
    },\
    \"AuthorizationErrorException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates that the user has been denied access to the requested resource.</p>\",\
      \"error\":{\
        \"code\":\"AuthorizationError\",\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Binary\":{\"type\":\"blob\"},\
    \"CheckIfPhoneNumberIsOptedOutInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"phoneNumber\"],\
      \"members\":{\
        \"phoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number for which you want to check the opt out status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <code>CheckIfPhoneNumberIsOptedOut</code> action.</p>\"\
    },\
    \"CheckIfPhoneNumberIsOptedOutResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"isOptedOut\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Indicates whether the phone number is opted out:</p> <ul> <li> <p> <code>true</code> â The phone number is opted out, meaning you cannot publish SMS messages to it.</p> </li> <li> <p> <code>false</code> â The phone number is opted in, meaning you can publish SMS messages to it.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>The response from the <code>CheckIfPhoneNumberIsOptedOut</code> action.</p>\"\
    },\
    \"ConfirmSubscriptionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TopicArn\",\
        \"Token\"\
      ],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic for which you wish to confirm a subscription.</p>\"\
        },\
        \"Token\":{\
          \"shape\":\"token\",\
          \"documentation\":\"<p>Short-lived token sent to an endpoint during the <code>Subscribe</code> action.</p>\"\
        },\
        \"AuthenticateOnUnsubscribe\":{\
          \"shape\":\"authenticateOnUnsubscribe\",\
          \"documentation\":\"<p>Disallows unauthenticated unsubscribes of the subscription. If the value of this parameter is <code>true</code> and the request has an AWS signature, then only the topic owner and the subscription owner can unsubscribe the endpoint. The unsubscribe action requires AWS authentication. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for ConfirmSubscription action.</p>\"\
    },\
    \"ConfirmSubscriptionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The ARN of the created subscription.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ConfirmSubscriptions action.</p>\"\
    },\
    \"CreateEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>EndpointArn returned from CreateEndpoint action.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response from CreateEndpoint action.</p>\"\
    },\
    \"CreatePlatformApplicationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Platform\",\
        \"Attributes\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Application names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, hyphens, and periods, and must be between 1 and 256 characters long.</p>\"\
        },\
        \"Platform\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The following platforms are supported: ADM (Amazon Device Messaging), APNS (Apple Push Notification Service), APNS_SANDBOX, and GCM (Google Cloud Messaging).</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>For a list of attributes, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/api/API_SetPlatformApplicationAttributes.html\\\">SetPlatformApplicationAttributes</a> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for CreatePlatformApplication action.</p>\"\
    },\
    \"CreatePlatformApplicationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn is returned.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response from CreatePlatformApplication action.</p>\"\
    },\
    \"CreatePlatformEndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PlatformApplicationArn\",\
        \"Token\"\
      ],\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn returned from CreatePlatformApplication is used to create a an endpoint.</p>\"\
        },\
        \"Token\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique identifier created by the notification service for an app on a device. The specific name for Token will vary, depending on which notification service is being used. For example, when using APNS as the notification service, you need the device token. Alternatively, when using GCM or ADM, the device token equivalent is called the registration ID.</p>\"\
        },\
        \"CustomUserData\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>For a list of attributes, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/api/API_SetEndpointAttributes.html\\\">SetEndpointAttributes</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for CreatePlatformEndpoint action.</p>\"\
    },\
    \"CreateTopicInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"topicName\",\
          \"documentation\":\"<p>The name of the topic you want to create.</p> <p>Constraints: Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for CreateTopic action.</p>\"\
    },\
    \"CreateTopicResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) assigned to the created topic.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response from CreateTopic action.</p>\"\
    },\
    \"DelegatesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"delegate\"}\
    },\
    \"DeleteEndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>EndpointArn of endpoint to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for DeleteEndpoint action.</p>\"\
    },\
    \"DeletePlatformApplicationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"PlatformApplicationArn\"],\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn of platform application object to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for DeletePlatformApplication action.</p>\"\
    },\
    \"DeleteTopicInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TopicArn\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic you want to delete.</p>\"\
        }\
      }\
    },\
    \"Endpoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>EndpointArn for mobile app and device.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>Attributes for endpoint.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Endpoint for mobile app and device.</p>\"\
    },\
    \"EndpointDisabledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Message for endpoint disabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Exception error indicating endpoint disabled.</p>\",\
      \"error\":{\
        \"code\":\"EndpointDisabled\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"GetEndpointAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>EndpointArn for GetEndpointAttributes input.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for GetEndpointAttributes action.</p>\"\
    },\
    \"GetEndpointAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>Attributes include the following:</p> <ul> <li> <p> <code>CustomUserData</code> -- arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</p> </li> <li> <p> <code>Enabled</code> -- flag that enables/disables delivery to the endpoint. Amazon SNS will set this to false when a notification service indicates to Amazon SNS that the endpoint is invalid. Users can set it back to true, typically after updating Token.</p> </li> <li> <p> <code>Token</code> -- device token, also referred to as a registration id, for an app and mobile device. This is returned from the notification service when an app and mobile device are registered with the notification service.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Response from GetEndpointAttributes of the EndpointArn.</p>\"\
    },\
    \"GetPlatformApplicationAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"PlatformApplicationArn\"],\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn for GetPlatformApplicationAttributesInput.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for GetPlatformApplicationAttributes action.</p>\"\
    },\
    \"GetPlatformApplicationAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>Attributes include the following:</p> <ul> <li> <p> <code>EventEndpointCreated</code> -- Topic ARN to which EndpointCreated event notifications should be sent.</p> </li> <li> <p> <code>EventEndpointDeleted</code> -- Topic ARN to which EndpointDeleted event notifications should be sent.</p> </li> <li> <p> <code>EventEndpointUpdated</code> -- Topic ARN to which EndpointUpdate event notifications should be sent.</p> </li> <li> <p> <code>EventDeliveryFailure</code> -- Topic ARN to which DeliveryFailure event notifications should be sent upon Direct Publish delivery failure (permanent) to one of the application's endpoints.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Response for GetPlatformApplicationAttributes action.</p>\"\
    },\
    \"GetSMSAttributesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"attributes\":{\
          \"shape\":\"ListString\",\
          \"documentation\":\"<p>A list of the individual attribute names, such as <code>MonthlySpendLimit</code>, for which you want values.</p> <p>For all attribute names, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/api/API_SetSMSAttributes.html\\\">SetSMSAttributes</a>.</p> <p>If you don't use this parameter, Amazon SNS returns all SMS attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <code>GetSMSAttributes</code> request.</p>\"\
    },\
    \"GetSMSAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>The SMS attribute names and their values.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response from the <code>GetSMSAttributes</code> request.</p>\"\
    },\
    \"GetSubscriptionAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"SubscriptionArn\"],\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The ARN of the subscription whose properties you want to get.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for GetSubscriptionAttributes.</p>\"\
    },\
    \"GetSubscriptionAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"SubscriptionAttributesMap\",\
          \"documentation\":\"<p>A map of the subscription's attributes. Attributes in this map include the following:</p> <ul> <li> <p> <code>SubscriptionArn</code> -- the subscription's ARN</p> </li> <li> <p> <code>TopicArn</code> -- the topic ARN that the subscription is associated with</p> </li> <li> <p> <code>Owner</code> -- the AWS account ID of the subscription's owner</p> </li> <li> <p> <code>ConfirmationWasAuthenticated</code> -- true if the subscription confirmation request was authenticated</p> </li> <li> <p> <code>DeliveryPolicy</code> -- the JSON serialization of the subscription's delivery policy</p> </li> <li> <p> <code>EffectiveDeliveryPolicy</code> -- the JSON serialization of the effective delivery policy that takes into account the topic delivery policy and account system defaults</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Response for GetSubscriptionAttributes action.</p>\"\
    },\
    \"GetTopicAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TopicArn\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic whose properties you want to get.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for GetTopicAttributes action.</p>\"\
    },\
    \"GetTopicAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"TopicAttributesMap\",\
          \"documentation\":\"<p>A map of the topic's attributes. Attributes in this map include the following:</p> <ul> <li> <p> <code>TopicArn</code> -- the topic's ARN</p> </li> <li> <p> <code>Owner</code> -- the AWS account ID of the topic's owner</p> </li> <li> <p> <code>Policy</code> -- the JSON serialization of the topic's access control policy</p> </li> <li> <p> <code>DisplayName</code> -- the human-readable name used in the \\\"From\\\" field for notifications to email and email-json endpoints</p> </li> <li> <p> <code>SubscriptionsPending</code> -- the number of subscriptions pending confirmation on this topic</p> </li> <li> <p> <code>SubscriptionsConfirmed</code> -- the number of confirmed subscriptions on this topic</p> </li> <li> <p> <code>SubscriptionsDeleted</code> -- the number of deleted subscriptions on this topic</p> </li> <li> <p> <code>DeliveryPolicy</code> -- the JSON serialization of the topic's delivery policy</p> </li> <li> <p> <code>EffectiveDeliveryPolicy</code> -- the JSON serialization of the effective delivery policy that takes into account system defaults</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Response for GetTopicAttributes action.</p>\"\
    },\
    \"InternalErrorException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates an internal service error.</p>\",\
      \"error\":{\
        \"code\":\"InternalError\",\
        \"httpStatusCode\":500\
      },\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\",\
      \"error\":{\
        \"code\":\"InvalidParameter\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidParameterValueException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The parameter value is invalid.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that a request parameter does not comply with the associated constraints.</p>\",\
      \"error\":{\
        \"code\":\"ParameterValueInvalid\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ListEndpointsByPlatformApplicationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"PlatformApplicationArn\"],\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn for ListEndpointsByPlatformApplicationInput action.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>NextToken string is used when calling ListEndpointsByPlatformApplication action to retrieve additional records that are available after the first page results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for ListEndpointsByPlatformApplication action.</p>\"\
    },\
    \"ListEndpointsByPlatformApplicationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Endpoints\":{\
          \"shape\":\"ListOfEndpoints\",\
          \"documentation\":\"<p>Endpoints returned for ListEndpointsByPlatformApplication action.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>NextToken string is returned when calling ListEndpointsByPlatformApplication action if additional records are available after the first page results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ListEndpointsByPlatformApplication action.</p>\"\
    },\
    \"ListOfEndpoints\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Endpoint\"}\
    },\
    \"ListOfPlatformApplications\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PlatformApplication\"}\
    },\
    \"ListPhoneNumbersOptedOutInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A <code>NextToken</code> string is used when you call the <code>ListPhoneNumbersOptedOut</code> action to retrieve additional records that are available after the first page of results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <code>ListPhoneNumbersOptedOut</code> action.</p>\"\
    },\
    \"ListPhoneNumbersOptedOutResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"phoneNumbers\":{\
          \"shape\":\"PhoneNumberList\",\
          \"documentation\":\"<p>A list of phone numbers that are opted out of receiving SMS messages. The list is paginated, and each page can contain up to 100 phone numbers.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A <code>NextToken</code> string is returned when you call the <code>ListPhoneNumbersOptedOut</code> action if additional records are available after the first page of results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response from the <code>ListPhoneNumbersOptedOut</code> action.</p>\"\
    },\
    \"ListPlatformApplicationsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>NextToken string is used when calling ListPlatformApplications action to retrieve additional records that are available after the first page results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for ListPlatformApplications action.</p>\"\
    },\
    \"ListPlatformApplicationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PlatformApplications\":{\
          \"shape\":\"ListOfPlatformApplications\",\
          \"documentation\":\"<p>Platform applications returned when calling ListPlatformApplications action.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>NextToken string is returned when calling ListPlatformApplications action if additional records are available after the first page results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ListPlatformApplications action.</p>\"\
    },\
    \"ListString\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"ListSubscriptionsByTopicInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TopicArn\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic for which you wish to find subscriptions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token returned by the previous <code>ListSubscriptionsByTopic</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for ListSubscriptionsByTopic action.</p>\"\
    },\
    \"ListSubscriptionsByTopicResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Subscriptions\":{\
          \"shape\":\"SubscriptionsList\",\
          \"documentation\":\"<p>A list of subscriptions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token to pass along to the next <code>ListSubscriptionsByTopic</code> request. This element is returned if there are more subscriptions to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ListSubscriptionsByTopic action.</p>\"\
    },\
    \"ListSubscriptionsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token returned by the previous <code>ListSubscriptions</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for ListSubscriptions action.</p>\"\
    },\
    \"ListSubscriptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Subscriptions\":{\
          \"shape\":\"SubscriptionsList\",\
          \"documentation\":\"<p>A list of subscriptions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token to pass along to the next <code>ListSubscriptions</code> request. This element is returned if there are more subscriptions to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ListSubscriptions action</p>\"\
    },\
    \"ListTopicsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token returned by the previous <code>ListTopics</code> request.</p>\"\
        }\
      }\
    },\
    \"ListTopicsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Topics\":{\
          \"shape\":\"TopicsList\",\
          \"documentation\":\"<p>A list of topic ARNs.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"nextToken\",\
          \"documentation\":\"<p>Token to pass along to the next <code>ListTopics</code> request. This element is returned if there are additional topics to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for ListTopics action.</p>\"\
    },\
    \"MapStringToString\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"String\"},\
      \"value\":{\"shape\":\"String\"}\
    },\
    \"MessageAttributeMap\":{\
      \"type\":\"map\",\
      \"key\":{\
        \"shape\":\"String\",\
        \"locationName\":\"Name\"\
      },\
      \"value\":{\
        \"shape\":\"MessageAttributeValue\",\
        \"locationName\":\"Value\"\
      }\
    },\
    \"MessageAttributeValue\":{\
      \"type\":\"structure\",\
      \"required\":[\"DataType\"],\
      \"members\":{\
        \"DataType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Amazon SNS supports the following logical data types: String, Number, and Binary. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html#SNSMessageAttributes.DataTypes\\\">Message Attribute Data Types</a>.</p>\"\
        },\
        \"StringValue\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Strings are Unicode with UTF8 binary encoding. For a list of code values, see <a href=\\\"http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters\\\">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p>\"\
        },\
        \"BinaryValue\":{\
          \"shape\":\"Binary\",\
          \"documentation\":\"<p>Binary type attributes can store any binary data, for example, compressed data, encrypted data, or images.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The user-specified message attribute value. For string data types, the value attribute has the same restrictions on the content as the message body. For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/api/API_Publish.html\\\">Publish</a>.</p> <p>Name, type, and value must not be empty or null. In addition, the message body should not be empty or null. All parts of the message attribute, including name, type, and value, are included in the message size restriction, which is currently 256 KB (262,144 bytes). For more information, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html\\\">Using Amazon SNS Message Attributes</a>.</p>\"\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates that the requested resource does not exist.</p>\",\
      \"error\":{\
        \"code\":\"NotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"OptInPhoneNumberInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"phoneNumber\"],\
      \"members\":{\
        \"phoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number to opt in.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for the OptInPhoneNumber action.</p>\"\
    },\
    \"OptInPhoneNumberResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response for the OptInPhoneNumber action.</p>\"\
    },\
    \"PhoneNumber\":{\"type\":\"string\"},\
    \"PhoneNumberList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PhoneNumber\"}\
    },\
    \"PlatformApplication\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn for platform application object.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>Attributes for platform application object.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Platform application object.</p>\"\
    },\
    \"PlatformApplicationDisabledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Message for platform application disabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Exception error indicating platform application disabled.</p>\",\
      \"error\":{\
        \"code\":\"PlatformApplicationDisabled\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"PublishInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The topic you want to publish to.</p> <p>If you don't specify a value for the <code>TopicArn</code> parameter, you must specify a value for the <code>PhoneNumber</code> or <code>TargetArn</code> parameters.</p>\"\
        },\
        \"TargetArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Either TopicArn or EndpointArn, but not both.</p> <p>If you don't specify a value for the <code>TargetArn</code> parameter, you must specify a value for the <code>PhoneNumber</code> or <code>TopicArn</code> parameters.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The phone number to which you want to deliver an SMS message. Use E.164 format.</p> <p>If you don't specify a value for the <code>PhoneNumber</code> parameter, you must specify a value for the <code>TargetArn</code> or <code>TopicArn</code> parameters.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"message\",\
          \"documentation\":\"<p>The message you want to send to the topic.</p> <p>If you want to send the same message to all transport protocols, include the text of the message as a String value.</p> <p>If you want to send different messages for each transport protocol, set the value of the <code>MessageStructure</code> parameter to <code>json</code> and use a JSON object for the <code>Message</code> parameter. </p> <p>Constraints: Messages must be UTF-8 encoded strings at most 256 KB in size (262144 bytes, not 262144 characters).</p> <p>JSON-specific constraints:</p> <ul> <li> <p>Keys in the JSON object that correspond to supported transport protocols must have simple JSON string values.</p> </li> <li> <p>The values will be parsed (unescaped) before they are used in outgoing messages.</p> </li> <li> <p>Outbound notifications are JSON encoded (meaning that the characters will be reescaped for sending).</p> </li> <li> <p>Values have a minimum length of 0 (the empty string, \\\"\\\", is allowed).</p> </li> <li> <p>Values have a maximum length bounded by the overall message size (so, including multiple protocols may limit message sizes).</p> </li> <li> <p>Non-string values will cause the key to be ignored.</p> </li> <li> <p>Keys that do not correspond to supported transport protocols are ignored.</p> </li> <li> <p>Duplicate keys are not allowed.</p> </li> <li> <p>Failure to parse or validate any key or value in the message will cause the <code>Publish</code> call to return an error (no partial delivery).</p> </li> </ul>\"\
        },\
        \"Subject\":{\
          \"shape\":\"subject\",\
          \"documentation\":\"<p>Optional parameter to be used as the \\\"Subject\\\" line when the message is delivered to email endpoints. This field will also be included, if present, in the standard JSON messages delivered to other endpoints.</p> <p>Constraints: Subjects must be ASCII text that begins with a letter, number, or punctuation mark; must not include line breaks or control characters; and must be less than 100 characters long.</p>\"\
        },\
        \"MessageStructure\":{\
          \"shape\":\"messageStructure\",\
          \"documentation\":\"<p>Set <code>MessageStructure</code> to <code>json</code> if you want to send a different message for each protocol. For example, using one publish action, you can send a short message to your SMS subscribers and a longer message to your email subscribers. If you set <code>MessageStructure</code> to <code>json</code>, the value of the <code>Message</code> parameter must: </p> <ul> <li> <p>be a syntactically valid JSON object; and</p> </li> <li> <p>contain at least a top-level JSON key of \\\"default\\\" with a value that is a string.</p> </li> </ul> <p>You can define other top-level keys that define the message you want to send to a specific transport protocol (e.g., \\\"http\\\").</p> <p>For information about sending different messages for each protocol using the AWS Management Console, go to <a href=\\\"http://docs.aws.amazon.com/sns/latest/gsg/Publish.html#sns-message-formatting-by-protocol\\\">Create Different Messages for Each Protocol</a> in the <i>Amazon Simple Notification Service Getting Started Guide</i>. </p> <p>Valid value: <code>json</code> </p>\"\
        },\
        \"MessageAttributes\":{\
          \"shape\":\"MessageAttributeMap\",\
          \"documentation\":\"<p>Message attributes for Publish action.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for Publish action.</p>\"\
    },\
    \"PublishResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MessageId\":{\
          \"shape\":\"messageId\",\
          \"documentation\":\"<p>Unique identifier assigned to the published message.</p> <p>Length Constraint: Maximum 100 characters</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for Publish action.</p>\"\
    },\
    \"RemovePermissionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TopicArn\",\
        \"Label\"\
      ],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic whose access control policy you wish to modify.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"label\",\
          \"documentation\":\"<p>The unique label of the statement you want to remove.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for RemovePermission action.</p>\"\
    },\
    \"SetEndpointAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointArn\",\
        \"Attributes\"\
      ],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>EndpointArn used for SetEndpointAttributes action.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>A map of the endpoint attributes. Attributes in this map include the following:</p> <ul> <li> <p> <code>CustomUserData</code> -- arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.</p> </li> <li> <p> <code>Enabled</code> -- flag that enables/disables delivery to the endpoint. Amazon SNS will set this to false when a notification service indicates to Amazon SNS that the endpoint is invalid. Users can set it back to true, typically after updating Token.</p> </li> <li> <p> <code>Token</code> -- device token, also referred to as a registration id, for an app and mobile device. This is returned from the notification service when an app and mobile device are registered with the notification service.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Input for SetEndpointAttributes action.</p>\"\
    },\
    \"SetPlatformApplicationAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PlatformApplicationArn\",\
        \"Attributes\"\
      ],\
      \"members\":{\
        \"PlatformApplicationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>PlatformApplicationArn for SetPlatformApplicationAttributes action.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>A map of the platform application attributes. Attributes in this map include the following:</p> <ul> <li> <p> <code>PlatformCredential</code> -- The credential received from the notification service. For APNS/APNS_SANDBOX, PlatformCredential is private key. For GCM, PlatformCredential is \\\"API key\\\". For ADM, PlatformCredential is \\\"client secret\\\".</p> </li> <li> <p> <code>PlatformPrincipal</code> -- The principal received from the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is SSL certificate. For GCM, PlatformPrincipal is not applicable. For ADM, PlatformPrincipal is \\\"client id\\\".</p> </li> <li> <p> <code>EventEndpointCreated</code> -- Topic ARN to which EndpointCreated event notifications should be sent.</p> </li> <li> <p> <code>EventEndpointDeleted</code> -- Topic ARN to which EndpointDeleted event notifications should be sent.</p> </li> <li> <p> <code>EventEndpointUpdated</code> -- Topic ARN to which EndpointUpdate event notifications should be sent.</p> </li> <li> <p> <code>EventDeliveryFailure</code> -- Topic ARN to which DeliveryFailure event notifications should be sent upon Direct Publish delivery failure (permanent) to one of the application's endpoints.</p> </li> <li> <p> <code>SuccessFeedbackRoleArn</code> -- IAM role ARN used to give Amazon SNS write access to use CloudWatch Logs on your behalf.</p> </li> <li> <p> <code>FailureFeedbackRoleArn</code> -- IAM role ARN used to give Amazon SNS write access to use CloudWatch Logs on your behalf.</p> </li> <li> <p> <code>SuccessFeedbackSampleRate</code> -- Sample rate percentage (0-100) of successfully delivered messages.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Input for SetPlatformApplicationAttributes action.</p>\"\
    },\
    \"SetSMSAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"attributes\"],\
      \"members\":{\
        \"attributes\":{\
          \"shape\":\"MapStringToString\",\
          \"documentation\":\"<p>The default settings for sending SMS messages from your account. You can set values for the following attribute names:</p> <p> <code>MonthlySpendLimit</code> â The maximum amount in USD that you are willing to spend each month to send SMS messages. When Amazon SNS determines that sending an SMS message would incur a cost that exceeds this limit, it stops sending SMS messages within minutes.</p> <important> <p>Amazon SNS stops sending SMS messages within minutes of the limit being crossed. During that interval, if you continue to send SMS messages, you will incur costs that exceed your limit.</p> </important> <p>By default, the spend limit is set to the maximum allowed by Amazon SNS. If you want to exceed the maximum, contact <a href=\\\"https://aws.amazon.com/premiumsupport/\\\">AWS Support</a> or your AWS sales representative for a service limit increase.</p> <p> <code>DeliveryStatusIAMRole</code> â The ARN of the IAM role that allows Amazon SNS to write logs about SMS deliveries in CloudWatch Logs. For each SMS message that you send, Amazon SNS writes a log that includes the message price, the success or failure status, the reason for failure (if the message failed), the message dwell time, and other information.</p> <p> <code>DeliveryStatusSuccessSamplingRate</code> â The percentage of successful SMS deliveries for which Amazon SNS will write logs in CloudWatch Logs. The value can be an integer from 0 - 100. For example, to write logs only for failed deliveries, set this value to <code>0</code>. To write logs for 10% of your successful deliveries, set it to <code>10</code>.</p> <p> <code>DefaultSenderID</code> â A string, such as your business brand, that is displayed as the sender on the receiving device. Support for sender IDs varies by country. The sender ID can be 1 - 11 alphanumeric characters, and it must contain at least one letter.</p> <p> <code>DefaultSMSType</code> â The type of SMS message that you will send by default. You can assign the following values:</p> <ul> <li> <p> <code>Promotional</code> â (Default) Noncritical messages, such as marketing messages. Amazon SNS optimizes the message delivery to incur the lowest cost.</p> </li> <li> <p> <code>Transactional</code> â Critical messages that support customer transactions, such as one-time passcodes for multi-factor authentication. Amazon SNS optimizes the message delivery to achieve the highest reliability.</p> </li> </ul> <p> <code>UsageReportS3Bucket</code> â The name of the Amazon S3 bucket to receive daily SMS usage reports from Amazon SNS. Each day, Amazon SNS will deliver a usage report as a CSV file to the bucket. The report includes the following information for each SMS message that was successfully delivered by your account:</p> <ul> <li> <p>Time that the message was published (in UTC)</p> </li> <li> <p>Message ID</p> </li> <li> <p>Destination phone number</p> </li> <li> <p>Message type</p> </li> <li> <p>Delivery status</p> </li> <li> <p>Message price (in USD)</p> </li> <li> <p>Part number (a message is split into multiple parts if it is too long for a single message)</p> </li> <li> <p>Total number of parts</p> </li> </ul> <p>To receive the report, the bucket must have a policy that allows the Amazon SNS service principle to perform the <code>s3:PutObject</code> and <code>s3:GetBucketLocation</code> actions.</p> <p>For an example bucket policy and usage report, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/sms_stats.html\\\">Monitoring SMS Activity</a> in the <i>Amazon SNS Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the SetSMSAttributes action.</p>\"\
    },\
    \"SetSMSAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response for the SetSMSAttributes action.</p>\"\
    },\
    \"SetSubscriptionAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SubscriptionArn\",\
        \"AttributeName\"\
      ],\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The ARN of the subscription to modify.</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"attributeName\",\
          \"documentation\":\"<p>The name of the attribute you want to set. Only a subset of the subscriptions attributes are mutable.</p> <p>Valid values: <code>DeliveryPolicy</code> | <code>RawMessageDelivery</code> </p>\"\
        },\
        \"AttributeValue\":{\
          \"shape\":\"attributeValue\",\
          \"documentation\":\"<p>The new value for the attribute in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for SetSubscriptionAttributes action.</p>\"\
    },\
    \"SetTopicAttributesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TopicArn\",\
        \"AttributeName\"\
      ],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic to modify.</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"attributeName\",\
          \"documentation\":\"<p>The name of the attribute you want to set. Only a subset of the topic's attributes are mutable.</p> <p>Valid values: <code>Policy</code> | <code>DisplayName</code> | <code>DeliveryPolicy</code> </p>\"\
        },\
        \"AttributeValue\":{\
          \"shape\":\"attributeValue\",\
          \"documentation\":\"<p>The new value for the attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for SetTopicAttributes action.</p>\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"SubscribeInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TopicArn\",\
        \"Protocol\"\
      ],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the topic you want to subscribe to.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"protocol\",\
          \"documentation\":\"<p>The protocol you want to use. Supported protocols include:</p> <ul> <li> <p> <code>http</code> -- delivery of JSON-encoded message via HTTP POST</p> </li> <li> <p> <code>https</code> -- delivery of JSON-encoded message via HTTPS POST</p> </li> <li> <p> <code>email</code> -- delivery of message via SMTP</p> </li> <li> <p> <code>email-json</code> -- delivery of JSON-encoded message via SMTP</p> </li> <li> <p> <code>sms</code> -- delivery of message via SMS</p> </li> <li> <p> <code>sqs</code> -- delivery of JSON-encoded message to an Amazon SQS queue</p> </li> <li> <p> <code>application</code> -- delivery of JSON-encoded message to an EndpointArn for a mobile app and device.</p> </li> <li> <p> <code>lambda</code> -- delivery of JSON-encoded message to an AWS Lambda function.</p> </li> </ul>\"\
        },\
        \"Endpoint\":{\
          \"shape\":\"endpoint\",\
          \"documentation\":\"<p>The endpoint that you want to receive notifications. Endpoints vary by protocol:</p> <ul> <li> <p>For the <code>http</code> protocol, the endpoint is an URL beginning with \\\"http://\\\"</p> </li> <li> <p>For the <code>https</code> protocol, the endpoint is a URL beginning with \\\"https://\\\"</p> </li> <li> <p>For the <code>email</code> protocol, the endpoint is an email address</p> </li> <li> <p>For the <code>email-json</code> protocol, the endpoint is an email address</p> </li> <li> <p>For the <code>sms</code> protocol, the endpoint is a phone number of an SMS-enabled device</p> </li> <li> <p>For the <code>sqs</code> protocol, the endpoint is the ARN of an Amazon SQS queue</p> </li> <li> <p>For the <code>application</code> protocol, the endpoint is the EndpointArn of a mobile app and device.</p> </li> <li> <p>For the <code>lambda</code> protocol, the endpoint is the ARN of an AWS Lambda function.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Input for Subscribe action.</p>\"\
    },\
    \"SubscribeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The ARN of the subscription, if the service was able to create a subscription immediately (without requiring endpoint owner confirmation).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response for Subscribe action.</p>\"\
    },\
    \"Subscription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The subscription's ARN.</p>\"\
        },\
        \"Owner\":{\
          \"shape\":\"account\",\
          \"documentation\":\"<p>The subscription's owner.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"protocol\",\
          \"documentation\":\"<p>The subscription's protocol.</p>\"\
        },\
        \"Endpoint\":{\
          \"shape\":\"endpoint\",\
          \"documentation\":\"<p>The subscription's endpoint (format depends on the protocol).</p>\"\
        },\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The ARN of the subscription's topic.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A wrapper type for the attributes of an Amazon SNS subscription.</p>\"\
    },\
    \"SubscriptionAttributesMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"attributeName\"},\
      \"value\":{\"shape\":\"attributeValue\"}\
    },\
    \"SubscriptionLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates that the customer already owns the maximum allowed number of subscriptions.</p>\",\
      \"error\":{\
        \"code\":\"SubscriptionLimitExceeded\",\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SubscriptionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Subscription\"}\
    },\
    \"ThrottledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Throttled request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the rate at which requests have been submitted for this action exceeds the limit for your account.</p>\",\
      \"error\":{\
        \"code\":\"Throttled\",\
        \"httpStatusCode\":429,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Topic\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"topicARN\",\
          \"documentation\":\"<p>The topic's ARN.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A wrapper type for the topic's Amazon Resource Name (ARN). To retrieve a topic's attributes, use <code>GetTopicAttributes</code>.</p>\"\
    },\
    \"TopicAttributesMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"attributeName\"},\
      \"value\":{\"shape\":\"attributeValue\"}\
    },\
    \"TopicLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Indicates that the customer already owns the maximum allowed number of topics.</p>\",\
      \"error\":{\
        \"code\":\"TopicLimitExceeded\",\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TopicsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Topic\"}\
    },\
    \"UnsubscribeInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"SubscriptionArn\"],\
      \"members\":{\
        \"SubscriptionArn\":{\
          \"shape\":\"subscriptionARN\",\
          \"documentation\":\"<p>The ARN of the subscription to be deleted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for Unsubscribe action.</p>\"\
    },\
    \"account\":{\"type\":\"string\"},\
    \"action\":{\"type\":\"string\"},\
    \"attributeName\":{\"type\":\"string\"},\
    \"attributeValue\":{\"type\":\"string\"},\
    \"authenticateOnUnsubscribe\":{\"type\":\"string\"},\
    \"boolean\":{\"type\":\"boolean\"},\
    \"delegate\":{\"type\":\"string\"},\
    \"endpoint\":{\"type\":\"string\"},\
    \"label\":{\"type\":\"string\"},\
    \"message\":{\"type\":\"string\"},\
    \"messageId\":{\"type\":\"string\"},\
    \"messageStructure\":{\"type\":\"string\"},\
    \"nextToken\":{\"type\":\"string\"},\
    \"protocol\":{\"type\":\"string\"},\
    \"string\":{\"type\":\"string\"},\
    \"subject\":{\"type\":\"string\"},\
    \"subscriptionARN\":{\"type\":\"string\"},\
    \"token\":{\"type\":\"string\"},\
    \"topicARN\":{\"type\":\"string\"},\
    \"topicName\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<fullname>Amazon Simple Notification Service</fullname> <p>Amazon Simple Notification Service (Amazon SNS) is a web service that enables you to build distributed web-enabled applications. Applications can use Amazon SNS to easily push real-time notification messages to interested subscribers over multiple delivery protocols. For more information about this product see <a href=\\\"http://aws.amazon.com/sns/\\\">http://aws.amazon.com/sns</a>. For detailed information about Amazon SNS features and their associated API calls, see the <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/\\\">Amazon SNS Developer Guide</a>. </p> <p>We also provide SDKs that enable you to access Amazon SNS from your preferred programming language. The SDKs contain functionality that automatically takes care of tasks such as: cryptographically signing your service requests, retrying requests, and handling error responses. For a list of available SDKs, go to <a href=\\\"http://aws.amazon.com/tools/\\\">Tools for Amazon Web Services</a>. </p>\"\
}\
";
}

@end
