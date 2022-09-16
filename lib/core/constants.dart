// Issuance Request
const issuanceRequestCallback =
    "https://coinprit-5623.web.app/vc/issue/callback";
const presentationRequestCallback =
    "https://us-central1-coinprit-5623.cloudfunctions.net/handlePresentationStatus";
const verifiedIDRequestAuthority = "did:web:coinprit-5623.web.app";
const verifiableCredentialType = "KYC";
const issuanceRequestManifest =
    "https://verifiedid.did.msidentity.com/v1.0/tenants/e9a7472d-74f4-4871-b527-44a29e97a357/verifiableCredentials/contracts/ZTlhNzQ3MmQtNzRmNC00ODcxLWI1MjctNDRhMjllOTdhMzU3a3lj/manifest";
const tenantID = "e9a7472d-74f4-4871-b527-44a29e97a357";

// URLs
const createIssuanceRequestURL =
    "https://verifiedid.did.msidentity.com/v1.0/verifiableCredentials/createIssuanceRequest";
const createPresentationRequestURL =
    "https://verifiedid.did.msidentity.com/v1.0/verifiableCredentials/createPresentationRequest";