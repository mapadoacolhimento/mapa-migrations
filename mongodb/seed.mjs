import { PrismaClient } from '@prisma-mongodb/client';

const prisma = new PrismaClient();

async function main() {
  const form = await prisma.msrRegisterData.create({
    data:{
      email: "email@email.com"
    }
  });
  console.log(form)
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
