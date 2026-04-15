-- AlterTable
ALTER TABLE "survey"."volunteer_legal_support_conclusion" ALTER COLUMN "jurisdiction" DROP NOT NULL,
ALTER COLUMN "used_gender_precedents" DROP NOT NULL,
ALTER COLUMN "used_human_rights_arguments" DROP NOT NULL,
ALTER COLUMN "psychological_document_used" DROP NOT NULL,
ALTER COLUMN "case_conduction_details" DROP NOT NULL;
