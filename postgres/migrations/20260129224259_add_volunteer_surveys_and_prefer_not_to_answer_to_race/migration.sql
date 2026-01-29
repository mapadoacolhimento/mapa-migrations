-- CreateEnum
CREATE TYPE "survey"."disability_type" AS ENUM ('physical', 'visual', 'hearing', 'intellectual', 'psychic', 'multiple', 'not_pcd');

-- CreateEnum
CREATE TYPE "survey"."weekly_hours" AS ENUM ('one_hour', 'two_hours', 'three_to_five_hours', 'more_than_five_hours');

-- CreateEnum
CREATE TYPE "survey"."contract_format" AS ENUM ('remote', 'in_person', 'hybrid');

-- CreateEnum
CREATE TYPE "survey"."violence_awareness" AS ENUM ('yes', 'no', 'insufficient_input');

-- CreateEnum
CREATE TYPE "survey"."main_demand_category" AS ENUM ('family_law', 'criminal_law', 'labor_law', 'property_rights', 'justice_system_info', 'other');

-- CreateEnum
CREATE TYPE "survey"."pro_bono_status" AS ENUM ('yes', 'no', 'not_applicable');

-- CreateEnum
CREATE TYPE "survey"."safety_plan_used" AS ENUM ('yes', 'no', 'not_applicable');

-- CreateEnum
CREATE TYPE "survey"."psychologist_contact" AS ENUM ('in_contact', 'not_in_contact', 'not_receiving_support');

-- CreateEnum
CREATE TYPE "survey"."lawyer_contact" AS ENUM ('in_contact', 'not_in_contact', 'not_receiving_support');

-- CreateEnum
CREATE TYPE "survey"."public_service_referral_type" AS ENUM ('referral_with_interruption', 'articulation_with_continuity', 'not_applicable');

-- CreateEnum
CREATE TYPE "survey"."public_service_referral_reason" AS ENUM ('physical_psychological_risk', 'mental_health_demand', 'social_vulnerability', 'exceeds_scope', 'no_need_identified');

-- CreateEnum
CREATE TYPE "survey"."psychologist_collaboration" AS ENUM ('yes', 'no', 'not_applicable');

-- CreateEnum
CREATE TYPE "survey"."lawyer_collaboration" AS ENUM ('yes', 'no', 'not_applicable');

-- CreateEnum
CREATE TYPE "survey"."support_satisfaction" AS ENUM ('yes', 'no', 'not_applicable');

-- CreateEnum
CREATE TYPE "survey"."extra_contact_frequency" AS ENUM ('once_a_week', 'twice_a_week', 'three_or_more_times_a_week', 'on_weekends');

-- CreateEnum
CREATE TYPE "survey"."irregular_attendance_reason" AS ENUM ('missed_without_notice', 'forgetfulness', 'last_minute_cancellation', 'domestic_care_overload', 'prevented_by_perpetrator', 'other', 'not_applicable');

-- CreateEnum
CREATE TYPE "survey"."interruption_reason" AS ENUM ('volunteer_suspension_or_exit', 'msr_not_eligible', 'no_bonding', 'msr_opted_out', 'msr_disappeared', 'conflict_of_interest', 'schedule_incompatibility', 'divergent_legal_area', 'support_outside_project', 'msr_needs_in_person', 'public_service_referral_needed');

-- CreateEnum
CREATE TYPE "survey"."redirect_area_needed" AS ENUM ('civil', 'family', 'labor', 'criminal');

-- CreateEnum
CREATE TYPE "survey"."exit_or_suspend" AS ENUM ('exit', 'suspend');

-- CreateEnum
CREATE TYPE "survey"."suspension_category" AS ENUM ('one_month', 'three_months', 'six_months');

-- CreateEnum
CREATE TYPE "survey"."suspension_reason" AS ENUM ('vacation', 'work_or_study', 'maternity', 'health', 'other');

-- AlterEnum
ALTER TYPE "public"."race" ADD VALUE 'prefer_not_to_answer';

