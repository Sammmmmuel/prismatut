import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

async function main() {
    await prisma.user.deleteMany()
    const users = await prisma.user.createMany({
        data: [{
            name: "sam",
            email: "sam@test.com",
            age: 21,
        },{
            name: "sean",
            email: "sean@test.com",
            age: 27,
        }]
    })
    console.log(users)
}


main()
    .catch(e => {
        console.error(e.message)
    })
    .finally(async () => {
        await prisma.$disconnect()
    })