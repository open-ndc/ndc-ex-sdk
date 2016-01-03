use Mix.Config

config :ndc_ex_sdk,

label: "KRO",
rest: [
    url: "http://kronos.jrtechnologies.com/dondc",
    headers: [
      "Accept": "application/xml",
      "Content-Type": "application/xml",
      "AuthorizationKey": "5uctrqudxcda8zb28f86m88j"
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
