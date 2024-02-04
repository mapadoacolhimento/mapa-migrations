import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  // const MSR_ZENDESK_USER_ID = 401191540912;
  const THERAPIST_ZENDESK_USER_ID = 417544904932;
  const LAWYER_ZENDESK_USER_ID = 423092711812;
  // const PSYCHOLOGICAL_ZENDESK_TICKET_ID = 25774;
  // const LEGAL_ZENDESK_TICKET_ID = 25776;

  const therapistVolunteer = await prisma.volunteers.create({
    data: {
      condition: 'disponivel',
      firstName: 'Teste Psi',
      lastName: 'Local',
      email: 'dev.psi.mapa@gmail.com',
      phone: '11911991199',
      zipcode: '01303020',
      state: 'SP',
      city: 'SAO PAULO',
      neighborhood: 'Centro',
      latitude: -23.55242,
      longitude: -46.65735,
      registrationNumber: '123123123',
      birthdate: new Date('1999-01-02'),
      color: 'black',
      gender: 'cis_female',
      modality: 'not_found',
      fieldsOfWork: 'not_found',
      yearsOfExperience: '5_ou_mais',
      approach: 'not_found',
      occupation: 'psychologist',
      moodleId: null,
      formEntriesId: null,
      zendeskUserId: THERAPIST_ZENDESK_USER_ID,
      availability: 3,
      offersLibrasSupport: true,
      street: 'Rua da Consolação',
      volunteer_availability: {
        create: {
          currentMatches: 0,
          maxMatches: 3,
          isAvailable: true,
          supportType: 'psychological',
          supportExpertise: 'not_found',
          offersOnlineSupport: true,
          lat: -23.55242,
          lng: -46.65735,
          city: 'SAO PAULO',
          state: 'SP',
          offersLibrasSupport: false,
        },
      },
    },
  });

  const lawyerVolunteer = await prisma.volunteers.create({
    data: {
      condition: 'disponivel',
      firstName: 'Teste Advogada',
      lastName: 'Local',
      email: 'dev.adv.mapa@gmail.com',
      phone: '11911991199',
      zipcode: '01303020',
      state: 'SP',
      city: 'SAO PAULO',
      neighborhood: 'Centro',
      latitude: -23.55242,
      longitude: -46.65735,
      registrationNumber: '123123123',
      birthdate: new Date('1999-01-02'),
      color: 'black',
      gender: 'cis_female',
      modality: 'not_found',
      fieldsOfWork: 'not_found',
      yearsOfExperience: '5_ou_mais',
      approach: 'not_found',
      occupation: 'lawyer',
      moodleId: null,
      formEntriesId: null,
      zendeskUserId: LAWYER_ZENDESK_USER_ID,
      availability: 3,
      offersLibrasSupport: true,
      street: 'Rua da Consolação',
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
      volunteer_availability: {
        create: {
          currentMatches: 0,
          maxMatches: 3,
          isAvailable: true,
          supportType: 'legal',
          supportExpertise: 'not_found',
          offersOnlineSupport: true,
          lat: -23.55242,
          lng: -46.65735,
          city: 'SAO PAULO',
          state: 'SP',
          offersLibrasSupport: true,
        },
      },
    },
  });

  // use these payloads to send a support req to /compose endpoint
  // const psychologicalSupportRequest = await prisma.supportRequests.create({
  //   data: {
  //     msrId: MSR_ZENDESK_USER_ID,
  //     zendeskTicketId: PSYCHOLOGICAL_ZENDESK_TICKET_ID,
  //     supportType: "psychological",
  //     priority: null,
  //     supportExpertise: null,
  //     hasDisability: null,
  //     requiresLibras: null,
  //     acceptsOnlineSupport: true,
  //     lat: -23.55242,
  //     lng: -46.65735,
  //     city: "SAO PAULO",
  //     state: "SP",
  //     status: "open",
  //   },
  // });

  // const legalSupportRequest = await prisma.supportRequests.create({
  //   data: {
  //     msrId: MSR_ZENDESK_USER_ID,
  //     zendeskTicketId: LEGAL_ZENDESK_TICKET_ID,
  //     supportType: "legal",
  //     priority: null,
  //     supportExpertise: null,
  //     hasDisability: null,
  //     requiresLibras: null,
  //     acceptsOnlineSupport: true,
  //     lat: -23.55242,
  //     lng: -46.65735,
  //     city: "SAO PAULO",
  //     state: "SP",
  //     status: "open",
  //   },
  // });

  const newMatchFeatureFlag = await prisma.featureFlag.create({
    data: {
      featureName: 'NEW_MATCH',
      featureEnabled: true,
    },
  });

  const city = await prisma.cities.create({
    data: {
      cityValue: 'SAO PAULO',
      cityLabel: 'SÃO PAULO',
      state: 'SP',
      ibgeCode: 123,
    },
  });

  console.log({
    therapistVolunteer,
    lawyerVolunteer,
    newMatchFeatureFlag,
    city,
    // psychologicalSupportRequest,
    // legalSupportRequest,
  });
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })

  .catch(async (e) => {
    console.error(e);

    await prisma.$disconnect();

    process.exit(1);
  });
