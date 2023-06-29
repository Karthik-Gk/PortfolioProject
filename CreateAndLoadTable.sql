Use PortfolioProject;

CREATE TABLE CovidDeath
(
 iso_code VARCHAR(255),
 continent VARCHAR(255),
 location VARCHAR(255),
 date1 DATE,
 population BIGINT,
 total_cases BIGINT,
 new_cases BIGINT,
 new_cases_smoothed DECIMAL(15, 8),
 total_deaths BIGINT,
 new_deaths INT,
 new_deaths_smoothed DECIMAL(15, 8),
 total_cases_per_million DECIMAL(15, 8),
 new_cases_per_million DECIMAL(15, 8),
 new_cases_smoothed_per_million DECIMAL(15, 8),
 total_deaths_per_million DECIMAL(15, 8),
 new_deaths_per_million DECIMAL(15, 8),
 new_deaths_smoothed_per_million DECIMAL(15, 8),
 reproduction_rate DECIMAL(15, 8),
 icu_patients INT,
 icu_patients_per_million DECIMAL(15, 8),
 hosp_patients INT,
 hosp_patients_per_million DECIMAL(15, 8),
 weekly_icu_admissions INT,
 weekly_icu_admissions_per_million DECIMAL(15, 8),
 weekly_hosp_admissions INT,
 weekly_hosp_admissions_per_million DECIMAL(15, 8)
);

SELECT * 
FROM CovidDeath; 

SHOW VARIABLES LIKE 'secure_file_priv';
SHOW VARIABLES LIKE 'datadir';

LOAD DATA INFILE '/usr/local/mysql-8.0.30-macos12-x86_64/import/CovidDeath1.csv' INTO TABLE CovidDeath
FIELDS TERMINATED BY ','
IGNORE 1 LINES;



CREATE TABLE CovidVaccination
(
 iso_code VARCHAR(255),
 continent VARCHAR(255),
 location VARCHAR(255),
 date1 DATE,
 total_tests BIGINT,
 new_tests BIGINT,
 total_tests_per_thousand DECIMAL(15, 8),
 new_tests_per_thousand DECIMAL(15, 8),
 new_tests_smoothed INT,
 new_tests_smoothed_per_thousand DECIMAL(15, 8),
 positive_rate DECIMAL(15, 8),
 tests_per_case DECIMAL(15, 8),
tests_units	TEXT,
total_vaccinations BIGINT,
people_vaccinated BIGINT,	
people_fully_vaccinated BIGINT,	
total_boosters BIGINT,	
new_vaccinations BIGINT,	
new_vaccinations_smoothed BIGINT,	
total_vaccinations_per_hundred BIGINT,	
people_vaccinated_per_hundred BIGINT,	
people_fully_vaccinated_per_hundred BIGINT,	
total_boosters_per_hundred BIGINT,	
new_vaccinations_smoothed_per_million BIGINT,	
new_people_vaccinated_smoothed BIGINT,	
new_people_vaccinated_smoothed_per_hundred BIGINT,	
stringency_index DECIMAL(15, 8),	
population_density DECIMAL(15, 8),	
median_age DECIMAL(15, 8),	
aged_65_older DECIMAL(15, 8),	
aged_70_older DECIMAL(15, 8),	
gdp_per_capita DECIMAL(15, 8),	
extreme_poverty DECIMAL(15, 8),	
cardiovasc_death_rate DECIMAL(15, 8),	
diabetes_prevalence DECIMAL(15, 8),	
female_smokers DECIMAL(15, 8),	
male_smokers DECIMAL(15, 8),	
handwashing_facilities DECIMAL(15, 8),	
hospital_beds_per_thousand DECIMAL(15, 8),	
life_expectancy DECIMAL(15, 8),	
human_development_index DECIMAL(15, 8),	
excess_mortality_cumulative_absolute DECIMAL(15, 8),	
excess_mortality_cumulative	DECIMAL(15, 8),	
excess_mortality DECIMAL(15, 8),	
excess_mortality_cumulative_per_million DECIMAL(15, 8)
);

SELECT * 
FROM CovidVaccination; 

LOAD DATA INFILE '/usr/local/mysql-8.0.30-macos12-x86_64/import/CovidVaccination1.csv' INTO TABLE CovidVaccination
FIELDS TERMINATED BY ','
IGNORE 1 LINES;