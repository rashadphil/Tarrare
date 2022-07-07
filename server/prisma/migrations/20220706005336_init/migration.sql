-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_universityId_fkey";

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "dateCreated" DROP NOT NULL,
ALTER COLUMN "emailVerified" SET DEFAULT false,
ALTER COLUMN "universityId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_universityId_fkey" FOREIGN KEY ("universityId") REFERENCES "University"("id") ON DELETE SET NULL ON UPDATE CASCADE;
