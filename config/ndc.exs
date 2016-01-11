use Mix.Config

config :ndc_ex_sdk,

label: "KRO",
rest: [
    url: "https://ndc-sandbox.herokuapp.com/api/v0/ndc/",
    headers: [
      "Accept": "application/xml",
      "Content-Type": "application/xml",
      "Content-Type": "application/xml"
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
        airlineID: "FA",
        name: "Fake Air",
        agentUser: [
          name: "Travel Fake",
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
        airlineID: "FA"
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
