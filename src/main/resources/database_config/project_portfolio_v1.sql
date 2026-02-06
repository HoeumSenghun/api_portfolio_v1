-- Single-row profile table (personal info)
CREATE TABLE profile (
                         id              INT PRIMARY KEY CHECK (id = 1),
                         full_name       VARCHAR(100)          NOT NULL,
                         title           VARCHAR(150)          NOT NULL,
                         summary         TEXT                  NOT NULL,
                         email           VARCHAR(100)          NOT NULL
                             CHECK (email ~* '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$'),
                         github_url      VARCHAR(255),
                         linkedin_url    VARCHAR(255),
                         website_url     VARCHAR(255),
                         created_at      TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
                         updated_at      TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Skills
CREATE TABLE skills (
                        id          SERIAL PRIMARY KEY,
                        name        VARCHAR(100)    NOT NULL,
                        level       VARCHAR(50)
                            CHECK (level IN ('Beginner', 'Intermediate', 'Advanced', 'Expert')),
                        category    VARCHAR(50)     NOT NULL,   -- Frontend, Backend, Database, Tool, etc.
                        sort_order  INT             DEFAULT 0,
                        created_at  TIMESTAMPTZ     DEFAULT CURRENT_TIMESTAMP,
                        UNIQUE (name, category)
);

-- Projects
CREATE TABLE projects (
                          id              SERIAL PRIMARY KEY,
                          title           VARCHAR(150)    NOT NULL,
                          short_description VARCHAR(300),
                          description     TEXT,
                          tech_stack      VARCHAR(255),           -- comma separated or JSON later
                          project_url     VARCHAR(255),
                          github_url      VARCHAR(255),
                          image_url       VARCHAR(255),           -- main / thumbnail
                          is_featured     BOOLEAN         DEFAULT FALSE,
                          sort_order      INT             DEFAULT 0,
                          created_at      TIMESTAMPTZ     DEFAULT CURRENT_TIMESTAMP,
                          updated_at      TIMESTAMPTZ     DEFAULT CURRENT_TIMESTAMP
);

-- Experience
CREATE TABLE experience (
                            id              SERIAL PRIMARY KEY,
                            company_name    VARCHAR(150)    NOT NULL,
                            position        VARCHAR(150)    NOT NULL,
                            location        VARCHAR(100),
                            description     TEXT,
                            start_date      DATE            NOT NULL,
                            end_date        DATE,
                            is_current      BOOLEAN         DEFAULT FALSE,
                            sort_order      INT             DEFAULT 0,
                            created_at      TIMESTAMPTZ     DEFAULT CURRENT_TIMESTAMP,
                            updated_at      TIMESTAMPTZ     DEFAULT CURRENT_TIMESTAMP,
                            CONSTRAINT valid_date_range CHECK (
                                end_date IS NULL OR end_date >= start_date
                                )
);

-- Education
CREATE TABLE education (
                           id              SERIAL PRIMARY KEY,
                           institution     VARCHAR(150)    NOT NULL,
                           degree          VARCHAR(150)    NOT NULL,
                           field           VARCHAR(150),
                           start_year      INT             NOT NULL,
                           end_year        INT,
                           description     TEXT,
                           sort_order      INT             DEFAULT 0,
                           created_at      TIMESTAMPTZ     DEFAULT CURRENT_TIMESTAMP,
                           updated_at      TIMESTAMPTZ     DEFAULT CURRENT_TIMESTAMP,
                           CONSTRAINT valid_year_range CHECK (
                               end_year IS NULL OR end_year >= start_year
                               )
);

-- Contact form submissions
CREATE TABLE contact_messages (
                                  id          SERIAL PRIMARY KEY,
                                  name        VARCHAR(100)    NOT NULL,
                                  email       VARCHAR(100)    NOT NULL,
                                  message     TEXT            NOT NULL,
                                  status      VARCHAR(20)     DEFAULT 'NEW'
                                      CHECK (status IN ('NEW', 'READ', 'REPLIED', 'ARCHIVED', 'SPAM')),
                                  created_at  TIMESTAMPTZ     DEFAULT CURRENT_TIMESTAMP
);

-- Admin users (basic version – improve security in application layer)
CREATE TABLE admin_user (
                            id              SERIAL PRIMARY KEY,
                            username        VARCHAR(50)     UNIQUE NOT NULL,
                            password_hash   VARCHAR(255)    NOT NULL,   -- use bcrypt/argon2
                            email           VARCHAR(100)    UNIQUE,
                            role            VARCHAR(20)     DEFAULT 'ADMIN',
                            is_active       BOOLEAN         DEFAULT TRUE,
                            created_at      TIMESTAMPTZ     DEFAULT CURRENT_TIMESTAMP,
                            last_login      TIMESTAMPTZ
);

-- many-to-many relationship
CREATE TABLE project_skill (
    project_id  INT REFERENCES projects(id) ON DELETE CASCADE,
    skill_id    INT REFERENCES skills(id)   ON DELETE CASCADE,
    PRIMARY KEY (project_id, skill_id)
);

-- multiple media per project
CREATE TABLE project_media (
    id          SERIAL PRIMARY KEY,
    project_id  INT             NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    url         VARCHAR(255)    NOT NULL,
    media_type  VARCHAR(20)     DEFAULT 'IMAGE'
        CHECK (media_type IN ('IMAGE','VIDEO','PDF','OTHER')),
    caption     VARCHAR(200),
    sort_order  INT             DEFAULT 0,
    is_thumbnail BOOLEAN        DEFAULT FALSE,
    created_at  TIMESTAMPTZ     DEFAULT CURRENT_TIMESTAMP
);