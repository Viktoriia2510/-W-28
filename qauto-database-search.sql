-- 1. Знайти власників у яких у імені є послідовність букв "am";

SELECT *
FROM user_profiles
WHERE name LIKE '%am%'

-- 2. Знайти найбільшу витрату серед Audi;

SELECT 
(SELECT MAX(totalCost)
FROM expenses), carBrandId
FROM cars
WHERE carBrandId = 1
LIMIT 1;

-- 3. Знайти кількість моделей у брендів AUDI та BMW. Вивести стовпчики count_models (кількість моделей) та car_id (id бренду)

SELECT COUNT(title) AS count_models, carBrandId AS car_id
FROM car_models
GROUP BY carBrandId
LIMIT 2;

-- 4. Знайдіть кількість власників за марками та моделями автомобілів. Вивести три стовпчики car_model, car_barnd і user_count

SELECT cars.carModelId AS car_model, cars.carBrandId AS car_brand, COUNT(cars.userId) AS user_count
FROM cars
GROUP BY cars.carModelId, cars.carBrandId;

-- 5.  Знайти імена юзерів, у яких є машини;

SELECT name
FROM user_profiles
JOIN cars ON user_profiles.userId = cars.userId
