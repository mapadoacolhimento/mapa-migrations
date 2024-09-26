-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "public_services";

-- CreateTable
CREATE TABLE "public_services"."public_services" (
    "public_service_id" SERIAL NOT NULL,
    "serviceType" VARCHAR(400) NOT NULL,
    "service_name" VARCHAR(400) NOT NULL,
    "zipcode" VARCHAR(9) NOT NULL,
    "address" VARCHAR(400) NOT NULL,
    "phone" VARCHAR(200) NOT NULL,
    "email" VARCHAR(400) NOT NULL,
    "region" VARCHAR(15) NOT NULL,
    "state" VARCHAR(9) NOT NULL,
    "city" VARCHAR(100) NOT NULL,
    "lat" DECIMAL(10,4),
    "lng" DECIMAL(10,4),
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "public_services_pkey" PRIMARY KEY ("public_service_id")
);
