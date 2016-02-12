use Mix.Config

config :ndc_ex_sdk,

label: "KRO",
rest: [
    #url: "https://ndc-sandbox.herokuapp.com/api/v0/ndc/",
    url: "http://0.0.0.0:9292/api/v0/ndc",
    headers: [
      "Accept": "application/xml",
      "Content-Type": "application/xml",
      "Content-Type": "application/xml"
    ]
  ],

ndc: [
  Document: [
    Name: "NDC Wrapper",
    ReferenceVersion: "1.0"
  ],
  Party: [
    Sender: [
      ORA_Sender: [
        AirlineID: "C9",
        Name: "Kronos Air",
        AgentUser: [
          Name: "Travel Wadus",
          Type: "TravelManagementCompany",
          PseudoCity: "A4A",
          AgentUserID: "travelwadus",
          IATA_Number: "00000001"
        ]
      ]
    ]
  ],
  Participants: [
    Participant: [
      AggregatorParticipant: [
        Name: "Wadus NDC Gateway",
        AggregatorID: "WAD-00000",
      ]
    ]
  ],
  Parameters: [
    CurrCodes: [
      CurrCode: "EUR"
    ]
  ],
  Preferences: [
    Preference: [
      AirlinePreferences: [
        Airline: [
          AirlineID: "FA"
        ]
      ]
    ]
  ]
]
