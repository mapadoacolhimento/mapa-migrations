-- CreateEnum
CREATE TYPE "public"."discovery_channel" AS ENUM ('Instagram', 'Facebook', 'LinkedIn', 'Google/pesquisa na internet', 'Menção em jornal, revista ou TV', 'Menção em podcast', 'Indicação de outra voluntária', 'Indicação de mulher acolhida', 'Evento, palestra ou curso', 'Universidade ou escola', 'Outro');

-- AlterTable
ALTER TABLE "public"."volunteers" ADD COLUMN     "discovery_channel" "public"."discovery_channel";
