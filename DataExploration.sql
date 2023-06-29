Select *
From CovidDeath
Order By 3,4;

Select *
From CovidVaccination
Order By 3,4;

-- Select Data that we are going to use
Select location, date1, total_cases, new_cases, total_deaths, population
From CovidDeath
Order by 1,2;

-- Total cases vs Total deaths
-- Shows likelihood of dying if you contract covid in this place
Select location, date1, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercent
From CovidDeath 
Where location Like 'Indi%'
Order by 1,2;

-- Total cases vs Population
-- Shows percent of population who got covid
Select location, date1, population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
From CovidDeath 
Where location Like '%states%'
Order by 1,2;

-- Looking at countries with highest infection rate comapred to Population
Select location, population, MAX(total_cases) As HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From CovidDeath
Group by location, population
Order by PercentPopulationInfected desc;

-- Highest DeathCount per Population
Select location, population, MAX(total_deaths) As HighestDeathCount, MAX((total_deaths/population))*100 as PercentPopulationDeath   
From CovidDeath
Group by location, population
Order by HighestDeathCount desc;


-- BREAK THINGS BY CONTINENT

-- Highest DeathCount per Continent
Select continent, MAX(total_deaths) As HighestDeathCount  
From CovidDeath
-- Where continent IS NOT NULL
Group by continent
Order by HighestDeathCount desc;


-- Total Population vs Vaccinations
Select dea.continent, dea.location, dea.date1, dea.population, vac.new_vaccinations, SUM(vac.new_vaccinations) OVER (Partition By dea.location
Order by dea.location, dea.date1) As RollingPeopleVaccinated
From CovidDeath dea
JOIN CovidVaccination vac
	ON dea.location = vac.location
    AND dea.date1 = vac.date1
Where dea.continent <> ''
Order By 2,3;

-- WITH CTE
With Popvsvac (Continent, Location, Date, Population, New_Vaccination, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date1, dea.population, vac.new_vaccinations, SUM(vac.new_vaccinations) OVER (Partition By dea.location
Order by dea.location, dea.date1) As RollingPeopleVaccinated
From CovidDeath dea
JOIN CovidVaccination vac
	ON dea.location = vac.location
    AND dea.date1 = vac.date1
Where dea.continent <> ''
Order By 2,3
)
Select *
From Popvsvac;