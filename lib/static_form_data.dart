// ignore_for_file: unused_element, prefer_const_constructors

import 'package:flutter/material.dart';

const String staticFormData = '''
{
  "data": {
    "dynamicForms": [
      {
        "Id": 4,
        "Name": "Equipment Checkup",
        "Description": null,
        "SchemaDefinition": {
          "formId": "equipCheck-121212",
          "version": "1",
          "title": "Equipment Checkup",
          "items": [
            {
              "fieldGroup": {
                "title": "Before task commences",
                "items": [
                  {
                    "fieldGroup": {
                      "items": [
                        {
                          "fId": "12121212",
                          "type": "single-selection",
                          "text": "I am mentally and physically fit for work and will not breach fatigue management rules by completing this job",
                          "default": "Yes",
                          "options": [
                            {
                              "text": "Yes",
                              "uiClasses": ["positive"]
                            },
                            {
                              "text": "No",
                              "uiClasses": ["negative"]
                            }
                          ],
                          "isRequired": true,
                          "isVisible": true
                        },
                        {
                          "fId": "32121214",
                          "type": "open-text",
                          "text": "Provide more details",
                          "default": "",
                          "allowSupportingImages": true,
                          "isRequired": true,
                          "isVisible": false,
                          "dependencies": {
                            "isVisible": {
                              "type": "boolean-dependency",
                              "onFId": "12121212",
                              "value": "No"
                            }
                          }
                        },
                        {
                          "fId": "32121215",
                          "type": "open-text",
                          "text": "Corrective action taken",
                          "default": "",
                          "allowSupportingImages": false,
                          "isRequired": true,
                          "isVisible": false,
                          "dependencies": {
                            "isVisible": {
                              "type": "boolean-dependency",
                              "onFId": "12121212",
                              "value": "No"
                            }
                          }
                        }
                      ]
                    }
                  },
                  {
                    "fieldGroup": {
                      "items": [
                        {
                          "fId": "24242777",
                          "type": "single-selection",
                          "text": "I am trained, licensed and authorised to do the work",
                          "default": "Yes",
                          "options": [
                            {
                              "text": "Yes",
                              "uiClasses": ["positive"]
                            },
                            {
                              "text": "No",
                              "uiClasses": ["negative"]
                            }
                          ],
                          "isRequired": true,
                          "isVisible": true
                        },
                        {
                          "fId": "36121214",
                          "type": "open-text",
                          "text": "Provide more details",
                          "default": "",
                          "allowSupportingImages": true,
                          "isRequired": true,
                          "isVisible": false,
                          "dependencies": {
                            "isVisible": {
                              "type": "boolean-dependency",
                              "onFId": "24242777",
                              "value": "No"
                            }
                          }
                        },
                        {
                          "fId": "32121215",
                          "type": "open-text",
                          "text": "Corrective action taken",
                          "default": "",
                          "allowSupportingImages": false,
                          "isRequired": true,
                          "isVisible": false,
                          "dependencies": {
                            "isVisible": {
                              "type": "boolean-dependency",
                              "onFId": "24242777",
                              "value": "No"
                            }
                          }
                        }
                      ]
                    }
                  },
                  {
                    "fId": "36363636",
                    "type": "single-selection",
                    "text": "I have correct PPE for the task",
                    "default": "Yes",
                    "options": [
                      {
                        "text": "Yes",
                        "uiClasses": ["positive"]
                      },
                      {
                        "text": "No",
                        "uiClasses": ["negative"]
                      }
                    ],
                    "isRequired": true,
                    "isVisible": true
                  }
                ]
              }
            },
            {
              "fieldGroup": {
                "title": "Hazards",
                "items": [
                  {
                    "fId": "48484848",
                    "type": "single-selection",
                    "text": "I have identified additional hazards associated with the task",
                    "default": "Yes",
                    "options": [
                      {
                        "uiClasses": ["negative"],
                        "text": "Yes"
                      },
                      {
                        "uiClasses": ["positive"],
                        "text": "No"
                      }
                    ],
                    "isRequired": true,
                    "isVisible": true
                  },
                  {
                    "fId": "12312312",
                    "type": "open-text",
                    "text": "Description of hazards",
                    "isRequired": true,
                    "dependencies": {
                      "isVisible": {
                        "type": "boolean-dependency",
                        "onFId": "48484848",
                        "value": "Yes"
                      }
                    }
                  },
                  {
                    "fId": "21321322",
                    "type": "image-upload",
                    "text": "Or take a picture",
                    "default": null,
                    "isRequired": false,
                    "inputLimit": 2,
                    "dependencies": {
                      "isVisible": {
                        "type": "boolean-dependency",
                        "onFId": "48484848",
                        "value": "Yes"
                      }
                    }
                  }
                ]
              }
            }
          ]
        },
        "TypeId": 1,
        "CreateDate": 1704669443256,
        "UpdateDate": 1705621805816
      }
    ]
  }
}
''';

final Map<String, dynamic> customStyles = {
  "positive": {
    "color": Color(0xFFF3FFF8), // Selected positive background color
    "border":
        Border.all(color: Color(0xFF099444)), // Selected positive border color
    "textColor":
        Color(0xFF099444), // Text color same as border color for positive
  },
  "negative": {
    "color": Color(0xFFFFE3E3), // Selected negative background color
    "border":
        Border.all(color: Color(0xFFD90000)), // Selected negative border color
    "textColor":
        Color(0xFFD90000), // Text color same as border color for negative
  },
  "default": {
    "color": Colors.grey, // Default color for other cases when selected
    "border": Border.all(
        color: Colors.transparent), // No specific border for default case
    "textColor": Color(0xFF007378), // Default text color
  },
  "nonSelected": {
    "color": Colors.white, // Non-selected button color
    "border": Border.all(
        color: Color.fromRGBO(30, 30, 30, 0.12)), // Non-selected border color
    "textColor": Color(0xFF007378), // Non-selected text color
  }
};
