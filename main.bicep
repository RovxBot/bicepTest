extension microsoftGraphV1

param location string = recourceGroup().location

resource testgroup 'Microsoft.Graph/Groups@beta' = {
  displayName: 'Test Group'
  mailEnabled: false
  mailNickname: 'test-group'
  securityEnabled: true
  uniqueName: TestGroup
  owners: [managedIdentity.properties.principalId]
}

resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' = {
  name: 'test-identity'
  location: location
}
