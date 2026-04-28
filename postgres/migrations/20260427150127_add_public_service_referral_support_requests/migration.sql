-- AlterTable
ALTER TABLE "match"."support_requests" ADD COLUMN     "public_services_referral" BOOLEAN,
ADD COLUMN     "referral_date" TIMESTAMP(3);
