@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true

define root view entity ZC_FE_Travel_001364
  as projection on ZI_FE_Travel_001364
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @EndUserText.label: 'Travel'
      @ObjectModel.text.element: [ 'Description' ]
      TravelID,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element: 'AgencyID'
        }
      } ]

      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: [ 'Agencyname' ]
      AgencyID,
      _Agency.Name       as Agencyname,


      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: ['LastName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
      CustomerID,
      _Customer.LastName as LastName,

      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,
      Description,
      @EndUserText.label: 'Status'
      @ObjectModel.text.element: ['TravelStatusText']
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZI_FE_STAT_001364', element: 'TravelStatusId'  } }]
      OverallStatus,
      OverallStatusCriticality,
      _TravelStatus.TravelStatusText as TravelStatusText,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      @EndUserText.label: 'Last Changed At'
      LocalLastChangedAt,
      _Booking : redirected to composition child ZC_FE_Booking_001364,
      _Agency,
      _Currency,
      _Customer,
      _TravelStatus

}
