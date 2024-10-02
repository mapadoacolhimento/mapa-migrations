/*
  Warnings:

  - You are about to drop the `msrs` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `msrs_formdata` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "public"."msrs" DROP CONSTRAINT "msrs_msrs_city_id_e49bad88_fk_cities_city_id";

-- DropTable
DROP TABLE "public"."msrs";

-- DropTable
DROP TABLE "public"."msrs_formdata";
