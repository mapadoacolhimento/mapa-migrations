-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "mobilization";

-- CreateEnum
CREATE TYPE "public"."gender" AS ENUM ('cis_woman', 'trans_woman', 'not_found');

-- CreateEnum
CREATE TYPE "public"."region" AS ENUM ('norte', 'nordeste', 'centro_oeste', 'sudeste', 'sul', 'not_found');

-- CreateEnum
CREATE TYPE "public"."race" AS ENUM ('black', 'brown', 'indigenous', 'yellow', 'white', 'not_found');

-- CreateEnum
CREATE TYPE "public"."sexuality" AS ENUM ('lesbian', 'bisexual', 'heterosexual', 'asexual', 'not_found');

-- CreateEnum
CREATE TYPE "public"."religion" AS ENUM ('atheist', 'candomble', 'catholic', 'spiritist', 'evangelical', 'umbanda', 'others', 'not_found');

-- CreateEnum
CREATE TYPE "public"."education_level" AS ENUM ('basic_education', 'high_school', 'completed_undergraduate', 'incomplete_undergraduate', 'not_found');

-- CreateEnum
CREATE TYPE "mobilization"."multiplier_shift_availability" AS ENUM ('morning', 'afternoon', 'evening', 'not_found');

-- CreateEnum
CREATE TYPE "mobilization"."multiplier_university_type" AS ENUM ('public', 'private', 'not_found');

-- CreateTable
CREATE TABLE "mobilization"."multipliers" (
    "multiplier_id" SERIAL NOT NULL,
    "gender" "public"."gender" NOT NULL,
    "age" INTEGER NOT NULL,
    "region" "public"."region" NOT NULL,
    "state" VARCHAR(9) NOT NULL,
    "race" "public"."race" NOT NULL,
    "sexuality" "public"."sexuality" NOT NULL,
    "religion" "public"."religion" NOT NULL,
    "has_disability" BOOLEAN NOT NULL,
    "has_internet_access" BOOLEAN NOT NULL,
    "is_available" BOOLEAN NOT NULL,
    "shift_availability" "mobilization"."multiplier_shift_availability"[],
    "education_level" "public"."education_level" NOT NULL,
    "is_university_student" BOOLEAN NOT NULL,
    "university_type" "mobilization"."multiplier_university_type" NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "multipliers_pkey" PRIMARY KEY ("multiplier_id")
);

-- CreateTable
CREATE TABLE "mobilization"."multiplier_pii" (
    "multiplier_pii_id" SERIAL NOT NULL,
    "multiplier_id" INTEGER NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "first_name" VARCHAR(200) NOT NULL,
    "last_name" VARCHAR(400) NOT NULL,
    "phone" VARCHAR(100) NOT NULL,
    "zip_code" VARCHAR(9) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "multiplier_pii_pkey" PRIMARY KEY ("multiplier_pii_id")
);

-- CreateTable
CREATE TABLE "mobilization"."multiplier_registration_open_questions" (
    "multiplier_registration_open_questions_id" SERIAL NOT NULL,
    "multiplier_id" INTEGER NOT NULL,
    "university_name" VARCHAR(200) NOT NULL,
    "university_course" VARCHAR(200) NOT NULL,
    "how_she_heard_about_us" TEXT NOT NULL,
    "reasons_for_participating" TEXT NOT NULL,

    CONSTRAINT "multiplier_registration_open_questions_pkey" PRIMARY KEY ("multiplier_registration_open_questions_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "multiplier_pii_multiplier_id_key" ON "mobilization"."multiplier_pii"("multiplier_id");

-- CreateIndex
CREATE UNIQUE INDEX "multiplier_registration_open_questions_multiplier_id_key" ON "mobilization"."multiplier_registration_open_questions"("multiplier_id");

-- AddForeignKey
ALTER TABLE "mobilization"."multiplier_pii" ADD CONSTRAINT "multiplier_pii_multiplier_id_fkey" FOREIGN KEY ("multiplier_id") REFERENCES "mobilization"."multipliers"("multiplier_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mobilization"."multiplier_registration_open_questions" ADD CONSTRAINT "multiplier_registration_open_questions_multiplier_id_fkey" FOREIGN KEY ("multiplier_id") REFERENCES "mobilization"."multipliers"("multiplier_id") ON DELETE RESTRICT ON UPDATE CASCADE;
