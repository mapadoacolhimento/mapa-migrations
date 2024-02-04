-- CreateTable
CREATE TABLE "auth_group" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(150) NOT NULL,

    CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_group_permissions" (
    "id" BIGSERIAL NOT NULL,
    "group_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,

    CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_permission" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "content_type_id" INTEGER NOT NULL,
    "codename" VARCHAR(100) NOT NULL,

    CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_user" (
    "id" SERIAL NOT NULL,
    "password" VARCHAR(128) NOT NULL,
    "last_login" TIMESTAMPTZ(6),
    "is_superuser" BOOLEAN NOT NULL,
    "username" VARCHAR(150) NOT NULL,
    "first_name" VARCHAR(150) NOT NULL,
    "last_name" VARCHAR(150) NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "is_staff" BOOLEAN NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "date_joined" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "auth_user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_user_groups" (
    "id" BIGSERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,

    CONSTRAINT "auth_user_groups_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_user_user_permissions" (
    "id" BIGSERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,

    CONSTRAINT "auth_user_user_permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cities" (
    "city_id" SERIAL NOT NULL,
    "city_value" VARCHAR(100) NOT NULL,
    "city_label" VARCHAR(100) NOT NULL,
    "state" VARCHAR(2) NOT NULL,
    "ibge_code" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "cities_pkey" PRIMARY KEY ("city_id")
);

-- CreateTable
CREATE TABLE "django_admin_log" (
    "id" SERIAL NOT NULL,
    "action_time" TIMESTAMPTZ(6) NOT NULL,
    "object_id" TEXT,
    "object_repr" VARCHAR(200) NOT NULL,
    "action_flag" SMALLINT NOT NULL,
    "change_message" TEXT NOT NULL,
    "content_type_id" INTEGER,
    "user_id" INTEGER NOT NULL,

    CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "django_content_type" (
    "id" SERIAL NOT NULL,
    "app_label" VARCHAR(100) NOT NULL,
    "model" VARCHAR(100) NOT NULL,

    CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "django_migrations" (
    "id" BIGSERIAL NOT NULL,
    "app" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "applied" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "django_session" (
    "session_key" VARCHAR(40) NOT NULL,
    "session_data" TEXT NOT NULL,
    "expire_date" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key")
);

-- CreateTable
CREATE TABLE "integrations_logs" (
    "id" BIGSERIAL NOT NULL,
    "type" VARCHAR(30) NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "status" VARCHAR(30) NOT NULL,
    "error" TEXT NOT NULL,
    "data" JSONB NOT NULL,
    "integration" VARCHAR(15) NOT NULL,
    "external_id" INTEGER,
    "form_type" VARCHAR(15) NOT NULL,
    "internal_id" INTEGER,

    CONSTRAINT "volunteers_integrationlogs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "msrs" (
    "id" BIGSERIAL NOT NULL,
    "user_zendesk_id" INTEGER,
    "name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "cpf" VARCHAR(11) NOT NULL,
    "color" VARCHAR(15) NOT NULL,
    "gender" VARCHAR(15) NOT NULL,
    "whatsapp" VARCHAR(11) NOT NULL,
    "state" VARCHAR(2) NOT NULL,
    "city_id" INTEGER NOT NULL,
    "neighborhood" VARCHAR(100) NOT NULL,
    "latitude" DECIMAL(10,4) NOT NULL,
    "logintude" DECIMAL(10,4) NOT NULL,
    "pcd" BOOLEAN NOT NULL,
    "education" VARCHAR(40) NOT NULL,
    "work_situation" VARCHAR(40) NOT NULL,
    "income" DECIMAL(10,2) NOT NULL,
    "duration_of_violence" VARCHAR(30) NOT NULL,
    "author_of_violence" VARCHAR(30) NOT NULL,
    "story" TEXT NOT NULL,
    "risk_factors" VARCHAR(140) NOT NULL,
    "protective_factors" VARCHAR(100) NOT NULL,
    "public_service" VARCHAR(100) NOT NULL,
    "type_of_support" VARCHAR(20) NOT NULL,
    "access" VARCHAR(30) NOT NULL,
    "status" VARCHAR(15) NOT NULL,
    "support_on_queue" BOOLEAN NOT NULL,
    "on_queue" BOOLEAN NOT NULL,
    "online" BOOLEAN NOT NULL,
    "priority" VARCHAR(15) NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "match" BOOLEAN NOT NULL,
    "digital_violence" VARCHAR(200) NOT NULL,
    "obstetric_violence" VARCHAR(100) NOT NULL,
    "physical_violence" VARCHAR(100) NOT NULL,
    "property_violence" VARCHAR(100) NOT NULL,
    "psych_violence" VARCHAR(100) NOT NULL,
    "sexual_violence" VARCHAR(100) NOT NULL,

    CONSTRAINT "msrs_msrs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "msrs_formdata" (
    "id" BIGSERIAL NOT NULL,
    "stage" VARCHAR(20) NOT NULL,
    "values" JSONB NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "msrs_formdata_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "volunteer_availability" (
    "volunteer_id" INTEGER NOT NULL,
    "current_matches" INTEGER NOT NULL,
    "max_matches" INTEGER NOT NULL,
    "is_available" BOOLEAN NOT NULL,
    "support_type" VARCHAR(20) NOT NULL,
    "support_expertise" VARCHAR(200) NOT NULL,
    "offers_online_support" BOOLEAN NOT NULL,
    "lat" DECIMAL(10,4),
    "lng" DECIMAL(10,4),
    "city" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "state" VARCHAR(9) NOT NULL,
    "offers_libras_support" BOOLEAN NOT NULL,

    CONSTRAINT "volunteer_availability_pkey" PRIMARY KEY ("volunteer_id")
);

-- CreateTable
CREATE TABLE "volunteer_status_history" (
    "id" BIGSERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "volunteer_id" INTEGER NOT NULL,
    "status" VARCHAR(30) NOT NULL,

    CONSTRAINT "volunteer_status_history_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "volunteers" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "condition" VARCHAR(30) NOT NULL,
    "first_name" VARCHAR(200) NOT NULL,
    "last_name" VARCHAR(200) NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "phone" VARCHAR(100) NOT NULL,
    "zipcode" VARCHAR(9) NOT NULL,
    "state" VARCHAR(9) NOT NULL,
    "city" VARCHAR(100) NOT NULL,
    "neighborhood" VARCHAR(100) NOT NULL,
    "latitude" DECIMAL(10,4),
    "longitude" DECIMAL(10,4),
    "register_number" VARCHAR(400) NOT NULL,
    "birth_date" TIMESTAMPTZ(6) NOT NULL,
    "color" VARCHAR(100) NOT NULL,
    "gender" VARCHAR(100) NOT NULL,
    "modality" VARCHAR(100) NOT NULL,
    "fields_of_work" VARCHAR(200) NOT NULL,
    "years_of_experience" VARCHAR(100) NOT NULL,
    "approach" VARCHAR(100),
    "form_data_id" BIGINT,
    "occupation" VARCHAR(12) NOT NULL,
    "moodle_id" INTEGER,
    "form_entries_id" BIGINT,
    "zendesk_user_id" BIGINT,
    "availability" INTEGER NOT NULL,
    "offers_libras_support" BOOLEAN NOT NULL,
    "street" VARCHAR(200),

    CONSTRAINT "volunteers_volunteer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "volunteers_formdata" (
    "id" BIGSERIAL NOT NULL,
    "type_form" VARCHAR(10) NOT NULL,
    "step" INTEGER NOT NULL,
    "values" JSONB NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "total_steps" INTEGER NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "volunteers_formdata_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "auth_group_name_key" ON "auth_group"("name");

-- CreateIndex
CREATE INDEX "auth_group_name_a6ea08ec_like" ON "auth_group"("name");

-- CreateIndex
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions"("group_id");

-- CreateIndex
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions"("permission_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions"("group_id", "permission_id");

-- CreateIndex
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission"("content_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission"("content_type_id", "codename");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_username_key" ON "auth_user"("username");

-- CreateIndex
CREATE INDEX "auth_user_username_6821ab7c_like" ON "auth_user"("username");

-- CreateIndex
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups"("group_id");

-- CreateIndex
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups"("user_id", "group_id");

-- CreateIndex
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions"("permission_id");

-- CreateIndex
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions"("user_id", "permission_id");

-- CreateIndex
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log"("content_type_id");

-- CreateIndex
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type"("app_label", "model");

-- CreateIndex
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session"("expire_date");

-- CreateIndex
CREATE INDEX "django_session_session_key_c0390e0f_like" ON "django_session"("session_key");

-- CreateIndex
CREATE INDEX "msrs_msrs_city_id_e49bad88" ON "msrs"("city_id");

-- CreateIndex
CREATE INDEX "volunteer_status_history_volunteer_id_d1e0ea8c" ON "volunteer_status_history"("volunteer_id");

-- CreateIndex
CREATE INDEX "volunteers_volunteer_form_data_id_ec6c5a18" ON "volunteers"("form_data_id");

-- CreateIndex
CREATE UNIQUE INDEX "volunteers_formdata_user_id_key" ON "volunteers_formdata"("user_id");

-- AddForeignKey
ALTER TABLE "auth_group_permissions" ADD CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_group_permissions" ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_permission" ADD CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_user_groups" ADD CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_user_groups" ADD CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_user_user_permissions" ADD CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_user_user_permissions" ADD CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "django_admin_log" ADD CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "django_admin_log" ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "msrs" ADD CONSTRAINT "msrs_msrs_city_id_e49bad88_fk_cities_city_id" FOREIGN KEY ("city_id") REFERENCES "cities"("city_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "volunteer_availability" ADD CONSTRAINT "volunteer_availability_volunteer_id_ff544bbb_fk_volunteers_id" FOREIGN KEY ("volunteer_id") REFERENCES "volunteers"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "volunteer_status_history" ADD CONSTRAINT "volunteer_status_history_volunteer_id_d1e0ea8c_fk_volunteers_id" FOREIGN KEY ("volunteer_id") REFERENCES "volunteers"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "volunteers" ADD CONSTRAINT "volunteers_volunteer_form_data_id_ec6c5a18_fk_volunteer" FOREIGN KEY ("form_data_id") REFERENCES "volunteers_formdata"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "volunteers_formdata" ADD CONSTRAINT "volunteers_formdata_user_id_c9262138_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

