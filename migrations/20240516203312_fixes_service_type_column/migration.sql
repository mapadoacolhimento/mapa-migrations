/*
  Warnings:

  - You are about to drop the column `serviceType` on the `public_services` table. All the data in the column will be lost.
  - Added the required column `service_type` to the `public_services` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public_services"."public_services" DROP COLUMN "serviceType",
ADD COLUMN     "service_type" VARCHAR(400) NOT NULL;