-- CreateTable
CREATE TABLE "survey"."legal_support_follow_up_i" (
    "answer_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "disability_type" "survey"."disability_type",
    "support_start_date" DATE NOT NULL,
    "has_pro_bono_contract" BOOLEAN NOT NULL,
    "weekly_hours" "survey"."weekly_hours" NOT NULL,
    "contract_format" "survey"."contract_format" NOT NULL,
    "safe_contact_methods" TEXT[],
    "violence_awareness" "survey"."violence_awareness" NOT NULL,
    "violence_types" TEXT[],
    "behavioral_impacts" TEXT[],
    "relationship_impacts" TEXT[],
    "socioeconomic_impacts" TEXT[],
    "security_impacts" TEXT[],
    "violence_assessment" TEXT NOT NULL,
    "main_demand_category" "survey"."main_demand_category" NOT NULL,
    "main_demand_subcategory" TEXT,
    "case_conduction_details" TEXT NOT NULL,
    "pro_bono_in_case_files" "survey"."pro_bono_status" NOT NULL,
    "safety_plan_used" "survey"."safety_plan_used" NOT NULL,
    "safety_plan_description" TEXT,
    "violence_process_impacts" TEXT[],
    "psychological_document_used" BOOLEAN NOT NULL,
    "legal_challenges_exist" BOOLEAN NOT NULL,
    "legal_challenges" TEXT,
    "public_service_referral" "survey"."public_service_referral_type",
    "public_service_referral_reason" "survey"."public_service_referral_reason",
    "public_services_articulated" TEXT[],
    "psychologist_contact" "survey"."psychologist_contact" NOT NULL,
    "psychologist_collaboration" "survey"."psychologist_collaboration" NOT NULL,
    "suicide_risk_concern" BOOLEAN NOT NULL,
    "gender_procedural_abuse" BOOLEAN NOT NULL,
    "gender_procedural_abuse_report" BOOLEAN,
    "team_response_to_report" TEXT,
    "volunteer_feelings" TEXT,
    "need_technical_support_last_45d" BOOLEAN NOT NULL,
    "technical_support_help" TEXT[],
    "still_need_help" TEXT,
    "support_satisfaction" "survey"."support_satisfaction" NOT NULL,
    "suggestions" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "legal_support_follow_up_i_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "survey"."legal_support_follow_up_ii" (
    "answer_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "still_in_support" BOOLEAN NOT NULL,
    "weekly_hours" "survey"."weekly_hours" NOT NULL,
    "respects_agreements" BOOLEAN NOT NULL,
    "extra_contact_frequency" "survey"."extra_contact_frequency",
    "agreement_issues_description" TEXT,
    "violence_awareness" "survey"."violence_awareness" NOT NULL,
    "new_violence_since_last_form" BOOLEAN NOT NULL,
    "new_violence_types" TEXT[],
    "behavioral_impacts" TEXT[],
    "relationship_impacts" TEXT[],
    "socioeconomic_impacts" TEXT[],
    "security_impacts" TEXT[],
    "violence_assessment" TEXT NOT NULL,
    "main_demand_category" "survey"."main_demand_category" NOT NULL,
    "main_demand_description" TEXT NOT NULL,
    "legal_process_stage" TEXT,
    "safety_plan_used" "survey"."safety_plan_used" NOT NULL,
    "safety_plan_description" TEXT,
    "violence_process_impacts" TEXT[],
    "case_conduction_details" TEXT NOT NULL,
    "latest_case_update" TEXT NOT NULL,
    "pro_bono_in_case_files" BOOLEAN NOT NULL,
    "psychological_document_used" BOOLEAN NOT NULL,
    "legal_challenges_exist" BOOLEAN NOT NULL,
    "legal_challenges" TEXT,
    "public_service_referral_reason" "survey"."public_service_referral_reason",
    "public_services_articulated" TEXT[],
    "psychologist_contact" "survey"."psychologist_contact" NOT NULL,
    "psychologist_collaboration" "survey"."psychologist_collaboration" NOT NULL,
    "suicide_risk_concern" BOOLEAN NOT NULL,
    "gender_procedural_abuse" BOOLEAN NOT NULL,
    "gender_procedural_abuse_report" BOOLEAN,
    "team_response_to_report" TEXT,
    "volunteer_feelings" TEXT,
    "requested_technical_support_90d" BOOLEAN NOT NULL,
    "technical_support_help" TEXT[],
    "still_need_help" TEXT,
    "suggestions" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "legal_support_follow_up_ii_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "survey"."volunteer_legal_support_conclusion" (
    "answer_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "support_end_date" DATE NOT NULL,
    "weekly_hours" "survey"."weekly_hours" NOT NULL,
    "respects_agreements" BOOLEAN NOT NULL,
    "pro_bono_in_case_files" BOOLEAN NOT NULL,
    "violence_awareness" BOOLEAN NOT NULL,
    "violence_types" TEXT[],
    "behavioral_impacts" TEXT[],
    "relationship_impacts" TEXT[],
    "socioeconomic_impacts" TEXT[],
    "security_impacts" TEXT[],
    "violence_assessment" TEXT NOT NULL,
    "main_demand_category" "survey"."main_demand_category" NOT NULL,
    "main_demand_description" TEXT NOT NULL,
    "safety_plan_used" "survey"."safety_plan_used" NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "used_gender_precedents" BOOLEAN NOT NULL,
    "used_human_rights_arguments" BOOLEAN NOT NULL,
    "psychological_document_used" BOOLEAN NOT NULL,
    "case_conduction_details" TEXT NOT NULL,
    "violence_process_impacts" TEXT[],
    "legal_challenges" TEXT,
    "expected_outcome_achieved" TEXT NOT NULL,
    "public_service_referral_reason" "survey"."public_service_referral_reason",
    "public_services_articulated" TEXT[],
    "psychologist_contact" "survey"."psychologist_contact" NOT NULL,
    "psychologist_collaboration" "survey"."psychologist_collaboration" NOT NULL,
    "psychologist_collaboration_learnings" TEXT,
    "gender_procedural_abuse" BOOLEAN NOT NULL,
    "gender_procedural_abuse_report" BOOLEAN,
    "team_response_to_report" TEXT,
    "lessons_learned" TEXT,
    "challenges_faced" TEXT,
    "volunteer_feelings" TEXT,
    "requested_technical_support" BOOLEAN NOT NULL,
    "technical_support_help" TEXT[],
    "support_satisfaction" "survey"."support_satisfaction" NOT NULL,
    "message_to_team" TEXT,
    "suggestions" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "volunteer_legal_support_conclusion_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "survey"."psychological_support_follow_up_i" (
    "answer_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "disability_type" "survey"."disability_type",
    "support_start_date" DATE NOT NULL,
    "has_pro_bono_contract" BOOLEAN NOT NULL,
    "has_absence_policy" BOOLEAN NOT NULL,
    "contract_format" "survey"."contract_format" NOT NULL,
    "safe_contact_methods" TEXT[],
    "violence_awareness" "survey"."violence_awareness" NOT NULL,
    "violence_types" TEXT[],
    "behavioral_impacts" TEXT[],
    "relationship_impacts" TEXT[],
    "socioeconomic_impacts" TEXT[],
    "security_impacts" TEXT[],
    "violence_assessment" TEXT NOT NULL,
    "main_demand" TEXT[],
    "case_conduction_details" TEXT NOT NULL,
    "safety_plan_used" "survey"."safety_plan_used" NOT NULL,
    "safety_plan_description" TEXT,
    "clinical_difficulties_exist" BOOLEAN NOT NULL,
    "clinical_difficulties" TEXT,
    "bonding_strategies" TEXT NOT NULL,
    "case_referrals" TEXT[],
    "public_service_referral_reason" "survey"."public_service_referral_reason",
    "public_services_articulated" TEXT[],
    "lawyer_contact" "survey"."lawyer_contact" NOT NULL,
    "lawyer_collaboration" "survey"."lawyer_collaboration" NOT NULL,
    "suicide_risk_concern" BOOLEAN NOT NULL,
    "has_psychiatric_support" BOOLEAN NOT NULL,
    "volunteer_feelings" TEXT,
    "need_technical_support_last_45d" BOOLEAN NOT NULL,
    "technical_support_help" TEXT[],
    "still_need_help" TEXT,
    "support_satisfaction" "survey"."support_satisfaction" NOT NULL,
    "suggestions" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "psychological_support_follow_up_i_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "survey"."psychological_support_follow_up_ii" (
    "answer_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "still_in_support" BOOLEAN NOT NULL,
    "is_attendance_regular" BOOLEAN NOT NULL,
    "irregular_attendance_reason" "survey"."irregular_attendance_reason",
    "respects_agreements" BOOLEAN NOT NULL,
    "extra_contact_frequency" "survey"."extra_contact_frequency",
    "agreement_issues_description" TEXT,
    "violence_awareness" "survey"."violence_awareness" NOT NULL,
    "new_violence_since_last_form" TEXT[],
    "behavioral_impacts" TEXT[],
    "relationship_impacts" TEXT[],
    "socioeconomic_impacts" TEXT[],
    "security_impacts" TEXT[],
    "violence_assessment" TEXT NOT NULL,
    "main_demand" TEXT[],
    "case_conduction_details" TEXT,
    "safety_plan_used" "survey"."safety_plan_used" NOT NULL,
    "safety_plan_description" TEXT,
    "clinical_difficulties_exist" BOOLEAN NOT NULL,
    "clinical_difficulties" TEXT,
    "new_bonding_strategies" BOOLEAN NOT NULL,
    "new_bonding_strategies_description" TEXT,
    "public_service_referral_reason" "survey"."public_service_referral_reason",
    "public_services_articulated" TEXT[],
    "lawyer_contact" "survey"."lawyer_contact" NOT NULL,
    "lawyer_collaboration" "survey"."lawyer_collaboration" NOT NULL,
    "suicide_risk_concern" BOOLEAN NOT NULL,
    "has_psychiatric_support" BOOLEAN NOT NULL,
    "experienced_gender_violence" BOOLEAN NOT NULL,
    "reported_gender_violence" BOOLEAN,
    "team_response_to_report" TEXT,
    "volunteer_feelings" TEXT,
    "requested_technical_support_90d" BOOLEAN NOT NULL,
    "technical_support_help" TEXT[],
    "still_need_help" TEXT,
    "support_satisfaction" "survey"."support_satisfaction" NOT NULL,
    "suggestions" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "psychological_support_follow_up_ii_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "survey"."volunteer_psychological_support_conclusion" (
    "answer_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "support_end_date" DATE NOT NULL,
    "support_outside_org" BOOLEAN NOT NULL,
    "violence_awareness" BOOLEAN NOT NULL,
    "violence_types" TEXT[],
    "behavioral_impacts" TEXT[],
    "relationship_impacts" TEXT[],
    "socioeconomic_impacts" TEXT[],
    "security_impacts" TEXT[],
    "violence_assessment" TEXT NOT NULL,
    "psychological_outcomes" TEXT[],
    "safety_plan_used" "survey"."safety_plan_used" NOT NULL,
    "process_outcome_description" TEXT,
    "clinical_difficulties" TEXT,
    "bonding_strategies" TEXT,
    "skills_acquired" TEXT,
    "public_service_referral_reason" "survey"."public_service_referral_reason",
    "public_services_articulated" TEXT[],
    "lawyer_contact" "survey"."lawyer_contact" NOT NULL,
    "lawyer_collaboration" "survey"."lawyer_collaboration" NOT NULL,
    "lawyer_collaboration_learnings" TEXT,
    "experienced_gender_violence" BOOLEAN NOT NULL,
    "reported_gender_violence" BOOLEAN,
    "team_response_to_report" TEXT,
    "lessons_learned" TEXT,
    "challenges_faced" TEXT,
    "volunteer_feelings" TEXT,
    "requested_technical_support" BOOLEAN NOT NULL,
    "technical_support_help" TEXT[],
    "support_satisfaction" "survey"."support_satisfaction" NOT NULL,
    "message_to_team" TEXT,
    "suggestions" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "volunteer_psychological_support_conclusion_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "survey"."support_interruption" (
    "answer_id" SERIAL NOT NULL,
    "match_id" INTEGER NOT NULL,
    "has_different_demand_info" BOOLEAN NOT NULL,
    "different_demand_description" TEXT,
    "interruption_reason" "survey"."interruption_reason" NOT NULL,
    "redirect_area_needed" "survey"."redirect_area_needed",
    "public_services_referral" TEXT[],
    "stay_in_project" BOOLEAN NOT NULL,
    "exit_or_suspend" "survey"."exit_or_suspend",
    "suspension_category" "survey"."suspension_category",
    "suspension_reason" "survey"."suspension_reason",
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "support_interruption_pkey" PRIMARY KEY ("answer_id")
);

-- AddForeignKey
ALTER TABLE "survey"."legal_support_follow_up_i" ADD CONSTRAINT "legal_support_follow_up_i_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."legal_support_follow_up_ii" ADD CONSTRAINT "legal_support_follow_up_ii_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."volunteer_legal_support_conclusion" ADD CONSTRAINT "volunteer_legal_support_conclusion_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."psychological_support_follow_up_i" ADD CONSTRAINT "psychological_support_follow_up_i_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."psychological_support_follow_up_ii" ADD CONSTRAINT "psychological_support_follow_up_ii_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."volunteer_psychological_support_conclusion" ADD CONSTRAINT "volunteer_psychological_support_conclusion_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "survey"."support_interruption" ADD CONSTRAINT "support_interruption_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "match"."matches"("match_id") ON DELETE RESTRICT ON UPDATE CASCADE;
