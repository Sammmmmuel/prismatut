/*
  Warnings:

  - You are about to drop the column `avarageRating` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the `userPreference` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `averageRating` to the `Post` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "userPreference" DROP CONSTRAINT "userPreference_userId_fkey";

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "avarageRating",
ADD COLUMN     "averageRating" DOUBLE PRECISION NOT NULL;

-- DropTable
DROP TABLE "userPreference";

-- CreateTable
CREATE TABLE "UserPreference" (
    "id" TEXT NOT NULL,
    "emailUpdates" BOOLEAN NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "UserPreference_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UserPreference_userId_key" ON "UserPreference"("userId");

-- AddForeignKey
ALTER TABLE "UserPreference" ADD CONSTRAINT "UserPreference_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
