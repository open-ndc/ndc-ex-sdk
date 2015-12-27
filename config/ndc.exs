use Mix.Config

config :ndc_ex_sdk,

label: "KRO",
rest: [
    url: "http://iata.api.mashery.com/kronos/api",
    headers: [
      accept: "application/xml",
      contentType: "application/xml",
      authorizationKey: "xxxxxxxx"
    ]
  ],

ndc: [
  document: [
    name: "NDC Wrapper",
    referenceVersion: "1.0"
  ],
  party: [
    sender: [
      oraSender: [
        airlineID: "C9",
        name: "Kronos Air",
        agentUser: [
          name: "Travel Wadus",
          type: "TravelManagementCompany",
          pseudoCity: "A4A",
          agentUserID: "travelwadus",
          iata_Number: "00000001"
        ]
      ]
    ]
  ],
  participants: [
    participant: [
      aggregatorParticipant: [
        name: "Wadus NDC Gateway",
        aggregatorID: "WAD-00000",
      ]
    ]
  ],
  parameters: [
    currCodes: [
      currCode: "EUR"
    ]
  ],
  preference: [
    airlinePreferences: [
      airline: [
        airlineID: "C9"
      ]
    ],
    farePreferences: [
      farePreferences: [
        types: [
          type: [
             code: "759"
          ]
        ]
      ]
    ],
    cabinPreferences: [
      cabinType: [
        code: "M",
        definition: "Economy/coach discounted"
      ]
    ]
  ]
]
