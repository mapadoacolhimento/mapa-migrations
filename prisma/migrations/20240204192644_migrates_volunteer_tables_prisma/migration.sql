/*
  Warnings:

  - You are about to drop the column `birth_date` on the `volunteers` table. All the data in the column will be lost.
  - You are about to drop the `integrations_logs` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `msrs` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `msrs_formdata` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `volunteers_formdata` table. If the table is not empty, all the data it contains will be lost.
  - Changed the type of `support_type` on the `volunteer_availability` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `birthdate` to the `volunteers` table without a default value. This is not possible if the table is not empty.

*/
-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "match";

-- CreateEnum
CREATE TYPE "match"."support_type" AS ENUM ('psychological', 'legal');

-- DropForeignKey
ALTER TABLE "public"."msrs" DROP CONSTRAINT "msrs_msrs_city_id_e49bad88_fk_cities_city_id";

-- DropForeignKey
ALTER TABLE "public"."volunteer_availability" DROP CONSTRAINT "volunteer_availability_volunteer_id_ff544bbb_fk_volunteers_id";

-- DropForeignKey
ALTER TABLE "public"."volunteer_status_history" DROP CONSTRAINT "volunteer_status_history_volunteer_id_d1e0ea8c_fk_volunteers_id";

-- DropForeignKey
ALTER TABLE "public"."volunteers" DROP CONSTRAINT "volunteers_volunteer_form_data_id_ec6c5a18_fk_volunteer";

-- DropForeignKey
ALTER TABLE "public"."volunteers_formdata" DROP CONSTRAINT "volunteers_formdata_user_id_c9262138_fk_auth_user_id";

-- DropIndex
DROP INDEX "public"."volunteer_status_history_volunteer_id_d1e0ea8c";

-- DropIndex
DROP INDEX "public"."volunteers_volunteer_form_data_id_ec6c5a18";

-- AlterTable
ALTER TABLE "public"."cities" ALTER COLUMN "created_at" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "created_at" SET DATA TYPE TIMESTAMP(6),
ALTER COLUMN "updated_at" SET DATA TYPE TIMESTAMP(6);

-- AlterTable
ALTER TABLE "public"."volunteer_availability" DROP COLUMN "support_type",
ADD COLUMN     "support_type" "match"."support_type" NOT NULL,
ALTER COLUMN "created_at" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "created_at" SET DATA TYPE TIMESTAMP(6),
ALTER COLUMN "updated_at" SET DATA TYPE TIMESTAMP(6);

-- AlterTable
ALTER TABLE "public"."volunteer_status_history" ALTER COLUMN "created_at" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "created_at" SET DATA TYPE TIMESTAMP(6);

-- AlterTable
ALTER TABLE "public"."volunteers" RENAME CONSTRAINT "volunteers_volunteer_pkey" TO "volunteers_pkey";
ALTER TABLE "public"."volunteers" DROP COLUMN "birth_date";
ALTER TABLE "public"."volunteers" ADD COLUMN "birthdate" TIMESTAMP(6) NOT NULL;
ALTER TABLE "public"."volunteers" ALTER COLUMN "created_at" SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE "public"."volunteers" ALTER COLUMN "created_at" SET DATA TYPE TIMESTAMP(6);
ALTER TABLE "public"."volunteers" ALTER COLUMN "updated_at" SET DATA TYPE TIMESTAMP(6);

-- DropTable
DROP TABLE "public"."integrations_logs";

-- DropTable
DROP TABLE "public"."msrs";

-- DropTable
DROP TABLE "public"."msrs_formdata";

-- DropTable
DROP TABLE "public"."volunteers_formdata";

-- CreateTable
CREATE TABLE "public"."volunteer_integration_logs" (
    "id" BIGSERIAL NOT NULL,
    "type" VARCHAR(30) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" VARCHAR(30) NOT NULL,
    "error" TEXT NOT NULL,
    "data" JSONB NOT NULL,
    "integration" VARCHAR(15) NOT NULL,
    "external_id" INTEGER,
    "form_type" VARCHAR(15) NOT NULL,
    "internal_id" INTEGER,

    CONSTRAINT "volunteer_integration_logs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."volunteer_form_data" (
    "id" BIGSERIAL NOT NULL,
    "type_form" VARCHAR(10) NOT NULL,
    "step" INTEGER NOT NULL,
    "values" JSONB NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total_steps" INTEGER NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "volunteer_form_data_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "volunteer_form_data_user_id_key" ON "public"."volunteer_form_data"("user_id");

-- AddForeignKey
ALTER TABLE "public"."volunteer_availability" ADD CONSTRAINT "volunteer_availability_volunteer_id_fkey" FOREIGN KEY ("volunteer_id") REFERENCES "public"."volunteers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."volunteer_status_history" ADD CONSTRAINT "volunteer_status_history_volunteer_id_fkey" FOREIGN KEY ("volunteer_id") REFERENCES "public"."volunteers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."volunteers" ADD CONSTRAINT "volunteers_form_data_id_fkey" FOREIGN KEY ("form_data_id") REFERENCES "public"."volunteer_form_data"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."volunteer_form_data" ADD CONSTRAINT "volunteer_form_data_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
